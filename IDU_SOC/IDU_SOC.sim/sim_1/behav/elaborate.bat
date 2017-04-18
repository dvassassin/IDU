@echo off
set xv_path=D:\\xlinix\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto be2bf571cfe44ab49f8211d818406fde -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot IDU_testbench_behav xil_defaultlib.IDU_testbench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
