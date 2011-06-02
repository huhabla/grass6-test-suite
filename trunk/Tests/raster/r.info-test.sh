###########################################

Title="r.info test" # -- required

Description="Full function test of r.info" # -- optional

NumberOfTests=7 

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.info"
  let  i=${i}+1
done

ModuleOptions[0]="   map=Int0" 
ModuleOptions[1]="-r map=Int100" 
ModuleOptions[2]="-s map=Float0" 
ModuleOptions[3]="-t map=Float100" 
ModuleOptions[4]="-g map=elevation" 
ModuleOptions[5]="-h map=slope" 
ModuleOptions[6]="-p map=aspect" 
