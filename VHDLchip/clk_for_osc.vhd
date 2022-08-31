
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity osc_counter is
--generic(
--    count_clk_for_freq : integer
--);
port (clk : in std_logic;
    reset : in std_logic; 
    count_clk_for_freq : in std_logic_vector(11 downto 0);
    clk_osc : out std_logic
);
end osc_counter;

architecture behavioral of osc_counter is
signal count, new_count, count_clk_for_freq_integer : integer;
begin

count_clk_for_freq_integer <= to_integer(unsigned(count_clk_for_freq));

statereg: process (clk, reset)
begin
    if (rising_edge (clk)) then
        if (reset = '1') then
            count <=  0;
		clk_osc <= '0';
        else
            if (new_count<=integer(count_clk_for_freq_integer/2)) then --was eerst count
                clk_osc<='1';
            else
                clk_osc<='0';
            end if;
          	count <= new_count;

        end if;
    end if;
end process;
combinatorial: process (count, new_count,count_clk_for_freq_integer)
begin
    if count<=count_clk_for_freq_integer then
        new_count <= count + 1;
    else
        new_count <=  0; 

    end if;
end process;
end architecture behavioral;

