----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:08:38 04/26/2021 
-- Design Name: 
-- Module Name:    Mux_2to1_4bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_2to1_4bit is
    Port ( A0 : in  STD_LOGIC_VECTOR (3 downto 0);
           A1 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux_2to1_4bit;

architecture Behavioral of Mux_2to1_4bit is

	component Mux_2to1_1bit
		port( 
			A0, A1, sel: in std_logic;
			output: out std_logic
		);
		
	end component;
	

begin

		m0 :Mux_2to1_1bit port map (A0(0), A1(0), sel, output(0));
		m1 :Mux_2to1_1bit port map (A0(1), A1(1), sel, output(1));
		m2 :Mux_2to1_1bit port map (A0(2), A1(2), sel, output(2));
		m3 :Mux_2to1_1bit port map (A0(3), A1(3), sel, output(3));


end Behavioral;

