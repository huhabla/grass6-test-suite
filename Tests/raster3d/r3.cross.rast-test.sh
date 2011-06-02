###########################################

Title="r3.cross.rast test" 

TestType="unit"

Description="Full function test of r3.cross.rast" 

NumberOfTests=4

Module[0]="r3.cross.rast" #cross the g3d map with the elevation map
Module[1]="r3.cross.rast" #cross the g3d map with the elevation map
Module[2]="r3.cross.rast" #cross the g3d map with the elevation map
Module[3]="r3.cross.rast" #cross the g3d map with the elevation map

ModuleOutput[0]="g2d_test_map_1_$$" 
ModuleOutput[1]="g2d_test_map_2_$$" 
ModuleOutput[2]="g2d_test_map_3_$$" 
ModuleOutput[3]="g2d_test_map_4_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 
ModuleOutputType[2]="rast" 
ModuleOutputType[3]="rast" 

ModuleValidationMD5[0]="1225f8dc1f961d5c06922826702cbc03" 
ModuleValidationMD5[1]="1225f8dc1f961d5c06922826702cbc03" 
ModuleValidationMD5[2]="80ac169e2ee7b4896cfe8a34d61cea9a" 
ModuleValidationMD5[3]="a75be684c96246954ebd6fa0e92679ba" 

ModuleOptions[0]="input=volume elevation=Int180 output=${ModuleOutput[0]}"
ModuleOptions[1]="input=volume elevation=Float180 output=${ModuleOutput[1]}"
ModuleOptions[2]="input=volume elevation=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="input=random elevation=elevation output=${ModuleOutput[3]}"
