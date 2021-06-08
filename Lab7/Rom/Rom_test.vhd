--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:41 04/15/2021
-- Design Name:   
-- Module Name:   F:/CA-Lab/AZ7/Rom_test.vhd
-- Project Name:  AZ7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Rom
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
 
ENTITY Rom_test IS
END Rom_test;
 
ARCHITECTURE behavior OF Rom_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rom
    PORT(
         rd : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         addr : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rom PORT MAP (
          rd => rd,
          rst => rst,
          clk => clk,
          addr => addr,
          data_out => data_out
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
		rst <= '1';
		rd <= '1';
		addr <= "10000000";
		wait for 50 ns;
		rst <= '0';
		wait for 50 ns;
		rst <= '1';
		addr <= "11111111";
		wait for 50 ns;
		rd <= '0';
		addr <= "11000000";
		wait for 50 ns;
		rd <= '1';
	
		
      wait;
   end process;

END;
