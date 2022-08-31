library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity  waveform_mux is
    port(
	clk:in std_logic;
    sel : out std_logic_vector(1 downto 0);
    left_button_ex : in std_logic;
    right_button_ex : in std_logic
	);
end waveform_mux;

architecture behavioural of waveform_mux is
signal check : std_logic:= '0';
type state is (square_press, square_release, sawtooth_press, sawtooth_release, triangle_press, triangle_release);
signal left_button,right_button : std_logic;
signal stateMoore_reg,stateMoore : state:=square_release;

begin
    process(clk)
    begin
    if rising_edge(clk) then
        stateMoore<=stateMoore_reg;
        left_button<=left_button_ex;
        right_button<=right_button_ex;
    end if;
    end process;


    process(stateMoore,left_button,right_button)
    begin
        case stateMoore is
            when square_release =>
                sel <="00";
                if left_button='1' then
                    stateMoore_reg <= sawtooth_press;
                elsif right_button='1' then
                    stateMoore_reg <= triangle_press;
                else    
                stateMoore_reg <= square_release;
                end if;
            when sawtooth_release =>
                sel <="01";
                if left_button='1' then
                    stateMoore_reg <= triangle_press;
                elsif right_button='1' then
                    stateMoore_reg <= square_press;
                else 
                    stateMoore_reg <= sawtooth_release;
                end if;

            when triangle_release =>
                sel <="10";
                if left_button='1' then
                    stateMoore_reg <= square_press;
                elsif right_button='1' then
                    stateMoore_reg <= sawtooth_press;
                else 
                    stateMoore_reg <= triangle_release;
                end if;
        
            when square_press =>
                sel <="00";
                if left_button='1' then
                    stateMoore_reg <= square_press;
                elsif right_button='1' then
                    stateMoore_reg <= square_press;
                else 
                    stateMoore_reg <= square_release;
                end if;
            
            when sawtooth_press =>
                sel <="01";
                if left_button='1' then
                    stateMoore_reg <= sawtooth_press;
                elsif right_button='1' then
                    stateMoore_reg <= sawtooth_press;
                else 
                    stateMoore_reg <= sawtooth_release;
                end if;
            
            when triangle_press =>
                sel <="10";
                if left_button='1' then
                    stateMoore_reg <= triangle_press;
                elsif right_button='1' then
                    stateMoore_reg <= triangle_press;
                else 
                    stateMoore_reg <= triangle_release;
                end if;

        end case;
    end process;
end behavioural;