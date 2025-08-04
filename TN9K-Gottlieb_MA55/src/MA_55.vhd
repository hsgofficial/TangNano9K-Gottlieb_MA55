-- VHDL implementation of the Gottlieb MA-55 sound board used in System 80 pinball machines. Panthera, 
-- Spiderman, Circus, CounterForce, StarRace, James Bond 007, Time Line, Force II, Pink Panther, 
-- Volcano (export), Black Hole (export), Devil's Dare (export), Eclipse (export).
-- S1 through S8 are sound control lines, all input signals are active-low. Sound_Tones is only 
-- supported on a few games, later ones will crash if this is set to tones mode.
-- Original hardware used a 6530 RRIOT, this is based on an adaptation to replace the RRIOT with a 
-- more commonly available 6532 RIOT and separate ROM. Some general info on the operation of the MA-55 
-- board can be found here http://www.flipprojets.fr/AudioMA55_EN.php
-- (c)2015 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- Changelog:
-- V0.5 initial release
-- V1.0 minor cleanup, added list of supported games
-------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-------------------------------------------------------------------------------------------
entity MA_55 is
	port(
		clk_358		:	in	std_logic; -- 3.58 MHz clock
		dac_clk		:	in	std_logic; -- DAC clock, 30-100 MHz works well
		Reset_l		:	in  std_logic; -- Reset, active low
		Test		:	in 	std_logic; -- Test button, active low
		Attract		:	in	std_logic:= '0'; -- 0 Enables attract mode, 1 disables
		Sound_Tones	:	in	std_logic := '1'; -- Most games need this set to 1 (Sound mode)
		S1			:   in	std_logic := '1';
		S2			: 	in  std_logic := '1';
		S4			:	in  std_logic := '1';
		S8			:	in 	std_logic := '1';
		Spare		:	in 	std_logic; -- Extra input line, unknown if any games use this
		Audio_O		: 	out	std_logic
		);
end MA_55;
-------------------------------------------------------------------------------------------

architecture rtl of MA_55 is

signal clkCount		    : std_logic_vector(1 downto 0);
signal cpu_clk			: std_logic;
signal phi2				: std_logic;
--
signal cpu_addr		    : std_logic_vector(11 downto 0);
signal cpu_din			: std_logic_vector(7 downto 0);
signal cpu_dout		    : std_logic_vector(7 downto 0);
signal cpu_wr_n	    	: std_logic := '1';
--
signal maskrom_dout 	: std_logic_vector(7 downto 0);
signal prom_dout		: std_logic_vector(7 downto 0);
--
signal riot_dout		: std_logic_vector(7 downto 0);
signal riot_pb			: std_logic_vector(7 downto 0);
signal riot_cs1  		: std_logic := '0';
signal riot_cs2_n		: std_logic := '1';
signal riot_rs_n		: std_logic := '1';
signal riot_addr		: std_logic_vector(6 downto 0);
--
signal audio			: std_logic_vector(7 downto 0);
--------------------------------------------------------------------------
begin

--------------------------------------------------------------------------
Clock_div: process(clk_358) -- Divide 3.58 MHz from PLL down to 895 kHz CPU clock
begin
	if rising_edge(clk_358) then
		ClkCount <= ClkCount + 1;
		cpu_clk <= ClkCount(1);
	end if;
end process;
--------------------------------------------------------------------------
U1: entity work.T65 -- Real circuit used 6503, same as 6502 but fewer pins
port map(
	Mode    			=> "00",
	Res_n   			=> reset_l,
	Enable  			=> '1',
	Clk     			=> cpu_clk,
	Rdy     			=> '1',
	Abort_n 			=> '1',
	IRQ_n   			=> '1',
	NMI_n   			=> test,
	SO_n    			=> '1',
	R_W_n 			=> cpu_wr_n,
	A(11 downto 0)	=> cpu_addr,       
	DI     			=> cpu_din,
	DO    			=> cpu_dout
	);
-------------------------------------------------------------------------	
U2: entity work.RIOT -- Should be 6530 RRIOT but using a RIOT instead with a separate ROM
port map(
	PHI2   => phi2,
   RES_N  => reset_l,
   CS1    => riot_cs1,
   CS2_N  => riot_cs2_n,
   RS_N   => riot_rs_n,
   R_W    => cpu_wr_n,
   A      => riot_addr,
   D_I	 => cpu_dout,
	D_O	 => riot_dout,
	PA_I	 => x"00",
   PA_O   => audio,
	DDRA_O => open,
   PB_I   => riot_pb,
	PB_O	 => open,
	DDRB_O => open,
	IRQ_N  => open
   );
------------------------------------------------------------------------
U2_MaskROM: entity work.RRIOT_6530_sys80_prom -- This is the mask ROM contained within the 6530 RRIOT
port map(
	addr 	=> cpu_addr(9 downto 0),
	clk		=> clk_358, 
	data	=> maskrom_dout
	);
------------------------------------------------------------------------	
U4: entity work.snd_prom -- PROM containing the game-specific sound codes
port map(
	addr 	=> cpu_addr(9 downto 0),
	clk		=> clk_358,
	data	=> prom_dout
	);
------------------------------------------------------------------------
U3: entity work.DAC
  generic map(
  msbi_g => 7)
port  map(
   clk_i   => dac_clk,
   res_n_i => reset_l,
   dac_i   => audio,
   dac_o   => audio_O
);
-----------------------------------------------------------------------
-- Phase 2 clock is complement of CPU clock
phi2 <= not cpu_clk; 

-- Option switches
riot_pb(4) <= attract; -- Attract mode sounds enable
riot_pb(7) <= sound_tones; --sound_tones; -- Sound or tones mode, many games lack tone support and require this to be high 

-- Sound selection inputs
riot_pb(0) <= (not S1);
riot_pb(1) <= (not S2);
riot_pb(2) <= (not S4);
riot_pb(3) <= (not S8);
riot_pb(6) <= (not Spare); -- Spare is not used by Black Hole, unknown if any games used it

-- Address decoding
cpu_din <=
	riot_dout when riot_cs1 = '1' and riot_cs2_n = '0' else
	maskrom_dout when cpu_addr(11) = '1' and cpu_addr(10) = '1' else
--	"1111" & 
prom_dout when cpu_addr(11) = '0' and cpu_addr(10) = '1' else
	x"FF";

riot_cs1 <= (not cpu_addr(11));
riot_cs2_n <= cpu_addr(10);
riot_rs_n <= cpu_addr(9);
riot_pb(5) <= riot_cs2_n;

-- RIOT address lines adapted to match RRIOT configuration
riot_addr(3 downto 0) <= cpu_addr(3 downto 0);
riot_addr(4) <= '1';
riot_addr(6 downto 5) <= cpu_addr(5 downto 4);
-------------------------------------------------------------------------
end rtl;	