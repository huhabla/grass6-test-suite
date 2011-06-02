###########################################

Title="r3.null test"

TestType="unit"

Description="Basic function test of r3.null" 

NumberOfTests=6

Module[0]="r3.mapcalc" 
Module[1]="r3.info" 
Module[2]="r3.null" 
Module[3]="r3.info" 
Module[4]="r3.null" 
Module[5]="r3.info" 

ModuleOutput[0]="g3d_mapcalc_test_map_$$" 
ModuleOutput[2]="g3d_mapcalc_test_map_$$" 
ModuleOutput[4]="g3d_mapcalc_test_map_$$" 

ModuleOutputType[0]="rast3d" 
ModuleOutputType[2]="rast3d" 
ModuleOutputType[4]="rast3d" 

ModuleValidation[0]="" 

ModuleValidationMD5[0]="c523a8d0ad0ff1042353007c15bbabd3" 
ModuleValidationMD5[2]="e57994097545bb5f0dbc7533ff155bed" 
ModuleValidationMD5[4]="c523a8d0ad0ff1042353007c15bbabd3" 

ModuleOptions[0]="\"${ModuleOutput[0]} = depth()\""
ModuleOptions[1]="-r map=${ModuleOutput[0]}" 
ModuleOptions[2]="map=${ModuleOutput[0]} setnull=1" 
ModuleOptions[3]="-r map=${ModuleOutput[0]}" 
ModuleOptions[4]="map=${ModuleOutput[0]} null=1" 
ModuleOptions[5]="-r map=${ModuleOutput[0]}" 
