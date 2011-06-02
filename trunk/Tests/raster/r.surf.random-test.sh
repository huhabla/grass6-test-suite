###########################################

Title="r.surf.random test" 

Description="Full function test of r.surf.random" 

NEED_FFTW="yes"

NumberOfTests=2

Module[0]="r.surf.random" 
Module[1]="r.surf.random" 

ModuleOutput[0]="surf_r_map_1_$$" 
ModuleOutput[1]="surf_r_map_2_$$" 

ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast" 

ModuleOptions[0]="min=0 max=100 out=${ModuleOutput[0]}"
ModuleOptions[1]="min=345 max=567 out=${ModuleOutput[1]}"
