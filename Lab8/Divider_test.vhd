
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY Divider_test IS
END Divider_test;
 
ARCHITECTURE behavior OF Divider_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Divider
    PORT(
         RA : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Quotient : OUT  std_logic_vector(3 downto 0);
         Remainder : OUT  std_logic_vector(3 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RA : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Quotient : std_logic_vector(3 downto 0);
   signal Remainder : std_logic_vector(3 downto 0);
   signal overflow : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Divider PORT MAP (
          RA => RA,
          B => B,
          CLK => CLK,
          RST => RST,
          Quotient => Quotient,
          Remainder => Remainder,
          overflow => overflow
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
		
	 if NOW > CLK_period*100  then
		wait;
     end if;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		RA <= "00000111";
		B <= "0011";
		wait for CLK_period*20;
		
		
		RA <= "10010111";
		B <= "1011";
		wait for CLK_period*20;


	
		RA <= "10010111";
		B <= "1011";
		wait for CLK_period*20;



		RA <= "11010100";
		B <= "0111";
		wait for CLK_period*20;


	   RA <= "01010100";
		B <= "0111";
		wait for CLK_period*20;
      -- insert stimulus here 

    
     WAIT;
   end process;

END;
