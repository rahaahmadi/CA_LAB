----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    Divider - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Quotient : out  STD_LOGIC_VECTOR(3 downto 0);
			  Remainder : out  STD_LOGIC_VECTOR(3 downto 0);
           OVF : out  STD_LOGIC);
end Divider;

architecture Behavioral of Divider is

	Type state is (set_signal, check_ovf, check_e_ovf, check_e_above, SHL, check_e_below, check_counter);
	signal current_state, next_state: state := set_signal; 
	
	signal count: unsigned(2 downto 0) := "000";
	signal temp: STD_LOGIC_VECTOR(4 downto 0);
	signal Result : STD_LOGIC_VECTOR(7 downto 0);
	signal sig_Quotient :   STD_LOGIC_VECTOR(3 downto 0);
   signal sig_Remainder :   STD_LOGIC_VECTOR(3 downto 0);
begin

	process(CLK, RST)
	begin
		if(RST = '1') 
			then current_state <= set_signal;
		elsif(rising_edge(CLK)) 
			then current_state <= next_state;
		end if;
	end process; 
	
	process(current_state, A, B)
		variable EAQ: STD_LOGIC_VECTOR(8 downto 0);
	begin
		case current_state is
			when set_signal => 
				count <= "000";
				EAQ(7 downto 0) := A(7 downto 0);
				EAQ(8) := '0';
				next_state <= check_ovf;
				
			when check_ovf =>
				EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & not( B(3 downto 0))) + 1);
				temp <= std_logic_vector(unsigned('0' & not( B(3 downto 0)))+ 1 );
				next_state <= check_e_ovf;
				
			when check_e_ovf =>
				if (EAQ(8) = '1') then
					OVF <= '1';
					next_state <= set_signal;
				else
					OVF <= '0';
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & B(3 downto 0)));
					next_state <= SHL;
				end if;
			
			when SHL =>
				EAQ := STD_LOGIC_VECTOR(shift_left(unsigned(EAQ), 1));
				next_state <= check_e_above;
				
			when check_e_above =>
				if (EAQ(8) = '1') then
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & not(B(3 downto 0))) + 1);
					EAQ(0) := '1';
					count <= count + 1;
					next_state <= check_counter;
				else 
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & not(B(3 downto 0))) + 1);
					next_state <= check_e_below;
				end if;
				
			when check_e_below =>
				if (EAQ(8) = '1') then
					EAQ(0) := '1';
				else 
					EAQ(8 downto 4) := STD_LOGIC_VECTOR(unsigned('0' & EAQ(7 downto 4)) + unsigned('0' & B(3 downto 0)));
				end if;
				count <= count + 1;
				next_state <= check_counter;
				
			when check_counter =>
				if (count = "100") then
					Result(7 downto 0) <= EAQ(7 downto 0);
					next_state <= set_signal;
					sig_Quotient <= Result(3 downto 0);
					sig_Remainder <= Result(7 downto 4);
				else
					next_state <= SHL;					
				end if;
		end case;
	end process;
	
	Quotient <= sig_Quotient;
	Remainder <= sig_Remainder;

end Behavioral;

