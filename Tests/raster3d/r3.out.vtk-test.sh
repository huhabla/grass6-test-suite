###########################################

Title="r3.out.vtk Test" 

Description="Basic function test of r3.out.vtk" 

NumberOfTests=10
  
TMPDIR=$TMP_DATA_DIR 

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r3.out.vtk"
  ModuleOutput[${i}]="${TMPDIR}/test${i}.vtk" 
  ModuleOutputType[${i}]="file" 
  let  i=${i}+1
done


ModuleValidationMD5[0]="a860d4ae843a2b8675c697b12ead82a0" 
ModuleValidationMD5[1]="0d58f7234fcbf198523c248a27b654bf" 
ModuleValidationMD5[2]="704464bf7c44edb9cc3481f87192d74b" 
ModuleValidationMD5[3]="257212ac9af78852f10d23882dd95e8f" 
ModuleValidationMD5[4]="bc7579b8bdea7f8a761973953ed19128" 
ModuleValidationMD5[5]="64507238d4169e7bf63a67e08d9c2610" 
ModuleValidationMD5[6]="65ac568b350814a040547b3127ccd671" 
ModuleValidationMD5[7]="b4fdc7e1220af4a91b6f1be4a9c84e1f" 
ModuleValidationMD5[8]="3ea1eedf84a0f669ac3c631a77050202" 
ModuleValidationMD5[9]="e2d949cc14fc0b535fa26261e8d247b4" 

ModuleOptions[0]="dp=3 input=volume output=${ModuleOutput[0]}"
ModuleOptions[1]="dp=3 input=volume,random output=${ModuleOutput[1]}"
ModuleOptions[2]="dp=3 null=0.0 input=random output=${ModuleOutput[2]}"
ModuleOptions[3]="dp=3 -pm null=0.0 input=random,volume output=${ModuleOutput[3]}"
ModuleOptions[4]="dp=3 elevscale=20 null=0.0 input=random,volume output=${ModuleOutput[4]}"
ModuleOptions[5]="dp=3 -pm elevscale=20 null=0.0 input=random,volume output=${ModuleOutput[5]}"
ModuleOptions[6]="dp=3 -s elevscale=20 null=0.0 bottom=Int0 top=elevation input=volume,random output=${ModuleOutput[6]}"
ModuleOptions[7]="dp=2 -s elevscale=20 null=0.0 bottom=Int0 top=elevation input=random,volume output=${ModuleOutput[7]} rgbmaps=random,random,random vectormaps=random,random,random"
ModuleOptions[8]="dp=2 -sp elevscale=20 null=0.0 bottom=Int0 top=elevation input=random,volume output=${ModuleOutput[8]} rgbmaps=random,random,random vectormaps=random,random,random"
ModuleOptions[9]="dp=3 -sp elevscale=20 null=0.0 bottom=Int0 top=elevation input=volume,random output=${ModuleOutput[9]}"

