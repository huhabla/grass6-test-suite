###########################################

#Title
Title="db.describe test" 

#A description of the test
Description="Basic function test of db.describe " 

#The number of tests that should perform
NumberOfTests=6 

#The module which should be tested
Module[0]="db.describe"
Module[1]="db.describe"
Module[2]="db.describe"
Module[3]="db.describe"
Module[4]="db.describe"
Module[5]="db.describe"

#the module options
ModuleOptions[0]="table=points driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[1]="-c table=points driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[2]="table=lines driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[3]="-c table=lines driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[4]="table=areas driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[5]="-c table=areas driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
