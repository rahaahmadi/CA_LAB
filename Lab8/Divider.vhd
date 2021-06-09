
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Divider is
    Port ( RA : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Quotient : out  STD_LOGIC_VECTOR(3 downto 0);
			  Remainder : out  STD_LOGIC_VECTOR(3 downto 0);
           overflow : out  STD_LOGIC);
end Divider;

architecture Behavioral of Divider is
	
	signal sc:integer ;
	signal results : STD_LOGIC_VECTOR(7 downto 0);
	signal ovf : std_logic;
begin
	
	process(clk, RA, B)
		variable ERA: STD_LOGIC_VECTOR(8 downto 0);
		variable last_a: STD_LOGIC_VECTOR(7 downto 0) ;
		variable last_b: STD_LOGIC_VECTOR(3 downto 0);
		
	begin
	 
	if (RA /= last_a or B /= last_b) then -- means A or B changed. dividing should start from the beginning
	
		sc <= 4;
		ERA(7 downto 0) := RA(7 downto 0);
		ERA(8) := '0';
		
		last_a := RA;
		last_b := B;
		
		
		-- checking for overflow
		ERA(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & ERA(7 downto 4)) + unsigned('0' & not( B(3 downto 0))) + 1);
		
	   if (ERA(8) = '1') then
			ovf <= '1';

		else
			ovf <= '0';
			ERA(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & ERA(7 downto 4)) + unsigned('0' & B(3 downto 0)));
					
		end if;
		
	end if;	
	
	if(rising_edge(clk) and sc >= 0 and ovf /= '1') then 
	
		
		if ( sc > 0 )  then 
		
				ERA := STD_LOGIC_VECTOR(shift_left(unsigned(ERA), 1));	

				if (ERA(8) = '1') then
			 
						ERA(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & ERA(7 downto 4)) + unsigned('0' & not(B(3 downto 0))) + 1);
						ERA(0) := '1';
			
				else 
			  
						ERA(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & ERA(7 downto 4)) + unsigned('0' & not(B(3 downto 0))) + 1);
					
						if (ERA(8) = '1') then
						ERA(0) := '1';
						else 
						ERA(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & ERA(7 downto 4)) + unsigned('0' & B(3 downto 0)));
						end if;

				end if;
				
				  sc <= sc - 1;
			
      else
				results(7 downto 0) <= ERA(7 downto 0);
       end if;	
		 
	end if;
		
				
			

	end process;
	
	Quotient <= results(3 downto 0);
	Remainder <= results(7 downto 4);
	overflow <= ovf;

end Behavioral;

