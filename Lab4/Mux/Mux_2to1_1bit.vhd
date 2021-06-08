----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:10:02 04/26/2021 
-- Design Name: 
-- Module Name:    Mux_2to1_1bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_2to1_1bit is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end Mux_2to1_1bit;

architecture Behavioral of Mux_2to1_1bit is

begin
	
	output <= (sel and A1) or ((not sel) and A0); 
end Behavioral;

