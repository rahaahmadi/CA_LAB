----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:46 03/10/2021 
-- Design Name: 
-- Module Name:    Decoder2to4 - Behavioral 
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

entity Decoder2to4 is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           d0 : out  STD_LOGIC;
           d1 : out  STD_LOGIC;
           d2 : out  STD_LOGIC;
           d3 : out  STD_LOGIC);
end Decoder2to4;

architecture Behavioral of Decoder2to4 is

begin

d0 <= (not i0) and (not i1);
d1 <= i0 and (not i1);
d2 <= (not i0) and i1;
d3 <= i0 and i1;

end Behavioral;

