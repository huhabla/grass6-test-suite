###########################################

Title="v.parallel error detection test" 

Description="This test tests the error detection of the grass test suite. The module which should be tested does not exist." 

NumberOfTests=1

Module[0]="v.palallel" #wrong name

ModuleOutput[0]="parallel_$$" 

ModuleOutputType[0]="vect" 

ModuleValidation[0]="" 

ModuleValidationMD5[0]="61e0c3ce6373dc64eb118c072089c5af" 

ModuleOptions[0]="input=lines@PERMANENT output=${ModuleOutput[0]} distance=50"

