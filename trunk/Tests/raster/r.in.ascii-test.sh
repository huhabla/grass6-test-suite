###########################################

Title="r.in.ascii test" 

Description="Basic function test of r.in.ascii" 

NumberOfTests=3

Module[0]="r.in.ascii" 
Module[1]="r.in.ascii" 
Module[2]="r.in.ascii" 

ModuleOutput[0]="ascii_map_1_$$" 
ModuleOutput[1]="ascii_map_2_$$" 
ModuleOutput[2]="ascii_map_3_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 
ModuleOutputType[2]="rast" 

ModuleValidationMD5[0]="2f83b00ed920757dba69c7cf63b27aef" 
ModuleValidationMD5[1]="446d4c394743f04a185f4698b221867b" 
ModuleValidationMD5[2]="6e6e06b356679a251da2945fa72975a4" 

ModuleOptions[0]="-i input=$EXTERNAL_DATA_PATH/RandomInt_map.ascii output=${ModuleOutput[0]}"
ModuleOptions[1]="-f input=$EXTERNAL_DATA_PATH/elevation_map.ascii output=${ModuleOutput[1]}"
ModuleOptions[2]="-d input=$EXTERNAL_DATA_PATH/elevation_map.ascii output=${ModuleOutput[2]}"
