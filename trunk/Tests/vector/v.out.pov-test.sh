###########################################

Title="v.out.pov test" 

Description="Basic function test of v.out.pov" 

NumberOfTests=4
  
TMPDIR=$TMP_DATA_DIR

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.out.pov"
  ModuleOutput[${i}]="${TMPDIR}/test${i}.pov" 
  ModuleOutputType[${i}]="file" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="69d0a6ef82072bc6bd2cabdcbaaff725" 
ModuleValidationMD5[1]="bdf001f6360c86a868df227c761bcf61" 
ModuleValidationMD5[2]="13ac7c297b6235a1bed9e7565daf544e" 
ModuleValidationMD5[3]="74132071a861ed6f8e23795fbc0f8ab6" 

ModuleOptions[0]="input=points output=${ModuleOutput[0]}"
ModuleOptions[1]="input=lines output=${ModuleOutput[1]}"
ModuleOptions[2]="input=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="input=areas output=${ModuleOutput[3]}"
