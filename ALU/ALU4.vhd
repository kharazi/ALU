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
			  A,B : in signed(7 downto 0); --input operands
			  Operation : in signed(3 downto 0); --select operation
			  Result : out signed(7 downto 0);  --result
			  Co : out std_logic; --carry output
	end ALU4;

architecture BEHAVIORAL of ALU4 is
	co <='0';
process(Clk)
begin

    if(rising_edge(Clk)) then --Do the calculation at the positive edge of clock cycle.
        case Operation is
            when "0000" => 
                Result <= A + B;  --ADD
            when "0001" => 
                Result <= A - B; --SUB
            when "0010" => 
                Result <= A * B;  --MUl
            when "0011" => 
                Result <= A / B; --DIV 
            when "0100" => 
                Result <= A nor B; --NOR              
            when "0101" => 
                Result <= A nand B;  --NAND 
            when "0110" => 
                Result <= A or B;  --OR   
            when "0111" => 
                Result <= A and B; --AND    
            when "1000" => 
                Result <= A xor B;  --xor
            when "1001" => 
                Result <= sra A; -- shift right arithmatic
            when "1010" => 
                Result <= sla A;  --shift left arithmatic
            when "1011" => 
                Result <= srl A; --shift right logical
            when "1100" => 
                Result <= sll A; --shift left logical
				when "1101" =>
					 Result <= ror A; -- right rotate
				when "1110" =>
					 Result <= rol A;  -- left rotate
            when others =>
                NULL;
        end case;       
    end if;
end BEHAVIORAL;


