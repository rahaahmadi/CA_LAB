--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:00:03 04/19/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/Lab6/Lab6/Shift_Register_test.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Shift_Register
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
 
ENTITY Shift_Register_test IS
END Shift_Register_test;
 
ARCHITECTURE behavior OF Shift_Register_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shift_Register
    PORT(
         parallel_in : IN  std_logic_vector(3 downto 0);
         arg : IN  std_logic_vector(1 downto 0);
         load : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         input : IN  std_logic;
         reg_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal parallel_in : std_logic_vector(3 downto 0) := (others => '0');
   signal arg : std_logic_vector(1 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal input : std_logic := '0';


 	--Outputs
   signal reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shift_Register PORT MAP (
          parallel_in => parallel_in,
          arg => arg,
          load => load,
          rst => rst,
          clk => clk,
          input => input,
          reg_out => reg_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
		if Now > clk_period*15 then
		 wait;
		end if;
			
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	

      wait for clk_period*1;
		
		rst <= '1';
      wait for clk_period*2;
		

		parallel_in <= "0110";	arg <= "00";	load <= '0';	input <= '1';	rst <= '1';		
      wait for clk_period*2;
		
		parallel_in <= "0001";	arg <= "01";	load <= '0';	input <= '1';	rst <= '1';		
      wait for clk_period*2;
		
		parallel_in <= "0010";	arg <= "10";	load <= '0';	input <= '1';	rst <= '1';		
      wait for clk_period*2;
		
		parallel_in <= "1110";	arg <= "11";	load <= '1';	input <= '0';	rst <= '1';		
      wait for clk_period*2;

		rst <= '0';

		parallel_in <= "0110";	arg <= "00";	load <= '1';	input <= '0';	rst <= '0';		
      wait for clk_period*2;

      rst <= '1';
		wait for clk_period*2;
		
		parallel_in <= "0010";	arg <= "10";	load <= '1';	input <= '0';	rst <= '1';		
      wait for clk_period*2;
		
		
		
		
      

      wait;
   end process;

END;
