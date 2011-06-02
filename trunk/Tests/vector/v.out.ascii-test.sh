###########################################

Title="v.out.ascii test" 

Description="Basic function test of v.out.ascii" 

NumberOfTests=8
  
TMPDIR=$TMP_DATA_DIR

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.out.ascii"
  ModuleOutput[${i}]="${TMPDIR}/test${i}.ascii" 
  ModuleOutputType[${i}]="file" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="87c7390c039582c3532ea71d97e7e0ec" 
ModuleValidationMD5[1]="861e644b632473d0921730f4f0b053a5" 
ModuleValidationMD5[2]="4cc38a020c230a9bea10b9905d6b0c27" 
ModuleValidationMD5[3]="a26697551143553a4bb43541a4b1df11" 
ModuleValidationMD5[4]="d41d8cd98f00b204e9800998ecf8427e" 
ModuleValidationMD5[5]="fccfcf36b5d3d3229c0f61b59d7876a4" 
ModuleValidationMD5[6]="4cc38a020c230a9bea10b9905d6b0c27" 
ModuleValidationMD5[7]="e9293877f202a20f8ab39481dce33e3c" 

ModuleOptions[0]="input=points format=point dp=2 output=${ModuleOutput[0]}"
ModuleOptions[1]="input=points format=standard dp=2 output=${ModuleOutput[1]}"
ModuleOptions[2]="input=lines format=point dp=2 output=${ModuleOutput[2]}"
ModuleOptions[3]="input=lines format=standard dp=2 output=${ModuleOutput[3]}"
ModuleOptions[4]="input=elevation format=point dp=2 output=${ModuleOutput[4]}"
ModuleOptions[5]="input=elevation format=standard dp=2 output=${ModuleOutput[5]}"
ModuleOptions[6]="input=areas format=point dp=2 output=${ModuleOutput[6]}"
ModuleOptions[7]="input=areas format=standard dp=2 output=${ModuleOutput[7]}"
