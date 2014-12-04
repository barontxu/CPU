----------------------------------------------------
-- VHDL code for n-bit counter (ESD figure 2.6)
-- by Weijun Zhang, 04/2001
--
-- this is the behavior description of n-bit counter
-- another way can be used is FSM model. 
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counter is

generic(n: natural :=8);
port(	clk:	in std_logic;
	Q:	out std_logic_vector(n-1 downto 0)
);
end counter;

----------------------------------------------------

architecture behv of counter is		 	  
	
    signal Pre_Q: std_logic_vector(n-1 downto 0);

begin

    -- behavior describe the counter

    process(clk)
    begin
	if (clk='1' and clk'event) then
		Pre_Q <= Pre_Q + 1;
	end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q;

end behv;

-----------------------------------------------------
