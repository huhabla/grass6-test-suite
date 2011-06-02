###########################################

Title="r3.mask test"

#TestType="integration"

Description="Basic function test of r3.mask" 

NumberOfTests=2

Module[0]="r3.mapcalc" 
Module[1]="r3.mask" 

ModuleOutput[0]="g3d_mapcalc_test_map_$$" 
ModuleOutput[1]="G3D_MASK" 

ModuleOutputType[0]="rast3d" 
ModuleOutputType[1]="rast3d" 

ModuleValidationMD5[0]="4e9fdcd0fe00a9c7a9ff622e57a23d67" 
ModuleValidationMD5[1]="3873e5a224c007f466539a03db7b3151" 

ModuleOptions[0]="\"${ModuleOutput[0]} = 10\""
ModuleOptions[1]="map=${ModuleOutput[0]} maskvalues=10" 

