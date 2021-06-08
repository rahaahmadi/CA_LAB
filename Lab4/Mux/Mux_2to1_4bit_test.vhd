--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:37:53 04/26/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/Lab4/Lab4/Mux_2to1_4bit_test.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_2to1_4bit
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
 
ENTITY Mux_2to1_4bit_test IS
END Mux_2to1_4bit_test;
 
ARCHITECTURE behavior OF Mux_2to1_4bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_2to1_4bit
    PORT(
         A0 : IN  std_logic_vector(3 downto 0);
         A1 : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic_vector(3 downto 0) := (others => '0');
   signal A1 : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_2to1_4bit PORT MAP (
          A0 => A0,
          A1 => A1,
          sel => sel,
          output => output
        );



 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A0 <= "1011";	A1 <= "0100";	sel <= '0';
		wait for 100 ns;	
		 
		A0 <= "1011";	A1 <= "0100";	sel <= '1';
		wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
