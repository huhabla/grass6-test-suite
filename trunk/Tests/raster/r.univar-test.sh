###########################################

Title="r.univar Test" 

Description="Full function test of r.univar" 

NumberOfTests=5

Module[0]="r.univar" 
Module[1]="r.univar" 
Module[2]="r.univar" 
Module[3]="r.univar" 
Module[4]="r.univar" 

ModuleOptions[0]="map=elevation" 
ModuleOptions[1]="-g map=elevation" 
ModuleOptions[2]="-e map=elevation" 
ModuleOptions[3]="-eg map=elevation" 
ModuleOptions[4]="-eg map=elevation percentile=55" 
