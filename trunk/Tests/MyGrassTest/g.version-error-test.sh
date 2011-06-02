###########################################

#Title
Title="g.version error detection test" 

#A description of the test
Description="This test tests the error detection of the grass test suite. The parameter of g.version is wrong." 

#The number of tests that should perform
NumberOfTests=1 

#The module which should be tested
Module[0]="g.version"

#the module options
ModuleOptions[0]="-wrong" #wrong command line option
