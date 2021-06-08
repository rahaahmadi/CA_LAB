----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:20:17 05/10/2021 
-- Design Name: 
-- Module Name:    Array_Multiplier - Behavioral 
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


entity Array_Multiplier is 
    Port(
			A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0));
end Array_Multiplier;

architecture Behavioral of Array_Multiplier is

component Ripple_Adder is
    Port ( Cin : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
			  sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
end component;

signal p_pro0 : std_logic_vector (3 downto 0);
signal p_pro1 : std_logic_vector (3 downto 0);
signal p_pro2 : std_logic_vector (3 downto 0);
signal p_pro3 : std_logic_vector (3 downto 0);

-- sum of adders
signal sum0 : std_logic_vector (3 downto 0);
signal sum1 : std_logic_vector (3 downto 0);
signal sum2 : std_logic_vector (3 downto 0);

-- carry out of adders
signal cout0 : std_logic;
signal cout1 : std_logic;
signal cout2 : std_logic;
begin

--partial products
p_pro0 <= (A(3)and B(0)) & (A(2) and B(0)) & (A(1) and B(0)) & (A(0) and B(0)) ;
p_pro1 <= (A(3)and B(1)) & (A(2) and B(1)) & (A(1) and B(1)) & (A(0) and B(1)) ;
p_pro2 <= (A(3)and B(2)) & (A(2) and B(2)) & (A(1) and B(2)) & (A(0) and B(2)) ;
p_pro3 <= (A(3)and B(3)) & (A(2) and B(3)) & (A(1) and B(3)) & (A(0) and B(3)) ;


A1 : Ripple_Adder port map('0','0' & p_pro0 (3 downto 1) , p_pro1, sum0, cout0); 
A2 : Ripple_Adder port map('0', cout0 & sum0 (3 downto 1) , p_pro2, sum1, cout1); 
A3 : Ripple_Adder port map('0', cout1 & sum1 (3 downto 1) , p_pro3, sum2, cout2); 


p <= cout2 & sum2 & sum1(0) & sum0(0) & p_pro0(0);

end Behavioral;

