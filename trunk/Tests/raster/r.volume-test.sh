###########################################

Title="r.volume Test" 

Description="Basic function test of r.volume" 

NumberOfTests=2

Module[0]="r.volume" 
Module[1]="r.volume" 

ModuleOutput[0]="map_walk_$$.1" 
ModuleOutput[1]="map_walk_$$.2" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 

ModuleOptions[0]="   data=elevation clump=points_buff"
ModuleOptions[1]="-f data=elevation clump=points_buff"
