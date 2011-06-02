###########################################

#Tile
Title="r.to.rast3 test" # -- required

#A description of the test
Description="Full function test of r.to.rast3" # -- optional

NumberOfTests=4

Module[0]="r.to.rast3" 
Module[1]="r.to.rast3" 
Module[2]="r.to.rast3" 
Module[3]="r.to.rast3" 

ModuleOutput[0]="g3d_test_map_1_$$" 
ModuleOutput[1]="g3d_test_map_2_$$" 
ModuleOutput[2]="g3d_test_map_3_$$" 
ModuleOutput[3]="g3d_test_map_4_$$" 

ModuleOutputType[0]="rast3d" 
ModuleOutputType[1]="rast3d" 
ModuleOutputType[2]="rast3d" 
ModuleOutputType[3]="rast3d" 

ModuleValidationMD5[0]="22ddf318f7f3b320e3609edbbbb5ed7a" 
ModuleValidationMD5[1]="22ddf318f7f3b320e3609edbbbb5ed7a" 
ModuleValidationMD5[2]="30c25143e1ea8cd918508f508727de38" 
ModuleValidationMD5[3]="30c25143e1ea8cd918508f508727de38" 

ModuleOptions[0]="input=Int140,Int180,Int220,Int260,Int300 output=${ModuleOutput[0]}"
ModuleOptions[1]="input=Float140,Float180,Float220,Float260,Float300 output=${ModuleOutput[1]}"
ModuleOptions[2]="input=Int140,Int300 output=${ModuleOutput[2]}"
ModuleOptions[3]="input=Float140,Float300 output=${ModuleOutput[3]}"
