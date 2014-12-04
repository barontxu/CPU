-- Control
-- 根据控制信号.xlsx生成各个指令的控制信号
-- 指令的操作码op在实验指导书23页可找


library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Control is
port(	
    op: in std_logic_vector(15 downto 0);
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


architecture behv of Control is

signal RegDst_tmp:  std_logic_vector(1 downto 0);
signal PCsrc_tmp:   std_logic_vector(1 downto 0);
signal ALUop_tmp:   std_logic_vector(2 downto 0);
signal ALUsrcA_tmp: std_logic_vector(2 downto 0);
signal ALUsrcB_tmp: std_logic_vector(1 downto 0);
signal RegWrite_tmp:    std_logic;
signal SPWrite_tmp: std_logic;
signal TWrite_tmp:  std_logic;
signal IHWrite_tmp: std_logic;
signal MemReg_tmp:  std_logic;
signal CMP_tmp: std_logic;
signal MemSrc_tmp:  std_logic_vector(1 downto 0);
signal MemWrite_tmp:    std_logic;
signal RAWrite_tmp: std_logic;

begin
    
    process(op, T, Rx)
    begin
        RegDst_tmp <=  "00";
        PCsrc_tmp <=  "00";
        ALUop_tmp <=  "000";
        ALUsrcA_tmp <=  "000";
        ALUsrcB_tmp <=  "00";
        RegWrite_tmp <=  '0';
        SPWrite_tmp <=  '0';
        TWrite_tmp <=  '0';
        IHWrite_tmp <=  '0';
        MemReg_tmp <=  '0';
        CMP_tmp <=  '0';
        MemSrc_tmp <=  "00";
        MemWrite_tmp <=  '0';
        RAWrite_tmp <=  '0';
        case op(15 downto 11) is
            
            when "01001" =>  -- ADDIU
                ALUsrcB_tmp <=  "01";
                RegWrite_tmp <=  '1';
            when "01000" => -- ADDIU3
                RegDst_tmp <= "01";
                ALUsrcB_tmp <=  "01";
                RegWrite_tmp <=  '1';
            when "00000" => -- ADDSP3
                ALUsrcA_tmp <= "001";
                ALUsrcB_tmp <= "01";
                RegWrite_tmp < = '1';
            when "01100" => -- ADDSP, BTEQZ, MTSP, SW_RS
                case op(10 downto 8)
                    when "011" => -- ADDSP
                        ALUsrcA_tmp <= "001";
                        ALUsrcB_tmp <= "01";
                        SPWrite_tmp <= '1';
                    when "000" => -- BTEQZ
                        if T = '0' then
                            PCsrc_tmp <= "01";
                        else
                            PCsrc_tmp <= "00";
                        end if;
                    when "100" => -- MTSP
                        SPWrite_tmp <= '1';
                    when "010" => -- SW_RS
                        ALUsrcA_tmp <= "001";
                        ALUsrcB_tmp <= "01";
                        MemSrc_tmp <= "10";
                        MemWrite_tmp <= '1';
                end case;                
            when "11100" => -- ADDU, SUBU
                if op(1) = '0' -- ADDU
                    RegDst_tmp <= "10";
                    RegWrite_tmp <= '1';
                else -- SUBU
                    RegDst_tmp <= "10";
                    ALUop_tmp <= "001";
                    RegWrite_tmp <= '1';
                end if;               
            when "11101" => -- AND, OR, SLT, CMP, JALR, MFPC
                case op(4 downto 0)
                    when "01100" => -- AND
                        ALUop_tmp <= "010";
                        RegWrite_tmp <= '1';
                    when "01101" => -- OR
                        ALUop_tmp <= "011";
                        RegWrite_tmp <= '1';
                    when "00010" => -- SLT
                        CMP_tmp <= '1';
                        TWrite_tmp <= '1';
                    when "01010" => -- CMP
                        TWrite_tmp <= '1';
                    when "00000" => -- JALR, JR, JRRA, MFPC
                        case op(7 downto 5)
                            when "110" => -- JALR
                                PCsrc_tmp <= "10";
                                RAWrite_tmp <= '1';
                            when "000" => -- JR
                                PCsrc_tmp <= "10";
                            when "001" => -- JRRA
                                PCsrc_tmp <= "11";
                            when "010" => -- MFPC
                                ALUop_tmp <= "100";
                                ALUsrcA_tmp <= "011";
                                RegWrite_tmp <= '1';
                        end case;
                        
                end case;
            when "00010" => -- B
                PCsrc_tmp <= "01";
            when "00100" => -- BEQZ
                if Rx = '0' then
                    PCsrc_tmp <= "01";
                else
                   PCsrc_tmp <= "00";
                end if;
            when "00101" => -- BNEZ
                if Rx = '0' then
                    PCsrc_tmp <= "00";
                else
                   PCsrc_tmp <= "01";
                end if; 
            when "01101" => -- LI
            when "10011" => -- LW
            when "10010" => -- LW_SP
            when "11110" => -- MFIH, MTIH
                if op(0) = '0' then -- MFIH
                    
                else -- MTIH
                     
                end if;
            when "00110" => -- SLL, SRA
                if op(0) = '0' then -- SLL
                    ALUop_tmp <= "110";
                    ALUsrcA <= "100";
                    RegWrite <= '1';
                else -- SRA 
                    ALUop_tmp <= "111";
                    ALUsrcA <= "100";
                    RegWrite <= '1';
                end if;
            when "11011" => -- SW
                ALUsrcB_tmp <= "01";
                MemSrc_tmp <= "01";
                MemWrite_tmp <= '1';
            when "11010" => -- SW_SP
                ALUsrcA_tmp <= "001";
                ALUsrcB_tmp <= "01";
                MemWrite_tmp <= '1';      
            others => -- NOP   
        end case;
    end process;
    
    RegDst <= RegDst_tmp;
    PCsrc <= PCsrc_tmp
    ALUop <= ALUop_tmp
    ALUsrcA <= ALUsrcA_tmp
    ALUsrcB <= ALUsrcB_tmp
    RegWrite <= RegWrite_tmp
    SPWrite <= SPWrite_tmp
    TWrite <= TWrite_tmp
    IHWrite <= IHWrite_tmp
    MemReg <= MemReg_tmp
    CMP <= CMP_tmp
    MemSrc <= MemSrc_tmp
    MemWrite <= MemWrite_tmp
    RAWrite <= RAWrite_tmp
    
end behv;

