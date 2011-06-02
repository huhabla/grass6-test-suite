###########################################

#Tile
Title="r.to.rast3 error detection test" # -- required

#A description of the test
Description="This test tests the grass test suite error detection, all md5 checksums, some maps and the usage are wrong." # -- optional

#The number of tests that should perform
NumberOfTests=3

#The module which should be tested -- required
Module[0]="r.mapcalc" 
Module[1]="r.to.rast3" 
Module[2]="r.to.rast3" 

#name of the output map, important for removing -- required
ModuleOutput[0]="mapcalc_test_map_1_$$" 
ModuleOutput[1]="g3d_test_map_1_$$" 
ModuleOutput[2]="g3d_test_map_2_$$" 

#options are: raster, raster3, file and vect -- required if a map will be created
ModuleOutputType[0]="rast" 
ModuleOutputType[1]="rast3d" 
ModuleOutputType[2]="rast3d" 

#The map, file for validation check -- optional
#ModuleValidation[0]="${ModuleOutput[0]}" 
#ModuleValidation[1]="${ModuleOutput[1]}" 

#the optional md5 checksum -- optional
ModuleValidationMD5[0]="wrong" #wrong md5 checksum
ModuleValidationMD5[1]="wrong"  #wrong md5 checksum
ModuleValidationMD5[2]="wrong"  #wrong md5 checksum

#the module options -- required
ModuleOptions[0]="${ModuleOutput[0]} = 10" 
ModuleOptions[1]="input=Not_existent output=${ModuleOutput[1]}" #wrong input
ModuleOptions[2]="input=${ModuleOutput[1]} ouktput=${ModuleOutput[2]}" #wrong usage
