
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mealy_machine_test IS
END mealy_machine_test;
 
ARCHITECTURE behavior OF mealy_machine_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mealy_machine
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mealy_machine PORT MAP (
          input => input,
          clk => clk,
          output => output
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
     wait for 22ns;	

 

      input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period;


      input <= '1';
		wait for clk_period;


      input <= '0';
		wait for clk_period;


      input <= '1';
		wait for clk_period;


      input <= '1';
		wait for clk_period;

      input <= '0';
		wait for clk_period;


      input <= '1';
		wait for clk_period;


      input <= '0';
		wait for clk_period;

      input <= '1';
		wait for clk_period;
      
		wait;

      wait;
   end process;

END;
