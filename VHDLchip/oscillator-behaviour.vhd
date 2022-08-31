library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behav of oscillator is
signal intcon: std_logic;
signal wavesaw : std_logic_vector(7 downto 0);
signal wavetri : std_logic_vector(7 downto 0);
signal wavesq : std_logic_vector(7 downto 0);
signal oscillatorwave : std_logic_vector(7 downto 0);
signal prevstate : std_logic_vector(1 downto 0);
signal sreset : std_logic;
signal wave_outpre: unsigned(11 downto 0);

--signal per_div_clk: integer := 370;

component osc_counter is
    port (clk : in std_logic;
    reset : in std_logic;
    count_clk_for_freq : in std_logic_vector(11 downto 0);
    clk_osc : out std_logic
    );
end component;

component sawtooth is
    port (clk : in std_logic; 
          wave_out : out std_logic_vector(7 downto 0);
          reset :in std_logic
         );
end component;

component sqwave is
    port(clk,rst:in std_logic;
        sq_out:out std_logic_vector(7 downto 0));
end component;

component triwave is
    port(clk,rst:in std_logic;
        tri_out:out std_logic_vector(7 downto 0));
end component;

component volume_envelope is
    port(
    clk : in std_logic;
    reset : in std_logic;
    new_wave : in std_logic;
    oscillatorwave: in std_logic_vector(7 downto 0);
    volumewave : out unsigned(11 downto 0)
    );
end component;

begin

CO1: osc_counter port map (clk=>clk, reset=>res, count_clk_for_freq=>per_div_count, clk_osc=>intcon);

SAW: sawtooth port map (clk=>intcon,reset=>sreset,wave_out=>wavesaw);

SQ: sqwave port map (clk=>intcon,rst=>sreset,sq_out=>wavesq);

TRI: triwave port map (clk=>intcon,rst=>sreset,tri_out=>wavetri);

VOL: volume_envelope port map (clk=>clk, reset=>res, new_wave=>'1', oscillatorwave=>oscillatorwave, volumewave=>wave_outpre);

wave_out <= wave_outpre(11 downto 4);

com : process(clk, res)
begin
    if(rising_edge(clk)) then
        prevstate <= sel;
        if(sel/=prevstate) then
            sreset <= '1';
        else
            sreset <= '0';
        end if;
    end if;
    if(res = '1') then
        sreset <='1';
    end if;
end process com;
        
    
mux : process(clk)
begin
    if (rising_edge(clk)) then
        if (res = '0') then
            case sel is
                when "00" => oscillatorwave <= wavesaw ;
                when "01" => oscillatorwave <= wavesq ;
                when "10" => oscillatorwave <= wavetri ;
                when others => oscillatorwave <= "00000000";
            end case;
        else
            oscillatorwave<= "00000000";
        end if;
    end if;
end process mux;

end behav;
