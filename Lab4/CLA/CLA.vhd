----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:25 04/25/2021 
-- Design Name: 
-- Module Name:    CLA - Behavioral 
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

entity CLA is
    Port ( Cin : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
end CLA;

architecture Behavioral of CLA is

	component FA
		Port ( A : in  STD_LOGIC;
				 B : in  STD_LOGIC;
             Cin : in  STD_LOGIC;
             sum : out  STD_LOGIC;
             Cout : out  STD_LOGIC);
	end component;
	
	signal P, G, C_out, C_in : STD_LOGIC_VECTOR(2 downto 0);

begin

	P(0) <= A(0) XOR B(0);
	P(1) <= A(1) XOR B(1);
	P(2) <= A(2) XOR B(2);
	G(0) <= A(0) and B(0);
	G(1) <= A(1) and B(1);
	G(2) <= A(2) and B(2);
	C_in(0) <= G(0) or (P(0) and Cin);
	C_in(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
	C_in(2) <= G(2) or (P(2) and (G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin)));
		
	FA0: FA port map (A(0), B(0), Cin, sum(0), C_out(0));
	FA1: FA port map (A(1), B(1), C_in(0), sum(1), C_out(1));
	FA2: FA port map (A(2), B(2), C_in(1), sum(2), C_out(2));
	FA3: FA port map (A(3), B(3), C_in(2), sum(3), Cout);


end Behavioral;
