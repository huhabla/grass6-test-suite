###########################################

Title="v.surf.idw test" 

Description="Basic function test of v.surf.idw." 

NumberOfTests=2 

Module[0]="v.surf.idw" 
Module[1]="v.surf.idw" 

ModuleOutput[0]="points_$$" 
ModuleOutput[1]="lines_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 

ModuleValidationMD5[0]="235c5766bbf1a4517cd87860b69c4824"
ModuleValidationMD5[1]="235c5766bbf1a4517cd87860b69c4824"

ModuleOptions[0]="input=points output=${ModuleOutput[0]} column=level"
ModuleOptions[1]="input=lines output=${ModuleOutput[1]} column=level"
