----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:12:35 04/06/2021 
-- Design Name: 
-- Module Name:    Ripple_Counter_4bit - Behavioral 
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

entity Ripple_Counter_4bit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(3 downto 0));
end Ripple_Counter_4bit;

architecture Behavioral of Ripple_Counter_4bit is

	component TFF is
		Port ( t : in  STD_LOGIC;
             rst : in  STD_LOGIC;
             clk : in  STD_LOGIC;
             q : out  STD_LOGIC);
	end component;
	
	
	Signal temp : std_logic_vector(3 downto 0);


begin
	
	t0 : TFF port map ('1', RST, CLK, temp(0));
	t1 : TFF port map ('1', RST, temp(0), temp(1));
	t2 : TFF port map ('1', RST, temp(1), temp(2));
	t3 : TFF port map ('1', RST, temp(2), temp(3));
	
	Q <= temp;

end Behavioral;

