###########################################

#Title
Title="db.connect test" 

#A description of the test
Description="Basic function test of db.connect. Only dbf driver is supported currently." 

#The number of tests that should perform
NumberOfTests=3 

#The module which should be tested
Module[0]="db.connect"
Module[1]="db.connect"
Module[2]="db.connect"

#the module options
ModuleOptions[0]="-p"
ModuleOptions[1]="driver=dbf database=$GISDBASE/$LOCATION_NAME/$MAPSET/dbf/"
ModuleOptions[2]="driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
