--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:30:20 04/26/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/Lab4/Lab4/CSA_test.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CSA
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CSA_test IS
END CSA_test;
 
ARCHITECTURE behavior OF CSA_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CSA
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CSA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          sum => sum,
          Cout => Cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		Cin <= '0';		A <= "0001";	B <= "0001";
		wait for 100 ns;	
		report "0001 plus 0001 is 0010 with carry 0";
		
		Cin <= '0';		A <= "0011";	B <= "0101";
		wait for 100 ns;	
		report "0011 plus 0101 is 1000 with carry 0";
		
		Cin <= '0';		A <= "1101";	B <= "0101";
		wait for 100 ns;	
		report "1101 plus 0101 is 0010 with carry 1";
		
		Cin <= '1';		A <= "0001";	B <= "0110";
		wait for 100 ns;	
		report "0001 plus 0110 with cin 1 is 1000 with carry 0";
		
		Cin <= '1';		A <= "0111";	B <= "1111";
		wait for 100 ns;	
		report "0111 plus 1111 with cin 1 is 0111 with carry 1";
		
		wait for 100 ns;	

		
		
		
		
      wait;
  

      -- insert stimulus here 

      wait;
   end process;

END;
