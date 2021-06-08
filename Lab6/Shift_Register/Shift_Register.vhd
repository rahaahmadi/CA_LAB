----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:14 04/19/2021 
-- Design Name: 
-- Module Name:    Shift_Register - Behavioral 
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



entity Shift_Register is

--generic (width : integer := 4);

    Port ( parallel_in : in  STD_LOGIC_VECTOR (3 downto 0);
           arg : in  STD_LOGIC_VECTOR (1 downto 0);
           load : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           input : in  STD_LOGIC;
           reg_out : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end Shift_Register;

architecture Behavioral of Shift_Register is
signal internal_out : std_logic_vector (3 downto 0);
signal temp : std_logic_vector (3 downto 0) := parallel_in;
begin

	process(clk, rst)
	begin 
		if(rst = '0') then
			internal_out <= "0000";
		
	elsif (rising_edge (clk)) then
	
	   if (load = '1') then
				internal_out <= parallel_in;
		end if;
			
	
		if(arg = "00") then -- logical shift to right with input
			internal_out <= input & internal_out (3 downto 1);
				
		elsif(arg = "01") then -- arithmetic shift to right without input
			internal_out <= internal_out (3) & internal_out (3 downto 1);
				
		else -- logical and arithmetic shift to left with input
			internal_out <= internal_out (2 downto 0) & input;
		end if;

			
			
	end if;
	end process;
   
	reg_out <= internal_out;


end Behavioral;

