----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:05:43 05/29/2021 
-- Design Name: 
-- Module Name:    floating_point_addSub - Behavioral 
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
use ieee.std_logic_unsigned.all;


entity floating_point_addSub is
	Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
			 B : in STD_LOGIC_VECTOR(7 downto 0);
          sel : in  STD_LOGIC;    -- sel = 0 : add  /  sel = 1 : subtract
			 output : out STD_LOGIC_VECTOR(7 downto 0));
end floating_point_addSub;

architecture Behavioral of floating_point_addSub is


begin
	
	process(A, B, sel)
	
		variable sign_A : STD_LOGIC;
		variable sign_B : STD_LOGIC;
		variable mantissa_A : STD_LOGIC_VECTOR(3 downto 0);
		variable mantissa_B : STD_LOGIC_VECTOR(3 downto 0);
		variable exp_A : STD_LOGIC_VECTOR(3 downto 0);
		variable exp_B : STD_LOGIC_VECTOR(3 downto 0);
		variable exp_out : STD_LOGIC_VECTOR(3 downto 0);
		variable mantissa_out : STD_LOGIC_VECTOR(3 downto 0);
		variable sign_out : STD_LOGIC;
		variable exp_diff : STD_LOGIC_VECTOR(3 downto 0);
		variable temp: std_logic_vector(4 downto 0);
	
	begin
	
		mantissa_A := '1' & A(2 downto 0);
		mantissa_B := '1' & B(2 downto 0);
		exp_A := A(6 downto 3);
		exp_B := B(6 downto 3);
		sign_A := A(7);
		sign_B := B(7);
		
		if (sel = '1') then
			sign_B := not sign_B;
		end if;
		
		if( A = "00000000") then
			output <= B;
		elsif ( B = "00000000") then
			output <= A;
		else	
				
			if (exp_A >= exp_B) then
				exp_out := exp_A;
				exp_diff := exp_A - exp_B;
				mantissa_B := STD_LOGIC_VECTOR(shift_right(unsigned(mantissa_B), to_integer(unsigned(exp_diff))));
				
			else
				exp_out := exp_B;
				exp_diff := STD_LOGIC_VECTOR(unsigned(exp_B) - unsigned(exp_A));
				mantissa_A := STD_LOGIC_VECTOR(shift_right(unsigned(mantissa_A), to_integer(unsigned(exp_diff))));
				
			end if;
			
			if((sign_A xor sign_B) = '0') then
			
				 temp := ('0' & mantissa_A) + ('0' & mantissa_B);
				
				 if(temp(4) = '1') then            
						temp := STD_LOGIC_VECTOR(shift_right(unsigned(temp), 1));
						exp_out := exp_out + 1;
				 end if;
				
				 mantissa_out := temp(3 downto 0);
				 sign_out := sign_A;
				
			else
			
				temp := ('0' & mantissa_A) + ('0' & not(mantissa_B)) + 1;
					
				if(temp(4) = '0') then
					mantissa_out := not (temp(3 downto 0)) + 1;
					sign_out := not sign_A;
					
				else
				
					mantissa_out := temp(3 downto 0);
					sign_out := sign_A;
				
				end if;
				
				if (mantissa_out(3) = '0') then
					mantissa_out := STD_LOGIC_VECTOR(shift_left(unsigned(mantissa_out), 1));
					exp_out := exp_out - 1;
				end if;	
				
				if (mantissa_out(3) = '0') then
					mantissa_out := STD_LOGIC_VECTOR(shift_left(unsigned(mantissa_out), 1));
					exp_out := exp_out - 1;
				end if;		
				
				if (mantissa_out(3) = '0') then
					mantissa_out := STD_LOGIC_VECTOR(shift_left(unsigned(mantissa_out), 1));
					exp_out := exp_out - 1;
				end if;			
						
					
				
				
				if (mantissa_out = "0000") then	
					sign_out := '0';
					exp_out := "0000";
				end if;
				
			end if;
			output <= sign_out & exp_out & mantissa_out(2 downto 0);
			
		end if;
		
	end process;

end Behavioral;

