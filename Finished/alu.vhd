
--------------------------------------------------------
-- Simple Microprocessor Design 
--
-- alu has functions of bypass, addition and subtraction
-- alu.vhd
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;  
use work.constant_lib.all;

entity alu is
port (	num_A: 	in std_logic_vector(15 downto 0);
		num_B: 	in std_logic_vector(15 downto 0);
		op:	in std_logic_vector(1 downto 0);
		ALUout:	out std_logic_vector(15 downto 0);
        ALUOF: out std_logic
);
end alu;

architecture behv of alu is

signal alu_tmp: std_logic_vector(15 downto 0);

begin

	process(num_A, num_B, op)
	begin			
        ALUOF <= 0;
        case op is
            when "000" => 
                alu_tmp <= num_A + num_B;
                if (num_A >= 0 and num_B >= 0 and alu_tmp < num_A) or (num_A < 0 and num_B < 0 and alu_tmp > num_A) then
                    ALUOF <= 1;
                end if;
            when "001" => 
                alu_tmp <= num_A - num_B;
                if (num_A >= 0 and num_B < 0 and alu_tmp < num_A) or (num_A < 0 and num_B >= 0 and alu_tmp > num_A) then
                    ALUOF <= 1;
                end if;
            when "010" => 
                alu_tmp <= num_A and num_B;
            when "011" => 
                alu_tmp <= num_A or num_B;
            when "100" => 
                alu_tmp <= num_A;
            when "101" => 
                alu_tmp <= num_B;
            when "110" => 
                alu_tmp <= num_B sll num_A;
            when "111" => 
                alu_tmp <= num_B srl num_A;
            when others =>
	    end case; 					  
	end process;
						
	
	ALUout <= alu_tmp;
	
end behv;




