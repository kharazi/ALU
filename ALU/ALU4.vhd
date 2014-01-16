--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.2
--  \   \         Application : 
--  /   /         Filename : xil_34000_21
-- /___/   /\     Timestamp : 01/16/2014 18:28:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AlU4 is
	port(   Cl : in std_logic; -- Clock
			  A,B : in signed(3 downto 0); --input operands
			  Operation : in signed(3 downto 0); --select operation
			  Result : out signed(3 downto 0);  --Reg3
			  Co : out std_logic --carry output
		); 
	end ALU4;

architecture BEHAVIORAL of ALU4 is
signal Reg1,Reg2,Reg3 : signed(3 downto 0) := "0000";

begin
Reg1 <= A;
Reg2 <= B;
Result <= Reg3;
process(Cl)
begin
    if(rising_edge(Cl)) then --Do the calculation at the positive edge of clock cycle.
        case Operation is
            when "0000" => 
                Reg3 <= Reg1 + Reg2;  --ADD
            when "0001" => 
                Reg3 <= Reg1 - Reg2; --SUB
            when "0010" => 
                Reg3 <= Reg1 * Reg2;  --MUl
            when "0011" => 
                Reg3 <= Reg1 / Reg2; --DIV 
            when "0100" => 
                Reg3 <= Reg1 nor Reg2; --NOR              
            when "0101" => 
                Reg3 <= Reg1 nand Reg2;  --NAND 
            when "0110" => 
                Reg3 <= Reg1 or Reg2;  --OR   
            when "0111" => 
                Reg3 <= Reg1 and Reg2; --AND    
            when "1000" => 
                Reg3 <= Reg1 xor Reg2;  --xor
            when "1001" => 
                Reg3 <= Reg1 srl 1; --shift right logical
            when "1010" => 
                Reg3 <= Reg1 sll 1; --shift left logical
	    when "1011" =>
		Reg3 <= Reg1 ror 1; -- right rotate
	    when "1100" =>
		Reg3 <= Reg1 rol 1;  -- left rotate
	    when others =>
                NULL;
        end case;       
    end if;
end process;
end BEHAVIORAL;


