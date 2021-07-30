----------------------------------------------------------------------------------
-- Company: AmirKabir University Of Technology

-- Engineer: 

-- Create Date:    02:17:00 06/09/2021 

-- Module Name:    Memory_Hierarchy - Behavioral 

-- Description: It is a simple implementation that shows relation between cache and ram
-- Has been implemented according to the agenda of the 16th experiment of the Computer Architecture Laboratory

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- memory = 256* 16
-- cache = 16 *16

entity Memory_Hierarchy is
    Port ( addr : in STD_LOGIC_VECTOR(15 downto 0);
           rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR(7 downto 0);
           data_out : out  STD_LOGIC_VECTOR(7 downto 0));
end Memory_Hierarchy;

architecture Behavioral of Memory_Hierarchy is


--Type block_t is array (15 downto 0) of std_logic_vector(7 downto 0);

Type ram_t is array (65535 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
signal ram: ram_t;


-- cache form row : data - offset in block 
Type cache_t is array (2047 downto 0) of STD_LOGIC_VECTOR(11 downto 0);
signal cache : cache_t;

-- form of cache_info's row : valid - tag (each row for one block)
Type cache_info_t is array(127 downto 0) of std_logic_vector(5 downto 0);
signal cache_info : cache_info_t;

begin



	process(addr, rd, wr, data_in)
	
	   variable addr_int : integer;

		variable offset : integer;
      variable index : integer;
		variable tag : std_logic_vector(4 downto 0); 
		
	begin	
	
		
	   addr_int := to_integer(unsigned(addr));
		offset := to_integer(unsigned(addr(3 downto 0)));
      index := to_integer(unsigned(addr(10 downto 4)));
		tag := addr(15 downto 11); 
	 -- report "addr_int = " & integer'image(addr_int) & "addr=" & integer'image(to_integer(unsigned(addr)));
	  
		if(rd = '1' and wr = '0') then
		
				if(cache_info(index)='1' & tag) then   -- if related block in cache is valid and correct
					data_out <= cache(index*16 + offset)(11 downto 4);
					
            else
					data_out <= ram(to_integer(unsigned(addr)));
				
					for i in 0 to 15 loop  --placing correspond block in cache
						 cache(index * 16 + i) <= ram(addr_int / 16 + i) & std_logic_vector(to_unsigned(i, 4));
					end loop;
					cache_info(index) <= '1' & tag;
	
				end if;	
				
			
		elsif(rd = '0' and wr = '1') then
				
				if(cache_info(index)='1' & tag) then  -- if related block in cache is valid and correct
					cache(index*16 + offset) <= data_in ;
				end if;

				ram(addr_int) <= data_in;		
		
		end if;
		
	end process;



end Behavioral;

