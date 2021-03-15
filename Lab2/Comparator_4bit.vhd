----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:01 03/10/2021 
-- Design Name: 
-- Module Name:    Comparator_4bit - Behavioral 
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

entity Comparator_4bit is
    Port ( A : in  STD_LOGIC_VECTOR( 3 downto 0);
           B : in  STD_LOGIC_VECTOR( 3 downto 0);
           A_GT_B : out  STD_LOGIC;
           A_EQ_B : out  STD_LOGIC;
           A_LT_B : out  STD_LOGIC);
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is

component Comparator_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           G : in  STD_LOGIC;
           E : in  STD_LOGIC;
           L : in  STD_LOGIC;
           A_GT_B : out  STD_LOGIC;
           A_EQ_B : out  STD_LOGIC;
           A_LT_B : out  STD_LOGIC);
end component Comparator_1bit;

signal gt1 : STD_LOGIC_VECTOR(2 downto 0);
signal eq : STD_LOGIC_VECTOR(2 downto 0);
signal lt : STD_LOGIC_VECTOR(2 downto 0);

begin

Comparator0: comparator_1bit port map (A(0),B(0),'0','1','0',gt1(0),eq(0),lt(0));
Comparator1: comparator_1bit port map (A(1),B(1),gt1(0),eq(0),lt(0),gt1(1),eq(1),lt(1));
Comparator2: comparator_1bit port map (A(2),B(2),gt1(1),eq(1),lt(1),gt1(2),eq(2),lt(2));
Comparator3: comparator_1bit port map (A(3),B(3),gt1(2),eq(2),lt(2),A_GT_B,A_EQ_B,A_LT_B);

end Behavioral;

