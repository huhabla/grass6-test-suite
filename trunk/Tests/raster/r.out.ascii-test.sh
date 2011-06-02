###########################################

Title="r.out.ascii Test" 

Description="Basic function test of r.out.ascii" 

NumberOfTests=7
  
TMPDIR=$TMP_DATA_DIR

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
   Module[${i}]="r.out.ascii" 
   ModuleOutput[${i}]="${TMPDIR}/test${i}.ascii" #this name is written to the stats file
   ModuleOutputType[${i}]="file" 
   let  i=${i}+1
done

ModuleValidationMD5[0]="2b7ac691de10f8582b3a665623f49558" 
ModuleValidationMD5[1]="2bcc5892d7db02ae179a3136d3d0f1e5" 
ModuleValidationMD5[2]="2bcc5892d7db02ae179a3136d3d0f1e5" 
ModuleValidationMD5[3]="2f83b00ed920757dba69c7cf63b27aef" 
ModuleValidationMD5[4]="c16d216c7cfd7edc02a91d7d339e491f" 
ModuleValidationMD5[5]="eb416af7ca56ae9c46b01022ea5446d6" 
ModuleValidationMD5[6]="798b9161b7b0962b4d2c588a0bca9686" 

ModuleOptions[0]="dp=3    input=elevation output=${ModuleOutput[0]}"
ModuleOptions[1]="dp=3    input=RandInt   output=${ModuleOutput[1]}" 
ModuleOptions[2]="dp=3 -i input=RandInt   output=${ModuleOutput[2]}"
ModuleOptions[3]="dp=3 -h input=RandInt   output=${ModuleOutput[3]}"
ModuleOptions[4]="dp=3 -s input=RandInt   output=${ModuleOutput[4]}"
ModuleOptions[5]="dp=3 -m input=RandInt   output=${ModuleOutput[5]}"
ModuleOptions[6]="dp=3 -s input=RandInt   output=${ModuleOutput[6]} width=80"
