###########################################

Title="r3.in.ascii Test" 

Description="Basic function test of r3.in.ascii" 

NumberOfTests=1
  
TMPDIR=$TMP_DATA_DIR 

i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r3.in.ascii"
  ModuleOutput[${i}]="g3d_test_map_$$" 
  ModuleOutputType[${i}]="rast3d" 
  let  i=${i}+1
done

ModuleValidationMD5[0]="671de5559c200d44bdc7da2954f0d197" 

ModuleOptions[0]="input=$EXTERNAL_DATA_PATH/volume.ascii output=${ModuleOutput[0]}"
