###########################################

#Title
Title="db.tables test" 

#A description of the test
Description="Basic function test of db.tables " 

FROM_PATH="$GISDBASE/$LOCATION_NAME/PERMANENT/dbf"
TO_PATH="$GISDBASE/$LOCATION_NAME/$MAPSET/dbf"

#The number of tests that should perform
NumberOfTests=4

#The module which should be tested
Module[0]="db.tables"
Module[1]="db.tables"
Module[2]="db.tables"
Module[3]="db.tables"

#the module options
ModuleOptions[0]="-p driver=dbf database=$FROM_PATH"
ModuleOptions[1]="-p driver=dbf database=$TO_PATH"
ModuleOptions[2]="-sp driver=dbf database=$TO_PATH"
ModuleOptions[3]="-sp driver=dbf database=$FROM_PATH"
