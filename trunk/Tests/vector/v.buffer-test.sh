###########################################
ValidateData=1 #turn validation off, because its not full functional

Title="v.buffer test" 

Description="Full function test of v.buffer." 

NumberOfTests=9

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.buffer"
  ModuleOutputType[${i}]="vect" 
  let  i=${i}+1
done

ModuleOutput[0]="points_buff_1_$$" 
ModuleOutput[1]="lines_buff_1_$$" 
ModuleOutput[2]="elevation_buff_1_$$" 
ModuleOutput[3]="points_buff_2_$$" 
ModuleOutput[4]="lines_buff_2_$$" 
ModuleOutput[5]="elevation_buff_2_$$" 
ModuleOutput[6]="points_buff_3_$$" 
ModuleOutput[7]="lines_buff_3_$$" 
ModuleOutput[8]="elevation_buff_3_$$" 

ModuleValidationMD5[0]="f3aa98126814ba2e7be6359bf06f4f3e" 
ModuleValidationMD5[1]="8d7b2bc4c36208314aad22e6c57baa04" 
ModuleValidationMD5[2]="2851b45eec2a0983f79a5797796f8a31" 
ModuleValidationMD5[3]="f60f1a41cb98dac9acd0e5f6d6e5da4c" 
ModuleValidationMD5[4]="8d7b2bc4c36208314aad22e6c57baa04" 
ModuleValidationMD5[5]="a1db25b210f42f873ff0df7534712d41" 
ModuleValidationMD5[6]="cecf3186198c0dd3874f86e1ccb0fda6" 
ModuleValidationMD5[7]="8d7b2bc4c36208314aad22e6c57baa04" 
ModuleValidationMD5[8]="2d99a3c92bbbd68ae07a4aa9f0b8ccc0" 

ModuleOptions[0]="input=points@PERMANENT output=${ModuleOutput[0]} distance=20"
ModuleOptions[1]="input=lines@PERMANENT output=${ModuleOutput[1]} distance=20"
ModuleOptions[2]="input=elevation@PERMANENT output=${ModuleOutput[2]} distance=20"
ModuleOptions[3]="input=points@PERMANENT output=${ModuleOutput[3]} distance=90"
ModuleOptions[4]="input=lines@PERMANENT output=${ModuleOutput[4]} distance=90"
ModuleOptions[5]="input=elevation@PERMANENT output=${ModuleOutput[5]} distance=90"
ModuleOptions[6]="input=points@PERMANENT output=${ModuleOutput[6]} distance=200"
ModuleOptions[7]="input=lines@PERMANENT output=${ModuleOutput[7]} distance=200"
ModuleOptions[8]="input=elevation@PERMANENT output=${ModuleOutput[8]} distance=200"

