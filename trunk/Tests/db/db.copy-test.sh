###########################################

#Title
Title="db.copy test" 

#A description of the test
Description="Basic function test of db.copy. " 

#The number of tests that should perform
NumberOfTests=3 

FROM_PATH="$GISDBASE/$LOCATION_NAME/PERMANENT/dbf"
TO_PATH="$GISDBASE/$LOCATION_NAME/$MAPSET/dbf"

#The module which should be tested
Module[0]="db.copy"
Module[1]="db.copy"
Module[2]="db.copy"

ModuleOutput[0]="$TO_PATH/points.dbf"
ModuleOutput[1]="$TO_PATH/lines.dbf"
ModuleOutput[2]="$TO_PATH/areas.dbf"

ModuleOutputType[0]="file"
ModuleOutputType[1]="file"
ModuleOutputType[2]="file"

ModuleValidationMD5[0]="be2afc731e3d233ae97d5487593e447a"
ModuleValidationMD5[1]="be2afc731e3d233ae97d5487593e447a"
ModuleValidationMD5[2]="be2afc731e3d233ae97d5487593e447a"

#the module options
ModuleOptions[0]="from_driver=dbf to_driver=dbf from_database=$FROM_PATH/ to_database=$TO_PATH/ from_table=points to_table=points"
ModuleOptions[1]="from_driver=dbf to_driver=dbf from_database=$FROM_PATH/ to_database=$TO_PATH/ from_table=lines to_table=lines"
ModuleOptions[2]="from_driver=dbf to_driver=dbf from_database=$FROM_PATH/ to_database=$TO_PATH/ from_table=areas to_table=areas"
