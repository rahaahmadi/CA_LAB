----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:01 03/10/2021 
-- Design Name: 
-- Module Name:    Comparator_1bit - Behavioral 
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

entity Comparator_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           G : in  STD_LOGIC;
           E : in  STD_LOGIC;
           L : in  STD_LOGIC;
           A_GT_B : out  STD_LOGIC;
           A_EQ_B : out  STD_LOGIC;
           A_LT_B : out  STD_LOGIC);
end Comparator_1bit;

architecture Behavioral of Comparator_1bit is

signal is_equal : STD_LOGIC;
signal is_greater : STD_LOGIC;
signal is_lower : STD_LOGIC;

begin

is_equal <= A xnor B;
is_greater <= A and (not B);
is_lower <= (not A) and B;

A_LT_B <= (is_equal and L) or is_lower;
A_GT_B <= (is_equal and G) or is_greater;
A_EQ_B <= is_equal and E;
end Behavioral;

