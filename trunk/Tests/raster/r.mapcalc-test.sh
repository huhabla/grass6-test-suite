###########################################

Title="r.mapcalc test" # -- required

Description="Tests the basic functions of r.mapcalc " # -- optional

NumberOfTests=5 

Module[0]="r.mapcalc" 
Module[1]="r.mapcalc" 
Module[2]="r.mapcalc" 
Module[3]="r.mapcalc" 
Module[4]="r.mapcalc" 

ModuleOutput[0]="mapcalc_output0_$$" #these map is needed later
ModuleOutput[1]="mapcalc_output1_$$" #these map is needed later
ModuleOutput[2]="mapcalc_output2_$$" #this map can be overwritten
ModuleOutput[3]="mapcalc_output3_$$" 
ModuleOutput[4]="mapcalc_output4_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 
ModuleOutputType[2]="rast" 
ModuleOutputType[3]="rast" 
ModuleOutputType[4]="rast" 

ModuleValidationMD5[0]="207ec2477fbeb0533dd09a8247c0b084" 
ModuleValidationMD5[1]="207ec2477fbeb0533dd09a8247c0b084" 
ModuleValidationMD5[2]="5e6290b0f2139e20650f23e309a91b6a" 
ModuleValidationMD5[3]="207ec2477fbeb0533dd09a8247c0b084" 
ModuleValidationMD5[4]="5e6290b0f2139e20650f23e309a91b6a" 

ModuleOptions[0]="\"${ModuleOutput[0]} = 10\""
ModuleOptions[1]="\"${ModuleOutput[1]} = 10.0\""
ModuleOptions[2]="\"${ModuleOutput[2]} = sin(x()) + cos(y()) + row() +col()\""
ModuleOptions[3]="\"${ModuleOutput[3]} = 1*${ModuleOutput[0]}\""
ModuleOptions[4]="\"${ModuleOutput[4]} = 1*${ModuleOutput[2]}\""

