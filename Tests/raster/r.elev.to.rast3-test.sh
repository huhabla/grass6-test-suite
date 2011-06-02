###########################################

#Tile
Title="r.elev.to.rast3 test" # -- required

#A description of the test
Description="Full function test of r.elev.to.rast3" # -- optional

NumberOfTests=6

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.elev.to.rast3"
  ModuleOutput[${i}]="volume_${i}_$$"
  ModuleOutputType[${i}]="rast3d" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="2932f4dafa23b862bd43212acfd73da5" 
ModuleValidationMD5[1]="960f46e8d306ec78a9e9347997cecc8e" 
ModuleValidationMD5[2]="8e583b7b53b85f3e0217804a46ed0c7d" 
ModuleValidationMD5[3]="edf39d3bfeac30ee67463647fda0cacf" 
ModuleValidationMD5[4]="d97c07104ebfcd6bc27d839a1c87be94" 
ModuleValidationMD5[5]="af26ea3344aafda0ecbda6022b0a71e4" 

ModuleOptions[0]="input=elevation elev=elevation output=${ModuleOutput[0]}"
ModuleOptions[1]="-l input=elevation elev=elevation output=${ModuleOutput[1]}"
ModuleOptions[2]="-u input=elevation elev=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="upper=50 input=elevation elev=elevation output=${ModuleOutput[3]}"
ModuleOptions[4]="lower=50 input=elevation elev=elevation output=${ModuleOutput[4]}"
ModuleOptions[5]="lower=50 upper=75 input=elevation elev=elevation output=${ModuleOutput[5]}"
