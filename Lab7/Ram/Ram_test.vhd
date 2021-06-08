--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:16:07 04/14/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/Lab7/Lab7/Ram_test.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ram
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
 
ENTITY Ram_test IS
END Ram_test;
 
ARCHITECTURE behavior OF Ram_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ram
    PORT(
         wr : IN  std_logic;
         rd : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         addr : IN  std_logic_vector(7 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(7 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ram PORT MAP (
          wr => wr,
          rd => rd,
          rst => rst,
          clk => clk,
          addr => addr,
          data_in => data_in,
          data_out => data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
		if NOW > clk_period*22  then
		wait;
		end if;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		rst <= '1';
      wait for clk_period*2;	
		

	
		
		wr <= '1';	rd <= '0';	addr <= "11101000";	data_in <= "0101010101010101";	
      wait for clk_period*2;

		wr <= '1';	rd <= '0';	addr <= "10000001";	data_in <= "0101010101111111";	
      wait for clk_period*2;

		wr <= '1';	rd <= '0';	addr <= "11101000";	data_in <= "0000000000000001";	
      wait for clk_period*2;
		
		
		wr <= '0';	rd <= '1';	addr <= "11101000";		
      wait for clk_period*2;

		wr <= '0';	rd <= '1';	addr <= "11101000";		
      wait for clk_period*2;

		wr <= '0';	rd <= '1';	addr <= "11110000";		
      wait for clk_period*2;
		

		
		rst <= '0';
      wait for clk_period*2;	
		
		rst <= '1';
      wait for clk_period*2;	
		

		wr <= '0';	rd <= '1';	addr <= "11101000";		
      wait for clk_period*2;

		wr <= '0';	rd <= '1';	addr <= "00000010";		
      wait for clk_period*2;

		wr <= '0';	rd <= '1';	addr <= "00000111";		
      wait for clk_period*2;		
		
		wr <= '1';	rd <= '0';	addr <= "00000010";	data_in <= "1111111111111111";	
      wait for clk_period*2;
		
		wr <= '0';	rd <= '1';	addr <= "00000010";		
      wait for clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
