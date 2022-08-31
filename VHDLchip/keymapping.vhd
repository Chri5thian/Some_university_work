library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.notes_freq_counts.all;

entity mapper is 
port (
    clk : in std_logic;
    rst : in std_logic;
    note1 : in std_logic;
    note2 : in std_logic;
    note3 : in std_logic;
    note4 : in std_logic;
    note5 : in std_logic;
    note6 : in std_logic;
    note7 : in std_logic;
    note8 : in std_logic;
    note9 : in std_logic;
    note10 : in std_logic;
    note11 : in std_logic;
    note12 : in std_logic;
    osc_on1 : out std_logic;
    osc_freq1 : out std_logic_vector(11 downto 0);
    osc_on2 : out std_logic;
    osc_freq2 : out std_logic_vector(11 downto 0);
    osc_on3 : out std_logic;
    osc_freq3 : out std_logic_vector(11 downto 0)
);

end mapper;

architecture behavior of mapper is
    signal key_rem1, key_rem2, key_rem3, key_rem4, key_rem5, key_rem6, key_rem7, key_rem8, key_rem9, key_rem10, key_rem11, key_rem12: std_logic;
    signal key_rem1_new, key_rem2_new, key_rem3_new, key_rem4_new, key_rem5_new, key_rem6_new, key_rem7_new, key_rem8_new, key_rem9_new, key_rem10_new, key_rem11_new, key_rem12_new: std_logic;
    signal count,new_count : integer;
    signal osc_freq_intern1 : std_logic_vector(11 downto 0);
    signal osc_freq_intern2 : std_logic_vector(11 downto 0);
    signal osc_freq_intern3 : std_logic_vector(11 downto 0);
    signal osc_freq_intern1_new : std_logic_vector(11 downto 0);
    signal osc_freq_intern2_new : std_logic_vector(11 downto 0);
    signal osc_freq_intern3_new : std_logic_vector(11 downto 0);
    signal note1_intern, note2_intern, note3_intern, note4_intern, note5_intern, note6_intern, note7_intern, note8_intern, note9_intern, note10_intern, note11_intern, note12_intern: std_logic;

    type key_type is (key1, key2, key3, key4, key5, key6, key7, key8, key9, key10, key11, key12, key_none,recheck,key_equilibrium,delay1,delay2,delay3,delay4,delay5,delay6,delay7,delay8,delay9,delay10,delay11,delay12);
    signal keystate, keynext : key_type:=key_none;

begin
    process(clk,rst)
    begin
        if rst='1' then
            keystate<=key_none;
        elsif rising_edge(clk) then
            keystate<=keynext;
            count<=new_count;
            key_rem1<=key_rem1_new;
            key_rem2<=key_rem2_new;
            key_rem3<=key_rem3_new;
            key_rem4<=key_rem4_new;
            key_rem5<=key_rem5_new;
            key_rem6<=key_rem6_new;
            key_rem7<=key_rem7_new;
            key_rem8<=key_rem8_new;
            key_rem9<=key_rem9_new;
            key_rem10<=key_rem10_new;
            key_rem11<=key_rem11_new;
            key_rem12<=key_rem12_new;
            osc_freq_intern1<=osc_freq_intern1_new;
            osc_freq_intern2<=osc_freq_intern2_new;
            osc_freq_intern3<=osc_freq_intern3_new;
            note1_intern<=note1;
            note2_intern<=note2;
            note3_intern<=note3;
            note4_intern<=note4;
            note5_intern<=note5;
            note6_intern<=note6;
            note7_intern<=note7;
            note8_intern<=note8;
            note9_intern<=note9;
            note10_intern<=note10;
            note11_intern<=note11;
            note12_intern<=note12;

        end if;
    end process;

    process(clk, rst)
    begin
    if rising_edge(clk) then
        if(rst='1') then
                osc_on1<='0';
                osc_on2<='0';
                osc_on3<='0';
        elsif(count=1) then
                osc_on1<='1';
                osc_on2<='0';
                osc_on3<='0';
        elsif(count=2) then
                osc_on1<='1';
                osc_on2<='1';
                osc_on3<='0';
        elsif(count=3) then
                osc_on1<='1';
                osc_on2<='1';
                osc_on3<='1';
        else
                osc_on1<='0';
                osc_on2<='0';
                osc_on3<='0';
        end if;

    
    end if;
    end process;

    process(keystate,count,note1_intern,note2_intern,note3_intern,note4_intern,note5_intern,note6_intern,note7_intern,note8_intern,note9_intern,note10_intern,note11_intern,note12_intern,osc_freq_intern1,osc_freq_intern2,osc_freq_intern3,key_rem1,key_rem2,key_rem3,key_rem4,key_rem5,key_rem6,key_rem7,key_rem8,key_rem9,key_rem10,key_rem11,key_rem12)
    begin
        osc_freq_intern1_new<=osc_freq_intern1;
        osc_freq_intern2_new<=osc_freq_intern2;
        osc_freq_intern3_new<=osc_freq_intern3;
        key_rem1_new<=key_rem1;
        key_rem2_new<=key_rem2;
        key_rem3_new<=key_rem3;
        key_rem4_new<=key_rem4;
        key_rem5_new<=key_rem5;
        key_rem6_new<=key_rem6;
        key_rem7_new<=key_rem7;
        key_rem8_new<=key_rem8;
        key_rem9_new<=key_rem9;
        key_rem10_new<=key_rem10;
        key_rem11_new<=key_rem11;
        key_rem12_new<=key_rem12;
        new_count<=count;


        case keystate is
            when key_equilibrium =>
                if (note1_intern=key_rem1 and note2_intern=key_rem2 and note3_intern=key_rem3 and note4_intern=key_rem4 and note5_intern=key_rem5 and note6_intern=key_rem6 and note7_intern=key_rem7 and note8_intern=key_rem8 and note9_intern=key_rem9 and note10_intern=key_rem10 and note11_intern=key_rem11 and note12_intern=key_rem12) then
                    keynext<=recheck;
                else
                    keynext<=key_none;
                end if;
                
            when recheck =>
                keynext<=key_equilibrium;

            when key_none=> 
                new_count<=0;
                osc_freq_intern1_new<=(others=>'0');
                osc_freq_intern2_new<=(others=>'0');
                osc_freq_intern3_new<=(others=>'0');
                keynext<=key1;
                key_rem1_new<='0';
                key_rem2_new<='0';
                key_rem3_new<='0';
                key_rem4_new<='0';
                key_rem5_new<='0';
                key_rem6_new<='0';
                key_rem7_new<='0';
                key_rem8_new<='0';
                key_rem9_new<='0';
                key_rem10_new<='0';
                key_rem11_new<='0';
                key_rem12_new<='0';

            when key1 => 
                if note1_intern='1' then
                    key_rem1_new<='1';
                    new_count<=count+1;
                    keynext<=delay1;
                else        
                    keynext <= key2;
                end if; 

            when delay1 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(C4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(C4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(C4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext<=key2;


            when key2 => 
                if note2_intern='1' then
                    key_rem2_new<='1';
                    new_count<=count+1;
                    keynext<=delay2;
                else    
                    keynext <= key3;
                end if;

            when delay2 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(Cs4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(Cs4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(Cs4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext<=key3;
                    
            when key3 => 
                if note3_intern='1' then
                    key_rem3_new<='1';
                    new_count<=count+1;
                    keynext<=delay3;
                else
                    keynext <= key4;
                end if;
            
            when delay3 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(D4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(D4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(D4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key4;

            when key4 => 
                if note4_intern='1' then
                    key_rem4_new<='1';
                    new_count<=count+1;
                    keynext<=delay4;
                else
                    keynext <= key5;
                end if;

            when delay4 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(Ds4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(Ds4,12));
                    osc_freq_intern2_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(Ds4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                end if;
                keynext <= key5;

            when key5 => 
                if note5_intern='1' then
                    key_rem5_new<='1';
                    new_count<=count+1;
                    keynext<=delay5;
                else
                    keynext <= key6;
                end if;

            when delay5 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(E4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(E4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(E4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key6;
                

            when key6 =>
                if note6_intern='1' then
                    key_rem6_new<='1';
                    new_count<=count+1;
                    keynext<=delay6;

                else
                    keynext <= key7;
                end if;

            when delay6 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(F4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(F4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(F4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key7;


            when key7 =>
                if note7_intern='1' then
                    key_rem7_new<='1';
                    new_count<=count+1;
                    keynext<=delay7;
                else
                    keynext <= key8;
                end if;

            when delay7 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(Fs4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(Fs4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(Fs4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;    
            keynext<=key8;

            when key8 =>
                if note8_intern='1' then
                    key_rem8_new<='1';
                    new_count<=count+1;
                    keynext<=delay8;
                else
                    keynext <= key9;
                end if;
            when delay8 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(G4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(G4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(G4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key9;

            when key9 =>
                if note9_intern='1' then
                    key_rem9_new<='1';
                    new_count<=count+1;
                    keynext<=delay9;
                else
                    keynext <= key10;
                end if;

            when delay9 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(Gs4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(Gs4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(Gs4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key10;


            when key10 =>
                if note10_intern='1' then
                    key_rem10_new<='1';
                    new_count<=count+1;
                    keynext<=delay10;
                else
                    keynext <= key11;
                end if;

            when delay10 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(A4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(A4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(A4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key11;

            when key11 =>
                if note11_intern='1' then
                    key_rem11_new<='1';
                    new_count<=count+1;
                    keynext<=delay11;

                else
                    keynext <= key12;
                end if;

            when delay11 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(As4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(As4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(As4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key12;

            when key12 =>
                if note12_intern='1' then
                    key_rem12_new<='1';
                    new_count<=count+1;
                    keynext<=delay12;
                else
                    keynext <= key_equilibrium;
                end if;

            when delay12 =>
                if count=1 then
                    osc_freq_intern1_new<=std_logic_vector(to_unsigned(B4,12));
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=2 then
                    osc_freq_intern2_new<=std_logic_vector(to_unsigned(B4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern3_new<=osc_freq_intern3;
                elsif count=3 then
                    osc_freq_intern3_new<=std_logic_vector(to_unsigned(B4,12));
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                else
                    osc_freq_intern1_new<=osc_freq_intern1;
                    osc_freq_intern2_new<=osc_freq_intern2;
                    osc_freq_intern3_new<=osc_freq_intern3;
                end if;
                keynext <= key_equilibrium;
        end case;
    end process;
    osc_freq1 <= osc_freq_intern1;
    osc_freq2 <= osc_freq_intern2;
    osc_freq3 <= osc_freq_intern3;
end architecture;
