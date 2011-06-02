###########################################

Title="r.stats Test" 

Description="Basic function test of r.stats" 

NumberOfTests=11
  
TMPDIR=$TMP_DATA_DIR

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
   Module[${i}]="r.stats" 
   ModuleOutput[${i}]="${TMPDIR}/test${i}.stats" #this name is written to the stats file
   ModuleOutputType[${i}]="file" 
   let  i=${i}+1
done

ModuleValidationMD5[0]="ef1d701247b1ae1f19fefe793b387fe8" 
ModuleValidationMD5[1]="f3cb2685d43d5252c5dc55a254b6a1ed" 
ModuleValidationMD5[2]="8a37c69eec6892506a97d88ad8b69207" 
ModuleValidationMD5[3]="6d9d1a35db208e989278e9a025d7c5e0" 
ModuleValidationMD5[4]="7636dbe271bbd97e43f290d5e374ec34" 
ModuleValidationMD5[5]="7b909d8505163872ea8d7fbf980fa5bf" 
ModuleValidationMD5[6]="bf61f19ba2d6d091c1bf2b4af45679ce" 
ModuleValidationMD5[7]="8e342f10f746be45b2367c7434596317" 
ModuleValidationMD5[8]="1c5dc9b99f60ab8047e69a70a3dfc954" 
ModuleValidationMD5[9]="45c811e6e48353e46370a64f48646d6f" 
ModuleValidationMD5[10]="2ae282a507826274ef1d1aae200becd2" 

ModuleOptions[0]="-1 input=elevation output=${ModuleOutput[0]}"
ModuleOptions[1]="-A input=elevation output=${ModuleOutput[1]}"
ModuleOptions[2]="-a input=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="-c input=elevation output=${ModuleOutput[3]}"
ModuleOptions[4]="-p input=elevation output=${ModuleOutput[4]}"
ModuleOptions[5]="-l input=elevation output=${ModuleOutput[5]}"
ModuleOptions[6]="-g input=elevation output=${ModuleOutput[6]}"
ModuleOptions[7]="-x input=elevation output=${ModuleOutput[7]}"
ModuleOptions[8]="-C input=elevation output=${ModuleOutput[8]}"
ModuleOptions[9]="-r input=elevation output=${ModuleOutput[9]}"
ModuleOptions[10]="-i input=elevation output=${ModuleOutput[10]}"

