
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- ÅÔÂ·µ¥Ôª
-- ForwardA = 
-- ForwardB = 
entity ForwardingUnit is
port(	
    EXEMEMrt: in std_logic_vector(2 downto 0);
    MEMWBrt: in std_logic_vector(2 downto 0);
    IDEXErx: in std_logic_vector(2 downto 0);
    IDEXEry: in std_logic_vector(2 downto 0); 
    FowardA: out std_logic_vector(1 downto 0);
    FowardB: out std_logic_vector(1 downto 0);
);

end ForwardingUnit;
