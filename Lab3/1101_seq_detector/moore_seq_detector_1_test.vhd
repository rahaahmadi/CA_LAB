--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:42:36 04/05/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/class/test/moore_seq_detector_1_test.vhd
-- Project Name:  test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: moore_seq_detector_1
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

 
ENTITY moore_seq_detector_1_test IS
END moore_seq_detector_1_test;
 
ARCHITECTURE behavior OF moore_seq_detector_1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT moore_seq_detector_1
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: moore_seq_detector_1 PORT MAP (
          input => input,
          clk => clk,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 22ns;	

 

      input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period;


      input <= '1';
		wait for clk_period;


      input <= '0';
		wait for clk_period;


      input <= '1';
		wait for clk_period;


      input <= '1';
		wait for clk_period;

      input <= '0';
		wait for clk_period;


      input <= '1';
		wait for clk_period;


      input <= '0';
		wait for clk_period;

      input <= '1';
		wait for clk_period;
      
		wait;


   end process;

END;
