###########################################

Title="r.distance test" # -- required

Description="Full function test of r.distance" # -- optional

NumberOfTests=3 

TMPDIR=$TMP_DATA_DIR

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.distance"
  let  i=${i}+1
done

ModuleOutput[0]="${TMPDIR}/test0.dist" 
ModuleOutput[1]="${TMPDIR}/test1.dist" 
ModuleOutput[2]="${TMPDIR}/test2.dist" 

ModuleOutputType[0]="file" 
ModuleOutputType[1]="file" 
ModuleOutputType[2]="file" 

ModuleValidationMD5[0]="3d90d0b8e38797637e6c8dea6f10df05" 
ModuleValidationMD5[1]="a8e7744480eb4a220eae094e6a294569" 
ModuleValidationMD5[2]="f27f3da507a9f207cee4aaf502c55d3c"

ModuleOptions[0]="    maps=Int140,lines > ${ModuleOutput[0]}" 
ModuleOptions[1]="-l  maps=Int140,lines > ${ModuleOutput[1]}" 
ModuleOptions[2]="-ol maps=Int140,lines > ${ModuleOutput[2]}" 


