###########################################

Title="r.to.vect Test" 

Description="Basic function test of r.to.vect" 

NumberOfTests=7
  
TMPDIR=$TMP_DATA_DIR
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="r.to.vect"
  ModuleOutput[${i}]="vector_${i}_$$"
  ModuleOutputType[${i}]="vect" 
  let  i=${i}+1
done

ModuleOptions[0]="feature=point    input=points      output=${ModuleOutput[0]}"
ModuleOptions[1]="feature=point -v input=points      output=${ModuleOutput[1]}" 
ModuleOptions[2]="feature=point -z input=points      output=${ModuleOutput[2]}"
ModuleOptions[3]="feature=line     input=lines       output=${ModuleOutput[3]}"
ModuleOptions[4]="feature=area     input=points_buff output=${ModuleOutput[4]}"
ModuleOptions[5]="feature=line  -s input=lines       output=${ModuleOutput[5]}"
ModuleOptions[6]="feature=area  -s input=points_buff output=${ModuleOutput[6]}"
