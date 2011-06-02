###########################################
Title="r.out.vtk Test" 

Description="Basic function test of r.out.vtk" 

NumberOfTests=9
  
TMPDIR=$TMP_DATA_DIR

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
   Module[${i}]="r.out.vtk" 
   ModuleOutput[${i}]="${TMPDIR}/test${i}.vtk"
   ModuleOutputType[${i}]="file" 
   let  i=${i}+1
done

ModuleValidationMD5[0]="272eeaaa2f242aa23fb581b276bb04a0"
ModuleValidationMD5[1]="3af511b90b5ca484e18fcc36f84b33cf"
ModuleValidationMD5[2]="7ca77fecacd04f36d0096ae71b1003f5"
ModuleValidationMD5[3]="46ca9c1a8cef66ee6195b0f2f7ef16b5" 
ModuleValidationMD5[4]="3138d721f90961a9f08644b27dd5f00d" 
ModuleValidationMD5[5]="c868d131ffa5fdb5ca8da4d6adae3e5d" 
ModuleValidationMD5[6]="55782e58fb384cdc89399653589b51ae" 
ModuleValidationMD5[7]="3997af9dbb3a9385b16809ada6cdcac8" 
ModuleValidationMD5[8]="00481f5fe619fb98003e9a8e2e8a1cd0" 

ModuleOptions[0]="input=elevation output=${ModuleOutput[0]}"
ModuleOptions[1]="input=RandInt,RandFloat rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[1]}" 
ModuleOptions[2]="-o input=RandInt,RandFloat elevation2d=100 rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[2]}"
ModuleOptions[3]="-o  elevscale=10 input=RandInt,RandFloat elevation=elevation rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[3]}"
ModuleOptions[4]="-to elevscale=10 input=RandInt,RandFloat elevation=elevation rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[4]}"
ModuleOptions[5]="-vo elevscale=10 input=RandInt,RandFloat elevation=elevation rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[5]}"
ModuleOptions[6]="-so elevscale=10 input=RandInt,RandFloat elevation=elevation rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[6]}"
ModuleOptions[7]="-so elevscale=10 input=RandInt,RandFloat elevation=elevation vectormaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red output=${ModuleOutput[7]}"
ModuleOptions[8]="-so elevscale=10 input=RandInt,RandFloat elevation=elevation rgbmaps=LandsatTM_IR1,LandsatTM_IR2,LandsatTM_Red vectormaps=RandFloat,RandFloat,RandFloat output=${ModuleOutput[8]}"
