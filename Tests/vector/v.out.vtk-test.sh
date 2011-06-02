###########################################
CleanUpFlag=1
Title="v.out.vtk test" 

Description="Basic function test of v.out.vtk" 

NumberOfTests=10
  
TMPDIR=$TMP_DATA_DIR

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.out.vtk"
  #ModuleOutput[${i}]="${TMPDIR}/test${i}.vtk" 
  ModuleOutput[${i}]="/tmp/0000_test${i}.vtk" 
  ModuleOutputType[${i}]="file" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="63208f8e0181997a3ef33aaef31656b4" 
ModuleValidationMD5[1]="63208f8e0181997a3ef33aaef31656b4" 
ModuleValidationMD5[2]="d7388772300d9cd5bcefa4fb996b052e" 
ModuleValidationMD5[3]="be3494731a3361d3fad4eccf60bd10a7" 
ModuleValidationMD5[4]="04aae167b17eedae26b0469423e419a1" 
ModuleValidationMD5[5]="04aae167b17eedae26b0469423e419a1" 
ModuleValidationMD5[6]="04032b6837a29c6fc203c47e6574e104" 
ModuleValidationMD5[7]="310f4fd5a65082a6020c270ccc09833a" 
ModuleValidationMD5[8]="2f55e62c9847c40307b848c940a73ab0" 
ModuleValidationMD5[9]="2f55e62c9847c40307b848c940a73ab0" 

ModuleOptions[0]="input=points type=point layer=1 dp=2 output=${ModuleOutput[0]}"
ModuleOptions[1]="input=points type=point layer=1 dp=2 output=${ModuleOutput[1]}"
ModuleOptions[2]="input=lines type=line layer=1 dp=2 output=${ModuleOutput[2]}"
ModuleOptions[3]="input=elevation type=line layer=1 dp=2 output=${ModuleOutput[3]}"
ModuleOptions[4]="input=areas type=area layer=1 dp=2 output=${ModuleOutput[4]}"
ModuleOptions[5]="input=areas type=area layer=1 dp=2 output=${ModuleOutput[5]}"
ModuleOptions[6]="input=areas type=centroid layer=1 dp=2 output=${ModuleOutput[6]}"
ModuleOptions[7]="input=areas type=area,centroid layer=1 dp=2 output=${ModuleOutput[7]}"
ModuleOptions[8]="input=areas type=boundary,area,centroid layer=1 dp=2 output=${ModuleOutput[8]}"
ModuleOptions[9]="input=areas layer=1 dp=2 output=${ModuleOutput[9]}"
