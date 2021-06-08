
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity moore_seq_detector_1 is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end moore_seq_detector_1;

architecture Behavioral of moore_seq_detector_1 is
type t_state is (s0, s1, s2, s3, s4);
signal present_state : t_state := s0 ;
signal next_state : t_state := s0;

begin

moore_process : process(present_state, input)
begin
	
	case present_state is 
	
		when s0 =>
			if (input = '1') then 
					next_state <= s1;
			else
					next_state <= s0;
			end if;	
			
			
		when s1 =>
			if (input = '1') then 
					next_state <= s2;
			else
					next_state <= s0;
			end if;	


		when s2 =>
			if (input = '1') then 
					next_state <= s2;
			else
					next_state <= s3;
			end if;
			

		when s3 =>
			if (input = '1') then 
					next_state <= s4;
			else
					next_state <= s0;
			end if;	


		when s4 =>
			if (input = '1') then 
					next_state <= s2;
			else
					next_state <= s0;
			end if;		
			
    end case;
end process ;

clk_process : process(clk)
begin 

	if falling_edge (clk) then
		present_state <= next_state;
	end if;

end process;		

	output <= '1' when present_state = s4 else
			 '0';
			 
			 
end Behavioral;