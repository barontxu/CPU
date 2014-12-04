

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--时钟上升沿时，若IFIDFWrite为1：PCin读入新的PC，Insin读入指令
--输出PC和指令各位
entity IFID is
port(	
    clk:    in std_logic;
    IFIDWrite:  in std_logic;                   
    PCin:   in std_logic_vector(15 downto 0);   
    Insin:  in std_logic_vector(15 downto 0);
    PC: out std_logic_vector(15 downto 0);
    Op: out std_logic_vector(4 downto 0);           --指令11~15位
    Rx: out std_logic_vector(2 downto 0);           --指令8~10位
    Ry: out std_logic_vector(2 downto 0);           --指令5~7位
    Rz: out std_logic_vector(2 downto 0);           --指令2~4位
    Imm234: out std_logic_vector(15 downto 0);      --指令2~4位无符号扩展到16位
    Imm: out std_logic_vector(7 downto 0)           --指令0~7位
);
end IFID;