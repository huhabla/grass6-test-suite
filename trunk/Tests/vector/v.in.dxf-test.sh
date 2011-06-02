###########################################

Title="v.in.dxf test" 

Description="Basic function test of v.in.dxf" 

NumberOfTests=3
  
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.in.dxf"
  ModuleOutput[${i}]="vect_input_v_in_dxf_${i}" 
  ModuleOutputType[${i}]="vect" 
  let  i=${i}+1
done

# MD5 do not work :(
#ModuleValidationMD5[0]="16ac722ceb945b884eb53e9d467b345" 
#ModuleValidationMD5[1]="8a9e97b10c1d12d81a3b85f0a405bbe" 
#ModuleValidationMD5[2]="57175f680083e62b38e263364d06211" 

ModuleOptions[0]="-te input=${EXTERNAL_DATA_PATH}/Points.dxf output=${ModuleOutput[0]}"
ModuleOptions[1]="-te input=${EXTERNAL_DATA_PATH}/Lines.dxf output=${ModuleOutput[1]}"
ModuleOptions[2]="-te input=${EXTERNAL_DATA_PATH}/Areas.dxf output=${ModuleOutput[2]}"
