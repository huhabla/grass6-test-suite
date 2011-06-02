###########################################
ValidateData=1 #turn validation off, because its not full functional

Title="v.in.ascii test" 

Description="Basic function test of v.in.ascii" 

NumberOfTests=6
  
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.in.ascii"
  ModuleOutput[${i}]="vect_input_$$_${i}" 
  ModuleOutputType[${i}]="vect" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="e07a372f472d5f8d122e5df66366bd92" 
ModuleValidationMD5[1]="e07a372f472d5f8d122e5df66366bd92" 
ModuleValidationMD5[2]="e07a372f472d5f8d122e5df66366bd92" 
ModuleValidationMD5[3]="e07a372f472d5f8d122e5df66366bd92" 
ModuleValidationMD5[4]="b54735bea6d6038fd2d76bd6d88260c3" 
ModuleValidationMD5[5]="5dde3e7185bfd4751883d3b1f9106c69" 

ModuleOptions[0]="-t input=${EXTERNAL_DATA_PATH}/points-vectpoint.ascii output=${ModuleOutput[0]} format=point"
ModuleOptions[1]="-t input=${EXTERNAL_DATA_PATH}/lines-vectpoint.ascii output=${ModuleOutput[1]} format=point"
ModuleOptions[2]="-t input=${EXTERNAL_DATA_PATH}/areas-vectpoint.ascii output=${ModuleOutput[2]} format=point"
ModuleOptions[3]="input=${EXTERNAL_DATA_PATH}/points-vectstandard.ascii output=${ModuleOutput[3]} format=standard"
ModuleOptions[4]="input=${EXTERNAL_DATA_PATH}/lines-vectstandard.ascii output=${ModuleOutput[4]} format=standard"
ModuleOptions[5]="input=${EXTERNAL_DATA_PATH}/areas-vectstandard.ascii output=${ModuleOutput[5]} format=standard"
