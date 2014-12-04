

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--���ݿ����ź�.xlsx���ɸ���ָ��Ŀ����ͺ�
--ָ��Ĳ�����op��ʵ��ָ����23ҳ����
entity Control is
port(	
    op: in std_logic_vector(4 downto 0);
    T:  in std_logic;
    Rx: in std_logic_vector(15 downto 0);
    RegDst: out std_logic_vector(1 downto 0);
    PCsrc:  out std_logic_vector(1 downto 0);
    ALUop:  out std_logic_vector(2 downto 0);
    ALUsrcA: out std_logic_vector(2 downto 0);
    ALUsrcB:  out std_logic_vector(1 downto 0);
    RegWrite: out std_logic;
    SPWrite: out std_logic;
    TWrite: out std_logic;
    IHWrite: out std_logic;
    MemReg: out std_logic;
    CMP: out std_logic;
    MemSrc:  out std_logic_vector(1 downto 0);
    MemWrite: out std_logic;
    RAWrite: out std_logic
);
end Control;