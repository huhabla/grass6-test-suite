###########################################

Title="r.null test"

TestType="unit"

Description="Basic function test of r.null"

NumberOfTests=6

Module[0]="r.mapcalc"
Module[1]="r.info"
Module[2]="r.null"
Module[3]="r.info"
Module[4]="r.null"
Module[5]="r.info"

#we check the same map 3 times!!
ModuleOutput[0]="null_map_$$"
ModuleOutput[2]="null_map_$$"
ModuleOutput[4]="null_map_$$"

#we check the same map 3 times!!
ModuleOutputType[0]="rast"
ModuleOutputType[2]="rast"
ModuleOutputType[4]="rast"

#we check the same map 3 times!!
ModuleValidationMD5[0]="21ec9ff6c7f82ee81c700e787b96ce01"
ModuleValidationMD5[2]="6e8ecca18d4a7c4ddbdee7e7fef64202"
ModuleValidationMD5[4]="41866e2c43f10ddbf251f3a09d6a8753"

ModuleOptions[0]="\"${ModuleOutput[0]} = row()\""
ModuleOptions[1]="-r map=${ModuleOutput[0]}"
ModuleOptions[2]="map=${ModuleOutput[0]} setnull=1,2,3,4,5"
ModuleOptions[3]="-r map=${ModuleOutput[0]}"
ModuleOptions[4]="map=${ModuleOutput[0]} null=1,2,3,4,5"
ModuleOptions[5]="-r map=${ModuleOutput[0]}"

