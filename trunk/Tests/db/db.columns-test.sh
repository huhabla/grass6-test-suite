###########################################

#Title
Title="db.columns test" 

#A description of the test
Description="Basic function test of db.columns. This test only works with the dbf driver." 

#The number of tests that should perform
NumberOfTests=4 

#The module which should be tested
Module[0]="db.columns"
Module[1]="db.columns"
Module[2]="db.columns"
Module[3]="db.columns"

#the module options
ModuleOptions[0]="table=points driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[1]="table=lines driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[2]="table=areas driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[3]="table=elevation driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
