#!/usr/bin/python3
import os
os.system("sudo pigpiod")
import mido
from mido import MidiFile
import pigpio
import time
from numpy import interp
pi1 = pigpio.pi()
# port = mido.open_input('Launchkey Mini:Launchkey Mini MIDI 1 20:0')  # open USB port

# pi1.get_PWM_frequency(2)

# modes = ["midi_listen", "midi_file"]
# mode = "midi_listen"


# pi1.set_PWM_frequency(17, 8000)
# pi1.set_PWM_frequency(18, 8000)
corlist=[16,3,4,5,6,7,8,9,10,11,12,13,14,15]


def process(msg):
    if(msg.type == 'note_on'):  # if it is Note On message
        # start signal for note on
        if msg.note in range(48, 60):
            
            # time.sleep(10)
            # filter the data by note number
            print("ON", end=" ")
            # sets dutycycle to msg.note/255 where msg.note is the midi number of the note.
            pi1.write(corlist[msg.note-48],1)
            print(msg.note)

    elif(msg.type == 'note_off'):  # if the message is not Note On (e.g. Note Off)
        # start signal for note_off
        if msg.note in range(48, 60):

            print("OFF", end=" ")
            pi1.write(corlist[msg.note-48],0)
            print(msg.note)

    elif(msg.type == "control_change"):  # the 8 knobs of the midi controller
        # Start signal for control
        value = interp(msg.value, [0, 127], [1, 254])
        if msg.control == 21:  # knob 1
            pi1.set_PWM_dutycycle(16, value)
            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 22:  # knob 2
            pi1.set_PWM_dutycycle(17, value)
            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 23:  # knob 3

            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 24:  # knob 4

            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 25:  # knob 5

            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 26:  # knob 6

            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 27:  # knob 7

            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        elif msg.control == 28:  # knob 8

            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)

        # left button of the controller. will be used for mux waveforms.
        elif msg.control == 106:
            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)
            if value >= 127:
                pi1.write(14, 1)
            else:
                pi1.write(14, 0) 
            

        elif msg.control == 107:  # right button of the controller
            print("control: ", msg.control, end=" ")
            print("MOD: ", msg.value)
            if value >= 127:
                pi1.write(15, 1)
            else:
                pi1.write(15, 0)

name='Launchkey Mini:Launchkey Mini MIDI 1 20:0'

while True:
    pi1.write(17,0)
    try:
        names=mido.get_input_names()
        for namep in names:
            if namep==name:
                port = mido.open_input('Launchkey Mini:Launchkey Mini MIDI 1 20:0')
                found=True
                while found:
                    pi1.write(17,1)
                    try:  # This filters out all non-note data
                        # port = mido.open_input('Launchkey Mini:Launchkey Mini MIDI 1 20:0')
                        # if modes[0] == mode:
                        for msg in port.iter_pending():  # if there is a message pending
                            process(msg)


                        # # if modes[1] == mode:
                        #     for msg in MidiFile('/home/pi/Desktop/EPO3/pythonscripts/Jingle-Bells-1.mid').play():
                        #         process(msg)
                        names=mido.get_input_names()
                        found2=False
                        for namep in names:
                            if name == namep:
                                found2=True
                        if found2==False:
                            found=False

                    except:
                        print("Error excepted")
                        # port = mido.open_input('Launchkey Mini:Launchkey Mini MIDI 1 20:0')  # open USB port
                        break
                
    except:
        pass
