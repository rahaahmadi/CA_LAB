----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:43 04/25/2021 
-- Design Name: 
-- Module Name:    FA - Behavioral 
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

entity FA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is

	component HA
		port( 
			x, y: in std_logic;
			sum, carry: out std_logic
		);
	end component;
	
	signal s1, c1, c2: std_logic;
begin

	HA1: HA port map (A, B, s1, c1);
	HA2: HA port map (s1, Cin, sum, c2);
	Cout <= c1 or c2;

end Behavioral;

