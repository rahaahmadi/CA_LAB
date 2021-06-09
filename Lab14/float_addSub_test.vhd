
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY float_addSub_test IS
END float_addSub_test;
 
ARCHITECTURE behavior OF float_addSub_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT floating_point_addSub
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: floating_point_addSub PORT MAP (
          A => A,
          B => B,
          sel => sel,
          output => output
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


		A <= "00000000";     B <= "10000011";		sel <= '0';
		report "A -> 00000000(0)  -  B -> 10000011(-1.011)  = 10000011 (-1.011)";
		wait for 100 ns;
		   
		A <= "01000001";     B <= "01000011";		sel <= '0';
		report "A -> 01000001(1.001 * 2^0)  +  B -> 01000011(1.011 * 2^0)  = 01001010(+1.010 * 2^1)";
		wait for 100 ns;

		A <= "00101000";     B <= "00111011";		sel <= '0';
		report "A -> 00101000(1.000 * 2^-3)  +  B -> 00111011(1.011 * 2^-1)  = 00111101 (1.111 * 2^0)";
		wait for 100 ns;

		A <= "11010110";     B <= "01110100";		sel <= '1';
		report "A -> 11010110(-1.11 * 2^2)  -  B -> 01110100(1.100 * 2^6)  = 11110100(-1.100 * 2^6)";
		wait for 100 ns;


		A <= "01000001";     B <= "01000011";		sel <= '1';
		report "A -> 01000001(1.001 * 2^0)  -  B -> 01000011(1.011 * 2^0)  = 1110000(-1.000 * 2^-2)";
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
