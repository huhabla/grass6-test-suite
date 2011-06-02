###########################################

#Title
Title="db.select test" 

#A description of the test
Description="Basic function test of db.select " 

#The number of tests that should perform
NumberOfTests=5 

#The module which should be tested
Module[0]="db.select"
Module[1]="db.select"
Module[2]="db.select"
Module[3]="db.select"
Module[4]="db.select"

#the module options
ModuleOptions[0]="input=$EXTERNAL_DATA_PATH/SQL_statement_select_from_table table=points driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[1]="input=$EXTERNAL_DATA_PATH/SQL_statement_select_from_table table=lines driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[2]="input=$EXTERNAL_DATA_PATH/SQL_statement_select_from_table table=areas driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[3]="input=$EXTERNAL_DATA_PATH/SQL_statement_select_from_table table=elevation driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
ModuleOptions[4]="-d input=$EXTERNAL_DATA_PATH/SQL_statement_select_from_table table=elevation driver=dbf database=$GISDBASE/$LOCATION_NAME/PERMANENT/dbf/"
