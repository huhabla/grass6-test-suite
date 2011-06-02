###########################################

Title="r.out.gdal Test" 

Description="Basic function test of r.out.gdal" 

NEED_GDAL="yes"

NumberOfTests=4
  
TMPDIR=$TMP_DATA_DIR

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
   Module[${i}]="r.out.gdal" 
   ModuleOutput[${i}]="${TMPDIR}/test${i}.gdal" #this name is written to the stats file
   ModuleOutputType[${i}]="file" 
   let  i=${i}+1
done

ModuleValidationMD5[0]="9535501634cba34b9d292c06e236f555" 
ModuleValidationMD5[1]="8f506103460543f534381f765bf631cc" 
ModuleValidationMD5[2]="b9d1a1158ac367fc5566d8222f2c9554"
ModuleValidationMD5[3]="6d28e77dfe20a5f012818f4620f1ba66"

ModuleOptions[0]="format=ELAS  type=Float32 input=elevation output=${ModuleOutput[0]}" 
ModuleOptions[1]="format=ENVI  type=Float32 input=elevation output=${ModuleOutput[1]}"
ModuleOptions[2]="format=GTiff type=Float32 input=elevation output=${ModuleOutput[2]}"
ModuleOptions[3]="format=HFA   type=Float32 input=elevation output=${ModuleOutput[3]}"
