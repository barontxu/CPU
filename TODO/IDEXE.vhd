

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--clk上升沿时，若IDEXEWrite为1，则将Xin写入到X
--输出X
entity IDEXE is
port(	
    clk:    in std_logic;
    IDEXEWrite: in std_logic;
    ALUsrcAin:  in std_logic_vector(2 downto 0);
    ALUsrcBin:  in std_logic_vector(1 downto 0);
    RegWritein: in std_logic;
    ALUopin:    in std_logic_vector(2 downto 0);
    SPWritein:  in std_logic;
    MemRegin:   in std_logic;
    MemSrcin:   in std_logic_vector(1 downto 0);
    MemWritein: in std_logic;
    MemReadin:  in std_logic;
    Rxin:   in std_logic_vector(2 downto 0);
    Ryin:   in std_logic_vector(2 downto 0);
    D1in:   in std_logic_vector(15 downto 0);
    D2in:  in std_logic_vector(15 downto 0);
    Rtin:   in std_logic_vector(2 downto 0);
    Imm234in:   in std_logic_vector(15 downto 0);
    Immin: in std_logic_vector(15 downto 0);  
    ALUsrcA:  out std_logic_vector(2 downto 0);
    ALUsrcB:  out std_logic_vector(1 downto 0);
    RegWrite: out std_logic;
    ALUop:    out std_logic_vector(2 downto 0);
    SPWrite:  out std_logic;
    MemReg:   out std_logic;
    MemSrc:   out std_logic_vector(1 downto 0);
    MemWrite: out std_logic;
    MemRead:  out std_logic;
    Rx:   out std_logic_vector(2 downto 0);
    Ry:   out std_logic_vector(2 downto 0);
    D1:   out std_logic_vector(15 downto 0);
    D2:  out std_logic_vector(15 downto 0);
    Rt:   out std_logic_vector(2 downto 0);
    Imm234:   out std_logic_vector(15 downto 0);
    Imm: out std_logic_vector(15 downto 0)
);
end IDEXE;