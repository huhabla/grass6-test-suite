###########################################

Title="r3.info error detection test" 

#TestType="integration"

Description=" This test tests the grass test suite error detection. The maps and the usage are wrong." 

NumberOfTests=3

Module[0]="r3.info"
Module[1]="r3.info"
Module[2]="r3.info"

ModuleOptions[0]="   map=Not_existent" #wrong input
ModuleOptions[1]="-r map= " #no input
ModuleOptions[2]="-wrong map=Not_existent" #wrong usage and input
