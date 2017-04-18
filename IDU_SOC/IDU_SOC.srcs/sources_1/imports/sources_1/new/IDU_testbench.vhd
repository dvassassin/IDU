----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2017 06:01:10 PM
-- Design Name: 
-- Module Name: IDU_testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IDU_testbench is
--  Port ( );
end IDU_testbench;

architecture Behavioral of IDU_testbench is
component IDU is 
port(
     Instruction : in std_logic_vector(20 downto 0);-----input instruction to  be decoded
     opcode   : out std_logic_vector(3 downto 0);-----4bit opcode for ALU(IR(15 DOWNTO 12))
     shift_rotate_operation : out std_logic_vector(3 downto 0);---a number between 0 to 7 indicating "how amny times"
     Operand_Selection      : out std_logic;-- 0 means  operand2,=Ry,1means operand2<=kk
     
     X_address,Y_address    : out std_logic_vector(7 downto 0);----Rx ADDRESS AND Ry address
       
     Conditional    : out std_logic; ------indicating the JUMP is conditioanl or not 
     Jump           : out std_logic;-------indicating the instruction type ,1means JMP,JZ,JC .0 MEANS NORMAL
     Jump_address   : out std_logic_vector(7 downto 0);---indicaiitng the line of jump
     
     Condition_flag : out std_logic;----condition for jump , 0 means  JZ ,and 1 mean s JC
     Exp            : out std_logic----indicating whether the instruction is export or not
    );
end component IDU;

signal Instruction: std_logic_vector(20 downto 0);
signal opcode: std_logic_vector(3 downto 0);
signal shift_rotate_operation : std_logic_vector(3 downto 0);
signal Operand_Selection: std_logic;
signal X_address,Y_address: std_logic_vector(7 downto 0);
signal Conditional: std_logic;
signal Jump: std_logic;
signal Jump_address: std_logic_vector(7 downto 0);
signal Condition_flag: std_logic;
signal Exp: std_logic;

---------- clock period ----------
constant clk_period : time := 10 ns;
signal clk: std_logic;

begin
-- clock_process
    clock_process : process
    begin 
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
-- port map
    uut: IDU port map(
                      Instruction => Instruction,
                      opcode => opcode,
                      shift_rotate_operation => shift_rotate_operation,
                      Operand_Selection =>Operand_Selection,
                      X_address => X_address,
                      Y_address => Y_address,
                      Conditional => Conditional,
                      Jump => Jump,
                      Jump_address => Jump_address,
                      Condition_flag => Condition_flag,
                      Exp => Exp
                      );
    
 -- stimulate process
    stim_proc : process
     begin
     
     Instruction(19 downto 0) <= x"01234";
     Instruction(20) <= '0';
     
     wait for clk_period;
     
     Instruction(19 downto 0) <= x"11234";
     Instruction(20) <= '0';
          
     wait for clk_period;
     
     Instruction(19 downto 0) <= x"21234";
     Instruction(20) <= '0';
          
     wait for clk_period;
     
     Instruction(19 downto 0) <= x"31234";
     Instruction(20) <= '0';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"41234";
     Instruction(20) <= '0';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"50034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"60034";
     Instruction(20) <= '1';
          
     wait for clk_period; 

     Instruction(19 downto 0) <= x"70034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"80034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"90034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"a0034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"b1234";
     Instruction(20) <= '0';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"c1234";
     Instruction(20) <= '0';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"d1234";
     Instruction(20) <= '0';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"e0034";
     Instruction(20) <= '0';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"e0034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"e8034";
     Instruction(20) <= '1';
          
     wait for clk_period;

     Instruction(19 downto 0) <= x"f0034";
     Instruction(20) <= '1';
          
     wait for clk_period;
     
     wait;
     end process;
end Behavioral;
