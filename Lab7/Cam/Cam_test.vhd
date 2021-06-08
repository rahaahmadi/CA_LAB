--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:15:12 04/14/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/Lab7/Lab7/Cam_test.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Cam
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
 
ENTITY Cam_test IS
END Cam_test;
 
ARCHITECTURE behavior OF Cam_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cam
    PORT(
         rd : IN  std_logic;
         wr : IN  std_logic;
         reset : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         match : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal reset : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal match : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cam PORT MAP (
          rd => rd,
          wr => wr,
          reset => reset,
          data => data,
          clk => clk,
          match => match
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		
		if NOW > clk_period*26  then
		wait;
		end if;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   

      wait for clk_period*2;
		
		reset <= '1';
		wait for clk_period*2;
		
		rd <= '0';	wr <= '1';	data <= "1010101011110000";	
		wait for clk_period*2;
		
		rd <= '0';	wr <= '1';	data <= "1111111111111111";	
		wait for clk_period*2;
		
		
		
		rd <= '1';	wr <= '0';	data <= "1010101011110000";	
		wait for clk_period*2;
		
		rd <= '1';	wr <= '0';	data <= "1111000011110000";	
		wait for clk_period*2;
		
		rd <= '1';	wr <= '0';	data <= "1111111111111111";	
		wait for clk_period*2;
		
		
		reset <= '0';
		wait for clk_period*2;
		
		rd <= '0';	wr <= '1';	data <= "1010101011110000";	
		wait for clk_period*2;
		
		rd <= '0';	wr <= '1';	data <= "0000000000001111";	
		wait for clk_period*2;
		
		
		rd <= '0';	wr <= '1';	data <= "0000000000000000";	
		wait for clk_period*2;
		
		rd <= '0';	wr <= '1';	data <= "0010000000000000";	
		wait for clk_period*2;
		




      -- insert stimulus here 

      wait;
   end process;

END;
