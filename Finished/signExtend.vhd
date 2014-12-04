
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity signExtend is
port(	Imm:	  in std_logic_vector(7 downto 0);
    Ext:    out std_logic_vector(15 downto 0)
);
end signExtend;


architecture behv of signExtend is

begin
    Ext(7 downto 0) <= Imm;
    Ext(15 downto 8) <= Imm(7);
end behv;