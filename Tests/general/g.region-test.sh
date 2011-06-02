###########################################

#Title
Title="g.region output test" 

#A description of the test
Description="Full terminal output function test of g.region " 

#The number of tests that should perform
NumberOfTests=7 

#The module which should be tested 
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="g.region"
  let  i=${i}+1
done

#the module options 
ModuleOptions[0]="-g"
ModuleOptions[1]="-g -3"
ModuleOptions[2]="-p -3 -m"
ModuleOptions[3]="-pm"
ModuleOptions[4]="-c"
ModuleOptions[5]="-lm"     
ModuleOptions[6]="-mb"     
