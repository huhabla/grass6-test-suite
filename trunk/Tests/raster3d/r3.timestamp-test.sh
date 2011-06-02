###########################################

Title="r3.timestamp Test" 

Description="Basic function test of r3.timestamp" 

NumberOfTests=4

Module[0]="r3.mapcalc" 
Module[1]="r3.timestamp" 
Module[2]="r3.timestamp" 
Module[3]="r3.timestamp" 

ModuleOutput[0]="mapcalc_test_map_$$" 

ModuleOutputType[0]="rast3d" 

ModuleValidation[0]="" 

ModuleValidationMD5[0]="4e9fdcd0fe00a9c7a9ff622e57a23d67" 

ModuleOptions[0]="\"${ModuleOutput[0]} = 10\"" 
ModuleOptions[1]="\"date=18 feb 2005 10:30:00/20 jul 2007 20:30:00\" map=${ModuleOutput[0]}"
ModuleOptions[2]="map=${ModuleOutput[0]}"
ModuleOptions[3]="date=none map=${ModuleOutput[0]}"
