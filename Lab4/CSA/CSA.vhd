----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:20:07 04/26/2021 
-- Design Name: 
-- Module Name:    CSA - Behavioral 
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



entity CSA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end CSA;

architecture Behavioral of CSA is
	
	signal sum_0 : std_logic_vector ( 3 downto 0); -- sum which calculate for carry in '0' in each level
	signal sum_1 : std_logic_vector ( 3 downto 0);  -- sum which calculate for carry in '1' in each level

	
	signal carry_0 : std_logic_vector ( 3 downto 0);  -- carry which calculate for carry in '0' in each level
	signal carry_1 : std_logic_vector ( 3 downto 0);  -- carry which calculate for carry in '1' in each level


	
	component FA
		Port ( A : in  STD_LOGIC;
				 B : in  STD_LOGIC;
             Cin : in  STD_LOGIC;
             sum : out  STD_LOGIC;
             Cout : out  STD_LOGIC);
	end component;
	
	
	
	component Mux_2to1_4bit
		port( 
			A0: in std_logic_vector (3 downto 0);
			A1: in std_logic_vector (3 downto 0);
			sel: in std_logic;
			output: out std_logic_vector (3 downto 0)
		);
	end component;

	
	component Mux_2to1_1bit
		port( 
			A0: in std_logic;
			A1: in std_logic;
			sel: in std_logic;
			output: out std_logic
		);
	end component;
	
begin
	
	fa0_0 : FA port map (A(0), B(0), Cin, sum_0(0), carry_0(0));
	fa0_1 : FA port map (A(0), B(0), Cin, sum_1(0), carry_1(0));
	
	fa1_0 : FA port map (A(1), B(1), carry_0(0), sum_0(1), carry_0(1));
	fa1_1 : FA port map (A(1), B(1), carry_1(0), sum_1(1), carry_1(1));
	
	fa2_0 : FA port map (A(2), B(2), carry_0(1), sum_0(2), carry_0(2));
	fa2_1 : FA port map (A(2), B(2), carry_1(1), sum_1(2), carry_1(2));
	
	fa3_0 : FA port map (A(3), B(3), carry_0(2), sum_0(3), carry_0(3));
	fa3_1 : FA port map (A(3), B(3), carry_1(2), sum_1(3), carry_1(3));
	
		
	--muxes which used for carry
	mux_sum : Mux_2to1_4bit port map (sum_0, sum_1, Cin, sum);
	
	
	--mux to select Cout
	mux_carry : Mux_2to1_1bit port map (carry_0(3), carry_1(3), Cin, Cout);
	



end Behavioral;

