###########################################

Title="v.drape test" 

Description="Full function test of v.drape." 

NumberOfTests=6

Module[0]="v.drape" 
Module[1]="v.drape" 
Module[2]="v.drape" 
Module[3]="v.drape" 
Module[4]="v.drape" 
Module[5]="v.drape" 

ModuleOutput[0]="points_nearest_$$" 
ModuleOutput[1]="lines_nearest_$$" 
ModuleOutput[2]="points_bilinear_$$" 
ModuleOutput[3]="lines_bilinear_$$" 
ModuleOutput[4]="points_cubic_$$" 
ModuleOutput[5]="lines_cubic_$$" 

ModuleOutputType[0]="vect" 
ModuleOutputType[1]="vect" 
ModuleOutputType[2]="vect" 
ModuleOutputType[3]="vect" 
ModuleOutputType[4]="vect" 
ModuleOutputType[5]="vect" 

ModuleValidationMD5[0]="86f10301bb073c378f234497413f8b87"
ModuleValidationMD5[1]="3ff2792e202d3b8cf427f7015228659b"
ModuleValidationMD5[2]="6f6bc25f1f9902e30c3c2413e71899e8"
ModuleValidationMD5[3]="f76f08d20ab02c78486511ca8a344732"
ModuleValidationMD5[4]="9c020d3ad8f23ab178885cb3789de5ff"
ModuleValidationMD5[5]="aaa2c390013218a7f365fe54f7230169"

ModuleOptions[0]="input=points@PERMANENT rast=elevation@PERMANENT method=nearest output=${ModuleOutput[0]}"
ModuleOptions[1]="input=elevation@PERMANENT rast=elevation@PERMANENT method=nearest output=${ModuleOutput[1]}"
ModuleOptions[2]="input=points@PERMANENT rast=elevation@PERMANENT method=bilinear output=${ModuleOutput[2]}"
ModuleOptions[3]="input=elevation@PERMANENT rast=elevation@PERMANENT method=bilinear output=${ModuleOutput[3]}"
ModuleOptions[4]="input=points@PERMANENT rast=elevation@PERMANENT method=cubic output=${ModuleOutput[4]}"
ModuleOptions[5]="input=elevation@PERMANENT rast=elevation@PERMANENT method=cubic output=${ModuleOutput[5]}"
