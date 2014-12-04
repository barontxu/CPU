

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--clk上升沿时，若EXEMEMWrite为1，则将Xin写入到X
--输出X
entity EXEMEM is
port(	
    clk:    in std_logic;
    EXEMEMWrite: in std_logic;
    RegWritein: in std_logic;
    SPWritein:  in std_logic;
    MemRegin:   in std_logic;
    MemSrcin:   in std_logic_vector(1 downto 0);
    MemWritein: in std_logic;
    MemReadin:  in std_logic;
    Rxin:   in std_logic_vector(2 downto 0);
    Ryin:   in std_logic_vector(2 downto 0);
    Rtin:   in std_logic_vector(2 downto 0);
    Resin:  in std_logic_vector(15 downto 0);
    RegWrite: out std_logic;
    SPWrite:  out std_logic;
    MemReg:   out std_logic;
    MemSrc:   out std_logic_vector(1 downto 0);
    MemWrite: out std_logic;
    MemRead:  out std_logic;
    Rx:   out std_logic_vector(2 downto 0);
    Ry:   out std_logic_vector(2 downto 0);
    Rt:   out std_logic_vector(2 downto 0);
    Res:    out std_logic_vector(15 downto 0)
);
end EXEMEM;