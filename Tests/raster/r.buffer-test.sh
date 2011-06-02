###########################################

Title="r.buffer test" # -- required

Description="Full function test of r.buffer" # -- optional

NumberOfTests=5 

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.buffer"
  ModuleOutput[${i}]="buffer_${i}_$$"
  ModuleOutputType[${i}]="rast" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="bfbf93ebb0c61f3450006e013a4a393f" 
ModuleValidationMD5[1]="b51debeea3357ca21d9b98030b6f416f" 
ModuleValidationMD5[2]="0058481576317aea201ddc88ac0c7cc2" 
ModuleValidationMD5[3]="5a17047cf8123f9a2ddf3009e1cb3424" 
ModuleValidationMD5[4]="48da83afa50d98c35e40bb6b7bf7ce0b" 

ModuleOptions[0]="input=points distance=50 output=${ModuleOutput[0]}" 
ModuleOptions[1]="input=points distance=50,150,250,500 output=${ModuleOutput[1]}" 
ModuleOptions[2]="input=points distance=30,60,90,120 output=${ModuleOutput[2]}" 
ModuleOptions[3]="input=lines  distance=50,150,250,500 output=${ModuleOutput[3]}" 
ModuleOptions[4]="input=lines  distance=30,60,90,120 output=${ModuleOutput[4]}" 

