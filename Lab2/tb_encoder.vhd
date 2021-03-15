--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:26:22 03/15/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/Lab2/tb_encoder.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Encoder4to2
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
 
ENTITY tb_encoder IS
END tb_encoder;
 
ARCHITECTURE behavior OF tb_encoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder4to2
    PORT(
         y0 : IN  std_logic;
         y1 : IN  std_logic;
         y2 : IN  std_logic;
         y3 : IN  std_logic;
         m0 : OUT  std_logic;
         m1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal y0 : std_logic := '0';
   signal y1 : std_logic := '0';
   signal y2 : std_logic := '0';
   signal y3 : std_logic := '0';

 	--Outputs
   signal m0 : std_logic;
   signal m1 : std_logic;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder4to2 PORT MAP (
          y0 => y0,
          y1 => y1,
          y2 => y2,
          y3 => y3,
          m0 => m0,
          m1 => m1
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		y0 <= '0';
		y1 <= '0';
		y2 <= '0';
		y3 <= '0';
		wait for 100 ns;
		
		y0 <= '1';
		y1 <= '0';
		y2 <= '0';
		y3 <= '0';
		wait for 100 ns;
		
		y0 <= '0';
		y1 <= '1';
		y2 <= '0';
		y3 <= '0';
		wait for 100 ns;
		
		y0 <= '0';
		y1 <= '0';
		y2 <= '1';
		y3 <= '0';
		wait for 100 ns;
		
		y0 <= '0';
		y1 <= '0';
		y2 <= '0';
		y3 <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
