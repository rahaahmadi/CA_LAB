----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:26:11 05/05/2021 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
	component half_adder
		port( 
			i1, i2: in std_logic;
			sum, carry: out std_logic
		);
	end component;
	signal s1, c1, c2: std_logic;
begin
	HA1: half_adder port map (i1 => X, i2 => Y, sum => s1, carry => c1);
	HA2: half_adder port map (i1 => s1, i2 => Cin, sum => Sum, carry => c2);
	Cout <= c1 or c2;

end Behavioral;

