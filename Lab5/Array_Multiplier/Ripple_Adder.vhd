----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:41 04/25/2021 
-- Design Name: 
-- Module Name:    Ripple_Adder - Behavioral 
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

entity Ripple_Adder is
    Port ( Cin : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
			  sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is

	component FA
		Port ( A : in  STD_LOGIC;
             B : in  STD_LOGIC;
             Cin : in  STD_LOGIC;
             sum : out  STD_LOGIC;
             Cout : out  STD_LOGIC);
	end component;
	
	signal carry : std_logic_VECTOR(2 downto 0);
		
begin
	
	FA0: FA port map (A(0), B(0), Cin, sum(0), carry(0));
	FA1: FA port map (A(1), B(1), carry(0), sum(1), carry(1));
	FA2: FA port map (A(2), B(2), carry(1), sum(2), carry(2));
	FA3: FA port map (A(3), B(3), carry(2), sum(3), Cout);

end Behavioral;

