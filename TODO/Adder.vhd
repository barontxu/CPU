
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- 两个16位相加
entity ADDER is
port(	
    A:	in std_logic_vector(15 downto 0);
	B:  in std_logic_vector(15 downto 0);
    sum:	out std_logic_vector(15 downto 0)
);

end ADDER;
