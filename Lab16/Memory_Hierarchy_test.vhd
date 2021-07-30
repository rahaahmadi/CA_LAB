
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Memory_Hierarchy_test IS
END Memory_Hierarchy_test;
 
ARCHITECTURE behavior OF Memory_Hierarchy_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_Hierarchy
    PORT(
         addr : IN  std_logic_vector(15 downto 0);
         rd : IN  std_logic;
         wr : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal addr : std_logic_vector(15 downto 0) := (others => '0');
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_Hierarchy PORT MAP (
          addr => addr,
          rd => rd,
          wr => wr,
          data_in => data_in,
          data_out => data_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      addr <= "0000000000000001";		rd <= '0';		wr <= '1';		data_in <= "10101010";	
		wait for 100 ns;
		
      addr <= "0000000000000111";		rd <= '0';		wr <= '1';		data_in <= "11110000";	
		wait for 100 ns;

      addr <= "0000000000000011";		rd <= '0';		wr <= '1';		data_in <= "00001111";	
		wait for 100 ns;

    --  addr <= "0000000000000000";		rd <= '0';		wr <= '1';		data_in <= "11110000";	
	--	wait for 100 ns;

      addr <= "0000000000000111";		rd <= '1';		wr <= '0';		
		wait for 100 ns;

      addr <= "0000000000000001";		rd <= '1';		wr <= '0';			
		wait for 100 ns;

      addr <= "0000000000000011";		rd <= '1';		wr <= '0';		
		wait for 100 ns;

      addr <= "0000000000000001";		rd <= '1';		wr <= '0';		
		wait for 100 ns;		

      -- insert stimulus here 

      wait;
   end process;

END;
