###########################################

#Title
Title="g.list test" 

#A description of the test
Description="Full function test of g.list " 

#The number of tests that should performed
NumberOfTests=11

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="g.list"
  let  i=${i}+1
done

#the module options -- required
ModuleOptions[0]="-f rast mapset=PERMANENT"
ModuleOptions[1]="-f rast3d mapset=PERMANENT"
ModuleOptions[2]="-f vect mapset=PERMANENT"
ModuleOptions[3]="-f oldvect mapset=PERMANENT" 
ModuleOptions[4]="-f asciivect mapset=PERMANENT"
ModuleOptions[5]="-f icon mapset=PERMANENT"
ModuleOptions[6]="-f labels mapset=PERMANENT"
ModuleOptions[7]="-f sites mapset=PERMANENT"
ModuleOptions[8]="-f region mapset=PERMANENT"
ModuleOptions[9]="-f region3d mapset=PERMANENT"
ModuleOptions[10]="-f group mapset=PERMANENT"
