--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:20 04/25/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/Lab4/tb_CLA.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLA
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
 
ENTITY tb_CLA IS
END tb_CLA;
 
ARCHITECTURE behavior OF tb_CLA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLA
    PORT(
         Cin : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Cin : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLA PORT MAP (
          Cin => Cin,
          A => A,
          B => B,
          sum => sum,
          Cout => Cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here		
		Cin <= '0';
		A <= "0000";
		B <= "0000";
		wait for 100 ns;	
		
		Cin <= '1';
		A <= "0011";
		B <= "0000";
		wait for 100 ns;	
		
		Cin <= '0';
		A <= "0000";
		B <= "0110";
		wait for 100 ns;	
		
		Cin <= '1';
		A <= "0100";
		B <= "0001";
		wait for 100 ns;
		
		Cin <= '1';
		A <= "1100";
		B <= "1110";
		wait for 100 ns;
		
		Cin <= '0';
		A <= "1111";
		B <= "1111";
		wait for 100 ns;
      wait;
   end process;

END;
