--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:54:51 05/25/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/lab8/test_divider.vhd
-- Project Name:  lab8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Divider
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
 
ENTITY test_divider IS
END test_divider;
 
ARCHITECTURE behavior OF test_divider IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Divider
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Quotient : OUT  std_logic_vector(3 downto 0);
         Remainder : OUT  std_logic_vector(3 downto 0);
         OVF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Quotient : std_logic_vector(3 downto 0);
   signal Remainder : std_logic_vector(3 downto 0);
   signal OVF : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Divider PORT MAP (
          A => A,
          B => B,
          CLK => CLK,
          RST => RST,
          Quotient => Quotient,
          Remainder => Remainder,
          OVF => OVF
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      RST <= '1';
		wait for 30 ns;	

		RST <= '0';
		
		A <= "00000111";
		B <= "0011";
		wait for 30 ns;
			
      wait;
   end process;

END;
