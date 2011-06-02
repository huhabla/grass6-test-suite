###########################################

#Tile
Title="r.to.rast3elev test" # -- required

#A description of the test
Description="Full function test of r.to.rast3elev" # -- optional

NumberOfTests=9

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.to.rast3elev"
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
ModuleValidationMD5[6]="1917c7889936afffd7fb59b720743085" 
ModuleValidationMD5[7]="0035966f33588d01e82cd5e0c76dba25" 
ModuleValidationMD5[8]="51335b4f051afb7f407a22787bdb6628" 

ModuleOptions[0]="input=elevation elev=elevation output=${ModuleOutput[0]}"
ModuleOptions[1]="-l input=elevation elev=elevation output=${ModuleOutput[1]}"
ModuleOptions[2]="-u input=elevation elev=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="upper=50 input=elevation elev=elevation output=${ModuleOutput[3]}"
ModuleOptions[4]="lower=50 input=elevation elev=elevation output=${ModuleOutput[4]}"
ModuleOptions[5]="lower=50 upper=75 input=elevation elev=elevation output=${ModuleOutput[5]}"
ModuleOptions[6]="-l input=Int300,Int260,Int220 elev=Int300,Int260,Int220 output=${ModuleOutput[6]}"
ModuleOptions[7]="-u input=Int180,Int220,Int260 elev=Int180,Int220,Int260 output=${ModuleOutput[7]}"
ModuleOptions[8]="   input=Int300,Int260,Int220 elev=Int300,Int260,Int220 output=${ModuleOutput[8]}"
