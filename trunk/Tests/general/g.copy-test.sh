###########################################

#Title
Title="g.copy test" 

#A description of the test
Description="Full function test of g.copy. Currently only raster, raster3d, vector and region data are in the test location!" 

#The number of tests that should performed
NumberOfTests=4

#The module which should be tested
i=0
while [ ${i} -lt ${NumberOfTests} ] ; do
  Module[${i}]="g.copy"
  let  i=${i}+1
done

#the copies
ModuleOutput[0]="rast_copy_$$"
ModuleOutput[1]="rast3d_copy_$$"
ModuleOutput[2]="vect_copy_$$"
ModuleOutput[3]="region_copy_$$"

#the data types 
ModuleOutputType[0]="rast"
ModuleOutputType[1]="rast3d"
ModuleOutputType[2]="vect"
ModuleOutputType[3]="region"

#the source maps
ModuleValidation[0]="Int0"
ModuleValidation[1]="volume"
ModuleValidation[2]="lines"

#the module options
ModuleOptions[0]="rast=Int0,${ModuleOutput[0]}"
ModuleOptions[1]="rast3d=volume,${ModuleOutput[1]}"
ModuleOptions[2]="vect=areas,${ModuleOutput[2]}"
ModuleOptions[3]="region=3dregion,${ModuleOutput[3]}"
