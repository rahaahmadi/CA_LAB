----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:45 05/05/2021 
-- Design Name: 
-- Module Name:    carry_save_multiplication - Behavioral 
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

entity carry_save_multiplication is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end carry_save_multiplication;

architecture Behavioral of carry_save_multiplication is
	
	component full_adder is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
	component half_adder
		port( 
			i1, i2: in std_logic;
			sum, carry: out std_logic
		);
	end component;

	signal S: std_logic_vector(5 downto 0);	
	signal C: std_logic_vector(10 downto 0);	
	signal and_00, and_01, and_10, and_02, and_11, and_03, and_12, and_13, and_20: std_logic;
	signal and_21, and_22, and_23, and_30, and_31, and_32, and_33: std_logic;
	
begin
	
	and_00 <= A(0) and B(0);
	and_01 <= A(0) and B(1);
	and_10 <= A(1) and B(0);
	and_02 <= A(0) and B(2);
	and_11 <= A(1) and B(1);
	and_03 <= A(0) and B(3);
	and_12 <= A(1) and B(2);
	and_13 <= A(1) and B(3);
	and_20 <= A(2) and B(0);
	and_21 <= A(2) and B(1);
	and_22 <= A(2) and B(2);
	and_23 <= A(2) and B(3);
	and_30 <= A(3) and B(0);
	and_31 <= A(3) and B(1);
	and_32 <= A(3) and B(2);
	and_33 <= A(3) and B(3);
	
	P(0) <= and_00;

	HA1: half_adder port map (i1 => and_01, i2 => and_10, sum => P(1), carry => C(0));
	HA2: half_adder port map (i1 => and_02, i2 => and_11, sum => S(0), carry => C(1));
	HA3: half_adder port map (i1 => and_03, i2 => and_12, sum => S(1), carry => C(2));
	
	FA1: full_adder port map (X => and_20, Y => S(0), Cin => C(0), Sum => P(2), Cout => C(3));
	FA2: full_adder port map (X => and_21, Y => S(1), Cin => C(1), Sum => S(2), Cout => C(4));
	FA3: full_adder port map (X => and_22, Y => and_13, Cin => C(2), Sum => S(3), Cout => C(5));
	
	FA4: full_adder port map (X => and_30, Y => S(2), Cin => C(3), Sum => P(3), Cout => C(6));
	FA5: full_adder port map (X => and_31, Y => S(3), Cin => C(4), Sum => S(4), Cout => C(7));
	FA6: full_adder port map (X => and_32, Y => and_23, Cin => C(5), Sum => S(5), Cout => C(8));
	
	HA4: half_adder port map (i1 => C(6), i2 => S(4), sum => P(4), carry => C(9));
	FA7: full_adder port map (X => C(7), Y => S(5), Cin => C(9), Sum => P(5), Cout => C(10));
	FA8: full_adder port map (X => and_33, Y => C(8), Cin => C(10), Sum => P(6), Cout => P(7));

end Behavioral;

