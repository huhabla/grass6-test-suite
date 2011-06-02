###########################################

Title="v.extract test" 

Description="Basic function test of v.extract." 

NumberOfTests=3 

Module[0]="v.extract" 
Module[1]="v.extract" 
Module[2]="v.extract" 

ModuleOutput[0]="points_$$" 
ModuleOutput[1]="lines_$$" 
ModuleOutput[2]="areas_$$" 

ModuleOutputType[0]="vect" 
ModuleOutputType[1]="vect" 
ModuleOutputType[2]="vect" 

ModuleValidationMD5[0]="3f717c8909c2d44291626f0aebe97dc9"
ModuleValidationMD5[1]="8d7b2bc4c36208314aad22e6c57baa04"
ModuleValidationMD5[2]="a6a959898428ec83b27f5e95f0ce453c"

ModuleOptions[0]="-d list=1,2,3,4,5,6,7,8,9 input=points output=${ModuleOutput[0]} type=point new=1"
ModuleOptions[1]="input=lines output=${ModuleOutput[1]} type=line list=1"
ModuleOptions[2]="input=areas output=${ModuleOutput[2]} type=area where=\"cat > 10\""
