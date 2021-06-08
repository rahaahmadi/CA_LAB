----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:13 04/08/2021 
-- Design Name: 
-- Module Name:    Ram - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ram is
    Port ( wr : in  STD_LOGIC;
           rd : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR(7 downto 0);
			  data_in : in STD_LOGIC_VECTOR(15 downto 0);
           data_out : out  STD_LOGIC_VECTOR(15 downto 0));
end Ram;

architecture Behavioral of Ram is

Type ram_array is array (255 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal memory : ram_array;

signal internal : std_logic_vector (15 downto 0);
begin

	process(clk, rst)
	begin
	
		if(rst = '0') then
			for i in 0 to 255 loop
				memory(i) <= STD_LOGIC_VECTOR(to_unsigned(i,16));
			end loop;
			
		elsif (rising_edge(clk)) then
		
			if (wr = '1' and rd = '0') then
				memory(conv_integer(addr)) <= data_in;
			end if;
			
			if (wr = '0' and rd = '1') then
				data_out <= memory(conv_integer(addr));
			end if;
		end if;
	end process;



end Behavioral;

