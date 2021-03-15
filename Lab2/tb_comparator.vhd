--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:43:51 03/15/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/Lab2/tb_comparator.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator_4bit
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
 
ENTITY tb_comparator IS
END tb_comparator;
 
ARCHITECTURE behavior OF tb_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         A_GT_B : OUT  std_logic;
         A_EQ_B : OUT  std_logic;
         A_LT_B : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal A_GT_B : std_logic;
   signal A_EQ_B : std_logic;
   signal A_LT_B : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator_4bit PORT MAP (
          A => A,
          B => B,
          A_GT_B => A_GT_B,
          A_EQ_B => A_EQ_B,
          A_LT_B => A_LT_B
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A <= "0000";
		B <= "0101";
		wait for 100 ns;	
		
		A <= "1100";
		B <= "0101";
		wait for 100 ns;	
		
		A <= "0000";
		B <= "0000";
		wait for 100 ns;	
		
		A <= "1000";
		B <= "0100";
		wait for 100 ns;
		

      wait;
   end process;

END;
