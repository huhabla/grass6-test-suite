###########################################

Title="r.surf.idw2 test" 

Description="Full function test of r.surf.idw2" 

NumberOfTests=2

Module[0]="r.surf.idw2" 
Module[1]="r.surf.idw2" 

ModuleOutput[0]="surfmap_1_$$" 
ModuleOutput[1]="surfmap_2_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 

ModuleValidationMD5[0]="69c2afb74bfe8672da4346af9d0c8609" 
ModuleValidationMD5[1]="3d52be8049ec6a0fbcf6962fbc376ddd" 

ModuleOptions[0]="input=points output=${ModuleOutput[0]}"
ModuleOptions[1]="input=lines output=${ModuleOutput[1]}"
