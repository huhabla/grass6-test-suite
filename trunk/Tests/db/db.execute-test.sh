###########################################

#Title
Title="db.execute test" 

#A description of the test
Description="Basic function test of db.execute " 

#The number of tests that should perform
NumberOfTests=2 

FROM_PATH="$GISDBASE/$LOCATION_NAME/PERMANENT/dbf"
TO_PATH="$GISDBASE/$LOCATION_NAME/$MAPSET/dbf"

#The module which should be tested
Module[0]="db.execute"
Module[1]="db.execute"

ModuleOutput[0]="$TO_PATH/soils.dbf"
ModuleOutputType[0]="file"

#the module options
ModuleOptions[0]="driver=dbf database=$TO_PATH input=$EXTERNAL_DATA_PATH/SQL_statement_create_table"
ModuleOptions[1]="driver=dbf database=$TO_PATH input=$EXTERNAL_DATA_PATH/SQL_statement_drop_table"
