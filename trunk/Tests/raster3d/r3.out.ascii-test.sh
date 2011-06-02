###########################################

Title="r3.out.ascii Test" 

Description="Basic function test of r3.out.ascii" 

NumberOfTests=1
  
TMPDIR=$TMP_DATA_DIR 

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r3.out.ascii"
  ModuleOutput[${i}]="${TMPDIR}/test${i}.ascii" 
  ModuleOutputType[${i}]="file" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="0d86ae64940ce2ae6255622f350147c6" 

ModuleOptions[0]="dp=3 input=volume output=${ModuleOutput[0]}"
