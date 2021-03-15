----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:54:48 03/10/2021 
-- Design Name: 
-- Module Name:    Encoder4to2 - Behavioral 
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

entity Encoder4to2 is
    Port ( y0 : in  STD_LOGIC;
           y1 : in  STD_LOGIC;
           y2 : in  STD_LOGIC;
           y3 : in  STD_LOGIC;
           m0 : out  STD_LOGIC;
           m1 : out  STD_LOGIC);
end Encoder4to2;

architecture Behavioral of Encoder4to2 is

begin

m0 <= y3 or y1;
m1 <= y3 or y2;

end Behavioral;

