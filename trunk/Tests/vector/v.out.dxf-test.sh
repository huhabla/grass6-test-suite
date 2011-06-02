###########################################
ValidateData=1 #turn validation off, because its not full functional

Title="v.out.dxf test" 

Description="Basic function test of v.out.dxf" 

NumberOfTests=4
  
TMPDIR=$TMP_DATA_DIR

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.out.dxf"
  ModuleOutput[${i}]="${TMPDIR}/test${i}.dxf" 
  ModuleOutputType[${i}]="file" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="dd3e71a8b478808f0c799a13b53ccaf1" 
ModuleValidationMD5[1]="33790136ddae3d7bf9b5df6e5d2edf13" 
ModuleValidationMD5[2]="2fb0764ad0cd0ea805c22e67c13f94cf" 
ModuleValidationMD5[3]="952d062ade163fac98ab72ce06d8fe7e" 

ModuleOptions[0]="input=points output=${ModuleOutput[0]}"
ModuleOptions[1]="input=lines output=${ModuleOutput[1]}"
ModuleOptions[2]="input=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="input=areas output=${ModuleOutput[3]}"
