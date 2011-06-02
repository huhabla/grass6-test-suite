###########################################

Title="r.surf.idw test" 

Description="Full function test of r.surf.idw" 

NumberOfTests=2

Module[0]="r.surf.idw" 
Module[1]="r.surf.idw" 

ModuleOutput[0]="surf_map_1_$$" 
ModuleOutput[1]="surf_map_2_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 

ModuleValidationMD5[0]="8c43c2785823e751650a4b65f1c3b0e3" 
ModuleValidationMD5[1]="f418176dac43580a67fe464c0259d5e8" 

ModuleOptions[0]="input=points output=${ModuleOutput[0]}"
ModuleOptions[1]="input=lines output=${ModuleOutput[1]}"
