--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:05:25 03/10/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/Lab2/tb_decoder.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder2to4
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
 
ENTITY tb_decoder IS
END tb_decoder;
 
ARCHITECTURE behavior OF tb_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder2to4
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         d0 : OUT  std_logic;
         d1 : OUT  std_logic;
         d2 : OUT  std_logic;
         d3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';

 	--Outputs
   signal d0 : std_logic;
   signal d1 : std_logic;
   signal d2 : std_logic;
   signal d3 : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder2to4 PORT MAP (
          i0 => i0,
          i1 => i1,
          d0 => d0,
          d1 => d1,
          d2 => d2,
          d3 => d3
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i0 <= '0';
		i1 <= '0';
		wait for 100 ns;
		
		i0 <= '1';
		i1 <= '0';
		wait for 100 ns;
		
		i0 <= '0';
		i1 <= '1';
		wait for 100 ns;
		
		i0 <= '1';
		i1 <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
