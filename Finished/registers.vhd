---------------------------------------------------
-- n-bit Register (ESD book figure 2.6)
-- by Weijun Zhang, 04/2001
--
-- KEY WORD: concurrent, generic and range
---------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------------------------------

entity reg is
port(	clk:	in std_logic;
    RegWrite:   in std_logic;
    RD_R1:  in std_logic_vector(2 downto 0);
    RD_R2:  in std_logic_vector(2 downto 0);
    WT_R:   in std_logic_vector(2 downto 0);
    WT_D:   in std_logic_vector(15 downto 0);
	D1:	out std_logic_vector(15 downto 0);
    D2:	out std_logic_vector(15 downto 0)
);
end reg;

----------------------------------------------------

architecture behv of reg is
    signal R0: std_logic_vector(15 downto 0);
    signal R1: std_logic_vector(15 downto 0);
    signal R2: std_logic_vector(15 downto 0);
    signal R3: std_logic_vector(15 downto 0);
    signal R4: std_logic_vector(15 downto 0);
    signal R5: std_logic_vector(15 downto 0);
    signal R6: std_logic_vector(15 downto 0);
    signal R7: std_logic_vector(15 downto 0);
    signal D1_tmp: std_logic_vector(15 downto 0);
    signal D2_tmp: std_logic_vector(15 downto 0);
begin

    process(clk)
    begin
        if (RegWrite = 1 and clk = 1 and clk'event) then
            case WT_R
                when "000" =>
                    R0 <= WT_D;
                when "001" =>
                    R1 <= WT_D;
                when "010" =>
                    R2 <= WT_D;
                when "011" =>
                    R3 <= WT_D;
                when "100" =>
                    R4 <= WT_D;
                when "101" =>
                    R5 <= WT_D;
                when "110" =>
                    R6 <= WT_D;
                when "111" =>
                    R7 <= WT_D;
                when others =>
            end case;
        end if;
    end process;
    
    process(RD_R1, RD_R2)
    begin
        case RD_R1 is
            when "000" =>
                D1_tmp <= R0;
            when "001" =>
                D1_tmp <= R1;
            when "010" =>
                D1_tmp <= R2;
            when "011" =>
                D1_tmp <= R3;
            when "100" =>
                D1_tmp <= R4;
            when "101" =>
                D1_tmp <= R5;
            when "110" =>
                D1_tmp <= R6;
            when "111" =>
                D1_tmp <= R7;
            when others =>
        end case;
        
        case RD_R2 is
            when "000" =>
                D2_tmp <= R0;
            when "001" =>
                D2_tmp <= R1;
            when "010" =>
                D2_tmp <= R2;
            when "011" =>
                D2_tmp <= R3;
            when "100" =>
                D2_tmp <= R4;
            when "101" =>
                D2_tmp <= R5;
            when "110" =>
                D2_tmp <= R6;
            when "111" =>
                D2_tmp <= R7;
            when others =>
        end case;
    end process;

    -- concurrent statement
    D1 <= D1_tmp;
    D1 <= D2_tmp;

end behv;

---------------------------------------------------
