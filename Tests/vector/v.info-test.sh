###########################################

Title="v.info test" 

Description="Full function test of v.info." 

NumberOfTests=15

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="v.info"
  let  i=${i}+1
done

ModuleOptions[0]="layer=1 map=points@PERMANENT"
ModuleOptions[1]="-h layer=1 map=points@PERMANENT"
ModuleOptions[2]="-c layer=1 map=points@PERMANENT"
ModuleOptions[3]="-g layer=1 map=points@PERMANENT"
ModuleOptions[4]="-t layer=1 map=points@PERMANENT"
ModuleOptions[5]="layer=1 map=lines@PERMANENT"
ModuleOptions[6]="-h layer=1 map=lines@PERMANENT"
ModuleOptions[7]="-c layer=1 map=lines@PERMANENT"
ModuleOptions[8]="-g layer=1 map=lines@PERMANENT"
ModuleOptions[9]="-t layer=1 map=lines@PERMANENT"
ModuleOptions[10]="layer=1 map=areas@PERMANENT"
ModuleOptions[11]="-h layer=1 map=areas@PERMANENT"
ModuleOptions[12]="-c layer=1 map=areas@PERMANENT"
ModuleOptions[13]="-g layer=1 map=areas@PERMANENT"
ModuleOptions[14]="-t layer=1 map=areas@PERMANENT"
