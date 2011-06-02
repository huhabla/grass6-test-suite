###########################################

#Title
Title="g.proj output test" 

#We needt the proj.4 library
NEED_PROJ="yes"

#A description of the test
Description="Basic terminal output function test of g.proj " 

#The number of tests that should perform
NumberOfTests=7 

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="g.proj"
  let  i=${i}+1
done


#the module options
ModuleOptions[0]="-p"
ModuleOptions[1]="-d"
ModuleOptions[2]="-j"
ModuleOptions[3]="-w"
ModuleOptions[4]="-we"
ModuleOptions[5]="-jf"
ModuleOptions[6]="-ewf"
