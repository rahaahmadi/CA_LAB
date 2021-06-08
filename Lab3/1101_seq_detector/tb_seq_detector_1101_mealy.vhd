--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:22:50 04/06/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/Lab3/tb_seq_detector_1101_mealy.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seq_detector_1101_mealy
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
 
ENTITY tb_seq_detector_1101_mealy IS
END tb_seq_detector_1101_mealy;
 
ARCHITECTURE behavior OF tb_seq_detector_1101_mealy IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seq_detector_1101_mealy
    PORT(
         input : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seq_detector_1101_mealy PORT MAP (
          input => input,
          rst => rst,
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		rst <= '0';
		wait for 10 ns;
		
		rst <= '1';
		wait for 10 ns;
		
		input <= '1';
		wait for 10 ns;
		
		input <= '1';
		wait for 10 ns;

		input <= '0';
		wait for 10 ns;

		input <= '1';
		wait for 10 ns;

		input <= '1';
		wait for 10 ns;
		
		input <= '0';
		wait for 10 ns;
		
		input <= '1';
		wait for 10 ns;
      wait;
   end process;

END;
