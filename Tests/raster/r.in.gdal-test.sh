###########################################

Title="r.in.gdal test" 

Description="Basic function test of r.in.gdal" 

NEED_GDAL="yes"

NumberOfTests=5

Module[0]="r.in.gdal" 
Module[1]="r.in.gdal" 
Module[2]="r.in.gdal" 
Module[3]="r.in.gdal" 
Module[4]="r.in.gdal" 

ModuleOutput[0]="ascii_map_1_$$" 
ModuleOutput[1]="ascii_map_2_$$" 
ModuleOutput[2]="ascii_map_3_$$" 
ModuleOutput[3]="ascii_map_4_$$" 
ModuleOutput[4]="ascii_map_5_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 
ModuleOutputType[2]="rast" 
ModuleOutputType[3]="rast" 
ModuleOutputType[4]="rast" 

ModuleValidationMD5[0]="a47d5db4ff8c73aea12c47e32524e91c" 
ModuleValidationMD5[1]="446d4c394743f04a185f4698b221867b" 
ModuleValidationMD5[2]="446d4c394743f04a185f4698b221867b" 
ModuleValidationMD5[3]="a47d5db4ff8c73aea12c47e32524e91c"
ModuleValidationMD5[4]="446d4c394743f04a185f4698b221867b" 

ModuleOptions[0]="-o input=$EXTERNAL_DATA_PATH/elevation_map.dted output=${ModuleOutput[0]}"
ModuleOptions[1]="-o input=$EXTERNAL_DATA_PATH/elevation_map.elas output=${ModuleOutput[1]}"
ModuleOptions[2]="-o input=$EXTERNAL_DATA_PATH/elevation_map.envi output=${ModuleOutput[2]}"
ModuleOptions[3]="-o input=$EXTERNAL_DATA_PATH/elevation_map.fit output=${ModuleOutput[3]}"
ModuleOptions[4]="-o input=$EXTERNAL_DATA_PATH/elevation_map.hfa output=${ModuleOutput[4]}"
