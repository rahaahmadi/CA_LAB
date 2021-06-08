----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:03:13 04/14/2021 
-- Design Name: 
-- Module Name:    Cam - Behavioral 
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


entity Cam is
    Port ( rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           match : out  STD_LOGIC);
end Cam;

architecture Behavioral of Cam is

 
Type cam_array is array (255 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal memory : cam_array;

Type words_validation is array (255 downto 0) of STD_LOGIC;
signal is_valid : words_validation;

signal empty : integer := 0;
signal internal_match : std_logic := '0';
begin
	
	

	process(clk, reset)
	begin
		if(reset = '0') then
			for i in 0 to 255 loop
				memory(i) <= std_logic_vector(to_unsigned(i,16));
				is_valid(i) <= '0';
			end loop;
			
		elsif (rising_edge(clk)) then
			
			internal_match <= '0';
			for i in 0 to 255 loop
				if (memory(i) = data) then 
					internal_match <= '1';
					exit;
				end if;	
			end loop;
			
			elsif (wr = '1' and rd = '0') then
			
				if( internal_match = '0' ) then
				
					for i in 0 to 255 loop
						if (is_valid(i) = '0') then
							empty <= i;
							is_valid(i) <= '1';
						end if;	
					end loop;
					
				memory(empty) <= data;
				
				end if;
			
			if (rd = '1' and wr = '0') then
				
			end if;
			
		end if;
		match <= internal_match;
	end process;
		
	

end Behavioral;

