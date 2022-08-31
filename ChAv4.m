% test of EPOCommunications interface to KITT
% this version: show the car in a plot window; WASD interaction
% plot using uifigure (which has limited functionality)
%
% Alle-Jan van der Veen, TU Delft, 13 May 2020

% the directory "carmodel" contains the scripts and needs to be in the path:
% addpath carmodel -begin

clear variables;% needed to clear the internal state of EPOCommunications

TRUE = 1;
FALSE = 0;
ChA = FALSE; % while loop variable

comport = '\\.\COM32';
channels = 15:19;
Fs = 48000;             %sample frequency [Hz]
second_rec = 3;         %time of recording [s]
bitcode = '1c96ecd5';   %transmitted bits [-], e.g. 'aa55aa55'
F_carrier = 10000;      %carrier frequency [Hz], e.g. 8000
F_bit = 6000;           %bit frequency [Hz], e.g. 5000
C_repetition = 2000;    %repetition count [-], e.g. 2500
load('refsignal.mat');

resultOpen = EPOCommunications('open', comport)
EPOCommunications('transmit', ['C0x', bitcode]);
EPOCommunications('transmit', ['F', int2str(F_carrier)]);
EPOCommunications('transmit', ['B', int2str(F_bit)]);
EPOCommunications('transmit', ['R', int2str(C_repetition)]);

TimeRec = round(second_rec*Fs);
fnc_init_playrec(Fs);

Aloc=[400, 400] % target location A [x,y]
%Aloc=[50 450] % target location A [x,y]
plotDestination(Aloc(1),Aloc(2))

state='A' % initial state

ERROR=0.05 % Error marge for when the kitt is alligned to the target
ERRORDISTANCE_A=50 % Distance error for A
count = 0;


theta=1/2*pi
x_buf=240;
y_buf=0;
plotPosition(x_buf,y_buf,theta) %start location and orientation
Speed='M155' % forward speed of the kitt
SteerSpeed = 'M156'
EPOCommunications('transmit','M154') %tering langzaam
while ChA == FALSE,
    try
        
        pause(2)
        EPOCommunications('transmit','M150')
        pause(1)
        tic
        EPOCommunications('transmit', 'A1');
        data = fnc_record_playrec(TimeRec, channels); % mic recording
        EPOCommunications('transmit', 'A0');
        
        [x1,y1] = localize(data,Fs,refsignal) % TDAO localization
        [x_buf,y_buf, redo] = OutlierDetection(x1,y1,100, x_buf, y_buf)% discards outliers 
        
        time=toc;
        
        if redo == 1
            if count == 3
                disp('Destination almost reached.');
                break;                
            end
            EPOCommunications('transmit','M160')
            pause(0.5)
            EPOCommunications('transmit','M150')
            count = count + 1;
            continue
        end
        count = 0;
        x=[x_buf,y_buf]; % filtered location
        p = norm(x-Aloc,2)
        
        
        theta=angle(x,x2); % angle of the kitt  with respect to x axes
        theta2=angle(Aloc,x);  % angle of the vector form the kitt to the target  with respect to x axes
        
        [L,R]=getDistance(); % unused
        
        plotPosition(x(1),x(2),theta) %plot position and orientation kitt
        if norm(x-Aloc,2) <ERRORDISTANCE_A  % if in kitt the errordistance value from target than transition to state B
            EPOCommunications('transmit','M150')
            EPOCommunications('transmit','D150')
            disp('Destination A reached!')
            plotDestinationReached(x(1),x(2))
            [y,Fs] = audioread('sfx-victory4.mp3');
            player = audioplayer(y,Fs);
            play(player)
            ChA = TRUE;
            break;
        end
        
        
        if mod(theta-theta2,2*pi)<ERROR*pi || mod(theta-theta2,2*pi)>(2-ERROR)*pi  % when the kitt is alligned to the target
            EPOCommunications('transmit','D150')
            EPOCommunications('transmit',Speed)
        elseif mod(theta-theta2,2*pi)<pi % If the difference between the kitt angle and target engle modulo 2pi is less then pi turn rigth
            EPOCommunications('transmit','D100')
            EPOCommunications('transmit',SteerSpeed)
            
        elseif mod(theta-theta2,2*pi)>pi % If the difference between the kitt angle and target engle modulo 2pi is less then pi turn left
            EPOCommunications('transmit','D200')
            EPOCommunications('transmit',SteerSpeed)
        end

        
        
    catch
        disp('Missing sample or error')
    end
    x2=x;
  
end

EPOCommunications('close')

% end of script

%---------------------------------------------------------------------------


function theta = angle(x,y)
% This function gives the angle between vector x and y
% 0 <= theta <= 2*pi

% vector element differences:
deltax=x(1)-y(1);
deltay=x(2)-y(2);

if deltax>=0 && deltay>0 % fist quadrant
    theta=atan(deltay/deltax); % returns 0 to 1/2 * pi
    
elseif deltax>=0 && deltay<0 % fourth quadrant
    theta=atan(deltay/deltax)+2*pi; % returns 3/2 *pi to 2*pi
    
elseif  deltax<=0 && deltay>0 % second quadrant
    theta=atan(deltay/deltax)+pi; % returns 1/2 * pi to pi
    
elseif deltax<=0 && deltay<0 % third quadrant
    theta=atan(deltay/deltax)+pi;  % returns pi to  3/2 *pi
    
elseif deltax==0 % to prevent problems due to zero division
    if deltay>0
        theta=0;
    elseif deltay<0
        theta=pi;
    end
    
    
end

end

function [distL,distR]=getDistance()
distance = EPOCommunications('transmit', 'Sd')
%app.DistanceEditField.Value = distance;
%fprintf(app.fid,'%s',distance);
if length(distance) > 12
    distL = str2double(distance(4:6));
    distR = str2double(distance(11:13));
    
else
    distL = str2double(distance(4:5));
    distR = str2double(distance(10:11));
end
end

function [apprX,apprY]= approx(x,y,theta,v,s)
apprX= x+cos(theta)*v*s
apprY= y+sin(theta)*v*s
end

function [x_buf,y_buf, redo] = OutlierDetection(x,y,range, x_prev, y_prev)
    
    x_new = x;
    y_new = y;
    redo = 0;
    % x_buf = 240;
    % y_buf = 0;
    
    if x_new < 0
        if x_new > -20
            x_buf = 0;
        else
            x_buf = x_prev;
            redo = 1;
        end
    else
        if x_new > 480
            if x_new < 500
                x_buf = 480;
            else
                x_buf = x_prev;
                redo = 1;
            end

        else
            if abs(x_new-x_prev)> range
                x_buf = x_prev;
                redo = 1;
            else
                x_buf = x_new;
            end
        end
    end  
    
    if redo == 0
        if y_new < 0
            if y_new > -20
                y_buf = 0;
            else
                y_buf = y_prev;
                x_buf = x_prev;
                redo = 1;
            end
        else 
            if y_new > 480
                if y_new < 500
                    y_buf = 480;
                else
                    y_buf = y_prev;
                    x_buf = x_prev;
                    redo = 1;
                end
            else
                if abs(y_new-y_prev)> range
                    y_buf = y_prev;
                    x_buf = x_prev;
                    redo = 1;
                else
                    y_buf = y_new;
                end 
            end
        end
    else
        y_buf = y_prev;
    end
end