###########################################

Title="r3.mapcalc Test" 

Description="Tests the basic functions of r3.mapcalc " 

NumberOfTests=5

Module[0]="r3.mapcalc"
Module[1]="r3.mapcalc"
Module[2]="r3.mapcalc"
Module[3]="r3.mapcalc"
Module[4]="r3.mapcalc"

ModuleOutput[0]="mapcalc_output0_$$" #these map is needed later
ModuleOutput[1]="mapcalc_output1_$$" #these map is needed later
ModuleOutput[2]="mapcalc_output2_$$" #this map can be overwritten
ModuleOutput[3]="mapcalc_output3_$$"
ModuleOutput[4]="mapcalc_output4_$$"

ModuleOutputType[0]="rast3d"
ModuleOutputType[1]="rast3d"
ModuleOutputType[2]="rast3d"
ModuleOutputType[3]="rast3d"
ModuleOutputType[4]="rast3d"

ModuleValidationMD5[0]="4e9fdcd0fe00a9c7a9ff622e57a23d67"
ModuleValidationMD5[1]="4e9fdcd0fe00a9c7a9ff622e57a23d67"
ModuleValidationMD5[2]="2be4f3152d077624619107a27d0634f7"
ModuleValidationMD5[3]="4e9fdcd0fe00a9c7a9ff622e57a23d67"
ModuleValidationMD5[4]="2be4f3152d077624619107a27d0634f7"

ModuleOptions[0]="\"${ModuleOutput[0]} = 10\""
ModuleOptions[1]="\"${ModuleOutput[1]} = 10.0\""
ModuleOptions[2]="\"${ModuleOutput[2]} = sin(x()) + cos(y()) + row() +col()\""
ModuleOptions[3]="\"${ModuleOutput[3]} = 1*${ModuleOutput[0]}\""
ModuleOptions[4]="\"${ModuleOutput[4]} = 1*${ModuleOutput[2]}\""
