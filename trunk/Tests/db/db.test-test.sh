###########################################

TestType="integration"

#Title
Title="db.test test" 

#A description of the test
Description="Basic function test of db.test " 

#The number of tests that should perform
NumberOfTests=2 

#The module which should be tested
Module[0]="db.connect"
Module[1]="db.test"

#the module options
ModuleOptions[0]="driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[1]="test=test1"
