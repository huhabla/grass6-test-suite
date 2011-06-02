###########################################
ValidateData=1 #turn validation off, because its not full functional

Title="v.in.ogr test" 

Description="Basic function test of v.in.ogr, only ESRI shape and MapInfo files are imported" 

NEED_OGR="yes"

NumberOfTests=8
  
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.in.ogr"
  basename[${i}]="OGRImportData_${i}" 
  ModuleOutput[${i}]="OGRImport_$$_${i}" 
  ModuleOutputType[${i}]="vect" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="04725f2c8688e979df3bf6723ed36c32" 
#ModuleValidationMD5[1]="0c38b9bdfa13033bc57f52d6ae1b7475" 
ModuleValidationMD5[2]="0a0c4cfd097709e3ea3885150e8bc81f" 
#ModuleValidationMD5[3]="0c38b9bdfa13033bc57f52d6ae1b7475" 
ModuleValidationMD5[4]="16f793a659ff6e0f5e624e67d8bb632e" 
#ModuleValidationMD5[5]="0c38b9bdfa13033bc57f52d6ae1b7475" 
ModuleValidationMD5[6]="fe7a218e80d5972b21662686cae134ec" 
#ModuleValidationMD5[7]="0c38b9bdfa13033bc57f52d6ae1b7475" 

ModuleOptions[0]="output=${ModuleOutput[0]} type=point dsn=${EXTERNAL_DATA_PATH} layer=${basename[0]}"
ModuleOptions[1]="-l output=${ModuleOutput[1]} type=point dsn=${EXTERNAL_DATA_PATH} layer=${basename[1]}"
ModuleOptions[2]="output=${ModuleOutput[2]} type=line dsn=${EXTERNAL_DATA_PATH} layer=${basename[2]}"
ModuleOptions[3]="-l output=${ModuleOutput[3]} type=line dsn=${EXTERNAL_DATA_PATH} layer=${basename[3]}"
ModuleOptions[4]="output=${ModuleOutput[4]} type=line dsn=${EXTERNAL_DATA_PATH} layer=${basename[4]}"
ModuleOptions[5]="-f output=${ModuleOutput[5]} type=line dsn=${EXTERNAL_DATA_PATH} layer=${basename[5]}"
ModuleOptions[6]="output=${ModuleOutput[6]} type=centroid,boundary dsn=${EXTERNAL_DATA_PATH} layer=${basename[6]}"
ModuleOptions[7]="-f output=${ModuleOutput[7]} type=centroid,boundary dsn=${EXTERNAL_DATA_PATH} layer=${basename[7]}"
