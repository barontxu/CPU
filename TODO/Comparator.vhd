
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- 两个16位比较
-- 当CMP==0:    res = (A != B)
-- 当CMP==1：   res = (A < B)
entity Comparator is
port(	
    A:	in std_logic_vector(15 downto 0);
	B:  in std_logic_vector(15 downto 0);
    CMP:	in std_logic;
    res:    out std_logic
);

end Comparator;
