###########################################

#Title
Title="g.rename test" 

#A description of the test
Description="Basic function test of g.rename " 

#The number of tests that should perform
NumberOfTests=8 

#stop if one test fails
TestType="integration"

#The module which should be tested
Module[0]="g.copy" #first we have to copy the data
Module[1]="g.copy"
Module[2]="g.copy"
Module[3]="g.copy"
Module[4]="g.rename"
Module[5]="g.rename"
Module[6]="g.rename"
Module[7]="g.rename"

#the copies
ModuleOutput[0]="rast_copy_$$"
ModuleOutput[1]="rast3d_copy_$$"
ModuleOutput[2]="vect_copy_$$"
ModuleOutput[3]="region_copy_$$"
ModuleOutput[4]="rast_rename_$$"
ModuleOutput[5]="rast3d_rename_$$"
ModuleOutput[6]="vect_rename_$$"
ModuleOutput[7]="region_rename_$$"

#the data types 
ModuleOutputType[0]="rast"
ModuleOutputType[1]="rast3d"
ModuleOutputType[2]="vect"
ModuleOutputType[3]="region"
ModuleOutputType[4]="rast"
ModuleOutputType[5]="rast3d"
ModuleOutputType[6]="vect"
ModuleOutputType[7]="region"

#the source maps
ModuleValidation[0]="Int0"
ModuleValidation[1]="volume"
ModuleValidation[2]="lines"
ModuleValidation[4]="Int0"
ModuleValidation[5]="volume"
ModuleValidation[6]="lines"

#the module options
ModuleOptions[0]="rast=Int0,${ModuleOutput[0]}"
ModuleOptions[1]="rast3d=volume,${ModuleOutput[1]}"
ModuleOptions[2]="vect=lines,${ModuleOutput[2]}"
ModuleOptions[3]="region=3dregion,${ModuleOutput[3]}"
ModuleOptions[4]="rast=${ModuleOutput[0]},${ModuleOutput[4]}"
ModuleOptions[5]="rast3d=${ModuleOutput[1]},${ModuleOutput[5]}"
ModuleOptions[6]="vect=${ModuleOutput[2]},${ModuleOutput[6]}"
ModuleOptions[7]="region=${ModuleOutput[3]},${ModuleOutput[7]}"
