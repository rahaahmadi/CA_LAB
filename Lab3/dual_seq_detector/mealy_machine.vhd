----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:10:06 04/06/2021 
-- Design Name: 
-- Module Name:    mealy_seq_detector_ - Behavioral 
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



entity mealy_machine is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end mealy_machine;

architecture Behavioral of mealy_machine is

type states_1 is (s0_1, s1_1, s2_1, s3_1, s4_1); -- state of 0110 detector
signal state_1 : states_1 := s0_1 ;

type states_2 is (s0_2, s1_2, s2_2, s3_2, s4_2); -- state of 0101 detector
signal state_2 : states_2 := s0_2 ;

begin

process_0110 : process (clk)
begin
	if falling_edge (clk) then 
		case state_1 is 
			
			when s0_1 =>
				if(input = '1') then
					state_1 <= s0_1;
				else
               state_1 <= s1_1;
            end if;
				
				
			when s1_1 =>
				if(input = '1') then
					state_1 <= s2_1;
				else
               state_1 <= s1_1;
            end if;				


			when s2_1 =>
				if(input = '1') then
					state_1 <= s3_1;
				else
               state_1 <= s1_1;
            end if;


			when s3_1 =>
				if(input = '1') then
					state_1 <= s0_1;
				else
               state_1 <= s4_1;
            end if;


			when s4_1 =>
				if(input = '1') then
					state_1 <= s0_1;
				else
               state_1 <= s1_1;
            end if;
				
	 end case;
	end if;
end process;


process_0101 : process (clk)
begin
	if falling_edge (clk) then 
		case state_2 is 
			
			when s0_2 =>
				if(input = '1') then
					state_2 <= s0_2;
				else
               state_2 <= s1_2;
            end if;
	
			when s1_2 =>
				if(input = '1') then
					state_2 <= s2_2;
				else
               state_2 <= s1_2;
            end if;

			when s2_2 =>
				if(input = '1') then
					state_2 <= s0_2;
				else
               state_2 <= s3_2;
            end if;

			when s3_2 =>
				if(input = '1') then
					state_2 <= s4_2;
				else
               state_2 <= s1_2;
            end if;

			when s4_2 =>
				if(input = '1') then
					state_2 <= s0_2;
				else
               state_2 <= s1_2;
            end if;				
	
				
	 end case;
	end if;
end process;
		
		output <= '1' when (state_1 = s4_1 or state_2 = s4_2) else
		          '0';

		
end Behavioral;
