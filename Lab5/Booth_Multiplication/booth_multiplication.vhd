----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:15 05/08/2021 
-- Design Name: 
-- Module Name:    booth_multiplication - Behavioral 
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
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_multiplication is
    Port ( Q : in  STD_LOGIC_VECTOR(3 downto 0);
           M : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end booth_multiplication;


architecture Behavioral of booth_multiplication is
	  
begin
	 process(M, Q)
		variable A : std_logic_vector(3 downto 0);
      variable q_sig : std_logic_vector(3 downto 0);
		variable q_1 : std_logic;
      variable i : integer;
      begin
			A := "0000";
         q_sig := Q;
			q_1 := '0';
         for i in 0 to 3 loop
            if (q_sig(0) ='1' and q_1 = '0') then
				A := A - M;
				elsif (q_sig(0) = '0' and q_1 = '1') then
					A := A + M;
				end if;
				q_1 := q_sig(0);
				q_sig(0) := q_sig(1);
				q_sig(1) := q_sig(2);
				q_sig(2) := q_sig(3);
				q_sig(3) := A(0);
				A(0) := A(1);
				A(1) := A(2);
				A(2) := A(3);
        end loop;
        P <= A & q_sig;
     end process;
	
end Behavioral;

