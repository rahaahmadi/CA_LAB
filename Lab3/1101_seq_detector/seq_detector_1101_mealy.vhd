----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:34:41 04/06/2021 
-- Design Name: 
-- Module Name:    seq_detector_1101_mealy - Behavioral 
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

entity seq_detector_1101_mealy is
    Port ( input : in  STD_LOGIC;
           rst : in  STD_LOGIC; -- active low reset
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end seq_detector_1101_mealy;

architecture Behavioral of seq_detector_1101_mealy is

	Type state is (start, got1, got11, got110);
	signal present_state, next_state : state := start; --initial value


begin

	process(clk, rst)
	begin
		if(rst = '0')
			then present_state <= start;
		elsif(clk'event and clk = '1') 
			then present_state <= next_state;
		end if;
	end process;
	
	process(input, present_state)
	begin 
		case present_state is
			when start => 
				if (input = '1') then 
					next_state <= got1;
					output <= '0';
				else 
					next_state <= start;
					output <= '0';
				end if;
			
			when got1 => 
				if (input = '1') then 
					next_state <= got11;
					output <= '0';
				else 
					next_state <= start;
					output <= '0';
				end if;
				
			when got11 => 
				if (input = '1') then 
					next_state <= got11;
					output <= '0';
				else 
					next_state <= got110;
					output <= '0';
				end if;
				
			when got110 => 
				if (input = '1') then 
					next_state <= got1;
					output <= '1';
				else 
					next_state <= start;
					output <= '0';
				end if;
			
		end case;
	end process;
	
end Behavioral;

