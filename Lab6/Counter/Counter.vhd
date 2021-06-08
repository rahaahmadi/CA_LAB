----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:44 04/19/2021 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           counter_out : out  STD_LOGIC_VECTOR(25 downto 0));
end Counter;

architecture Behavioral of Counter is

signal counter : STD_LOGIC_VECTOR(25 downto 0);

begin

process (clk, rst)
begin
	if(rst = '0') then
		counter <= (others => '0');
	elsif (rising_edge(clk)) then
		if (counter < "10011000100101101000000000") then
			counter <= counter + 1;	
		else
			counter <= (others => '0');
		end if;
	end if;
end process;

counter_out <= counter;
end Behavioral;

