--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:34 05/08/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/lab5/tb_simple_multiplication.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: simple_multiplication
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
 
ENTITY tb_simple_multiplication IS
END tb_simple_multiplication;
 
ARCHITECTURE behavior OF tb_simple_multiplication IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT simple_multiplication
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: simple_multiplication PORT MAP (
          A => A,
          B => B,
          P => P
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
 
      wait for 100 ns;
		A <= "0011";
      B <= "0100";
      WAIT FOR 50 NS;
		report "result of 0011 * 0100 should be : 3 * 4 = 12 = 0000 1100";

      A <= "1111";
      B <= "1111";
      WAIT FOR 50 NS;
		report "result of 1111 * 1111 should be : 15 * 15 = 225 = 1110 0001";
		
      A <= "1001";
      B <= "0000";
      WAIT FOR 50 NS;
		report "result of 1001 * 0000 should be : 9 * 0 = 0 = 0000 0000";

      A <= "1100";
      B <= "0001";
      WAIT FOR 50 NS;
		report "result of 1100 * 0001 should be : 12 * 1 = 12 = 0000 1100";

      A <= "1010";
      B <= "0010";
      WAIT FOR 50 NS;
		report "result of 1010 * 0010 should be : 10 * 2 = 20 = 0001 0100";

      A <= "0101";
      B <= "1000";
      WAIT FOR 50 NS;
		report "result of 0101 * 1000 should be : 5 * 8 = 40 = 0010 1000";

      A <= "1110";
      B <= "0110";
      WAIT FOR 50 NS;
		report "result of 1110 * 0110 should be : 14 * 6 = 72 = 0100 1000";

      A <= "0111";
      B <= "0011";
      WAIT FOR 50 NS;
		report "result of 0111 * 0011 should be : 7 * 3 = 21 = 0001 0101";

      wait;
   end process;

END;
