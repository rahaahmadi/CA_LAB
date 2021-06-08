--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:15:42 04/14/2021
-- Design Name:   
-- Module Name:   C:/Users/My NoteBook/Desktop/Lab7/Lab7/Dual_port_Ram_test.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Dual_port_Ram
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
 
ENTITY Dual_port_Ram_test IS
END Dual_port_Ram_test;
 
ARCHITECTURE behavior OF Dual_port_Ram_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dual_port_Ram
    PORT(
         rd : IN  std_logic;
         wr : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         r_addr : IN  std_logic_vector(7 downto 0);
         w_addr : IN  std_logic_vector(7 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal r_addr : std_logic_vector(7 downto 0) := (others => '0');
   signal w_addr : std_logic_vector(7 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dual_port_Ram PORT MAP (
          rd => rd,
          wr => wr,
          rst => rst,
          clk => clk,
          r_addr => r_addr,
          w_addr => w_addr,
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
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     	
      wait for clk_period*2;
		rst <= '1';
		
		wr <= '1';	rd <= '1';	w_addr <= "11100011";		r_addr <= "11110000";		data_in <= "1111111111111111";
		wait for clk_period*2;

		wr <= '1';	rd <= '1';	w_addr <= "10000000";		r_addr <= "11100011";		data_in <= "1111000011111111";
		wait for clk_period*2;


		wr <= '1';	rd <= '1';	w_addr <= "10000011";		r_addr <= "11110000";		data_in <= "1111111100000000";
		wait for clk_period*2;


		wr <= '1';	rd <= '1';	w_addr <= "11101111";		r_addr <= "10000011";		data_in <= "1010101010101010";
		wait for clk_period*2;


		wr <= '1';	rd <= '1';	w_addr <= "11101011";		r_addr <= "11110000";		data_in <= "0000000000001111";
		wait for clk_period*2;


		wr <= '1';	rd <= '1';	w_addr <= "00000011";		r_addr <= "11010011";		data_in <= "1011110011111000";
		wait for clk_period*2;


		rst <= '0';
		wait for clk_period*2;
		rst <= '1';
		
		wr <= '0';	rd <= '1';		r_addr <= "11000011";		
      -- insert stimulus here 

      wait;
   end process;

END;
