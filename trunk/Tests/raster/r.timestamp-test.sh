###########################################

Title="r.timestamp Test" 

Description="Basic function test of r.timestamp" 

NumberOfTests=4

Module[0]="r.mapcalc" 
Module[1]="r.timestamp" 
Module[2]="r.timestamp" 
Module[3]="r.timestamp" 

ModuleOutput[0]="mapcalc_test_map_$$" 

ModuleOutputType[0]="rast" 

ModuleValidation[0]="" 

ModuleOptions[0]="\"${ModuleOutput[0]} = 10\"" 
ModuleOptions[1]="\"date=18 feb 2005 10:30:00/20 jul 2007 20:30:00\" map=${ModuleOutput[0]}"
ModuleOptions[2]="map=${ModuleOutput[0]}"
ModuleOptions[3]="date=none map=${ModuleOutput[0]}"
