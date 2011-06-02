###########################################

Title="r.fill.dir test" 

Description="Basic function test of r.fill.dir" 

NumberOfTests=1

Module[0]="r.fill.dir" 

ModuleOutput[0]="
map_$$_filled 
map_$$_direction
map_$$_areas
" 

ModuleOutputType[0]="rast" 

ModuleValidationMD5[0]="
c4768b47aa856ba33b9363be1472a336
6cacfc85915f7ae1cd7da6fde7789e49
70a5312ff2cb40a224f86be8395f2a77
" 
ModuleOptions[0]="input=elevation elevation=map_$$_filled direction=map_$$_direction areas=map_$$_areas type=grass"
