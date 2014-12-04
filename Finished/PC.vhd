--------------------------------------------------------
-- Simple Microprocessor Design
--
-- Program Counter 
-- PC.vhd
--------------------------------------------------------

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;  
use work.constant_lib.all;

entity PC is
port(	clk:	in std_logic;
		PCin:	in std_logic_vector(15 downto 0);
		PCout:	out std_logic_vector(15 downto 0)
);
end PC;

architecture behv of PC is

signal tmp_PC: std_logic_vector(15 downto 0);

begin				
	process(PCld, PCin)
	begin
		if (clk'event and clk = '1') then
			tmp_PC <= PCin;
		end if;
	end process;

	PCout <= tmp_PC;
;

end behv;

