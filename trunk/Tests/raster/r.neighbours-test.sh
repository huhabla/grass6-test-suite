###########################################

Title="r.neighbors test" # -- required

Description="Full function test of r.neighbors" # -- optional

NumberOfTests=15 

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.neighbors"
  ModuleOutput[${i}]="neighbors_${i}_$$"
  ModuleOutputType[${i}]="rast" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="6e6e06b356679a251da2945fa72975a4" 
ModuleValidationMD5[1]="38152841c57633d6df2f30b2fc5d7a0e" 
ModuleValidationMD5[2]="5518824337575c17f4cc18f710395a20" 
ModuleValidationMD5[3]="6b58d13247228207f788fb218d76cf56" 
ModuleValidationMD5[4]="63a34c8240598e66ae008ea73c436f89" 
ModuleValidationMD5[5]="d7a7fafa87dae7513a07afaafc144cd2" 
ModuleValidationMD5[6]="2dd14dfd6a8f67fd468f69de804cb571" 
ModuleValidationMD5[7]="453c8e95d8f14c2425926fe6f0a7a7b6"
ModuleValidationMD5[8]="8c924c04067c6813757b069c87b923c5" 
ModuleValidationMD5[9]="9955686b63ef49c2516e947eb8810f8e" 
ModuleValidationMD5[10]="c20a06d21ab0699d0fb3d7e23d664a14" 
ModuleValidationMD5[11]="fe695e25cdb9def367ec0bd037e9d9b8" 
ModuleValidationMD5[12]="888ec601afe3caee7dec2be865230d64" 
ModuleValidationMD5[13]="9e11706c02f2ff7e778afd1cefe46259" 
ModuleValidationMD5[14]="186eab7a6ebfc211c6c7b4fc9fd463fe"

ModuleOptions[0]="input=elevation output=${ModuleOutput[0]} method=average size=1 title=average" 
ModuleOptions[1]="input=elevation output=${ModuleOutput[1]} method=average size=3 title=average" 
ModuleOptions[2]="input=elevation output=${ModuleOutput[2]} method=average size=5 title=average" 
ModuleOptions[3]="input=elevation output=${ModuleOutput[3]} method=average size=15 title=average" 
ModuleOptions[4]="input=elevation output=${ModuleOutput[4]} method=average size=19 title=average" 
ModuleOptions[5]="input=elevation output=${ModuleOutput[5]} method=average size=25 title=average" 
ModuleOptions[6]="input=elevation output=${ModuleOutput[6]} method=median size=5 title=median" 
ModuleOptions[7]="input=elevation output=${ModuleOutput[7]} method=mode size=5 title=mode" 
ModuleOptions[8]="input=elevation output=${ModuleOutput[8]} method=minimum size=5 title=minimum" 
ModuleOptions[9]="input=elevation output=${ModuleOutput[9]} method=maximum size=5 title=maximum" 
ModuleOptions[10]="input=elevation output=${ModuleOutput[10]} method=stddev size=5 title=stddev" 
ModuleOptions[11]="input=elevation output=${ModuleOutput[11]} method=sum size=5 title=sum" 
ModuleOptions[12]="input=elevation output=${ModuleOutput[12]} method=variance size=5 title=variance" 
ModuleOptions[13]="input=elevation output=${ModuleOutput[13]} method=diversity size=5 title=diversity" 
ModuleOptions[14]="input=elevation output=${ModuleOutput[14]} method=interspersion size=5 title=interspersion" 
