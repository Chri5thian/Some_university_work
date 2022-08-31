library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity oscillator is
    port(
        clk: in std_logic;
        res : in std_logic;
        sel : in std_logic_vector(1 downto 0);
	per_div_count : in std_logic_vector(11 downto 0);
        wave_out : out unsigned(7 downto 0)
    );
end oscillator;

