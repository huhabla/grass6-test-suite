###########################################

Title="r.gwflow test" 

Description="Basic function test of r.gwflow. Confined and unconfined compuation is tested." 

NumberOfTests=11

#The module which should be tested
i=0
while [ ${i} -lt 9 ] ; do
  Module[${i}]="r.mapcalc"
  ModuleOutput[${i}]="raster_${i}_$$"
  ModuleOutputType[${i}]="rast" 
  let  i=${i}+1
done

Module[9]="r.gwflow"
Module[10]="r.gwflow"
ModuleOutput[9]="raster_9_$$"
ModuleOutput[10]="raster_10_$$"
ModuleOutputType[9]="rast" 
ModuleOutputType[10]="rast" 

# Only the r.gwflow output will be validated
ModuleValidationMD5[9]="bee79eca1aeb830d0ffdc3888feb2ecf"
ModuleValidationMD5[10]="b9f801e79c3b5b194f647a1c6ca8dd0d"

ModuleOptions[0]="\"${ModuleOutput[0]}=if(row() == 1 , 50, 40)\""
ModuleOptions[1]="\"${ModuleOutput[1]}=if(row() == 1 , 2, 1)\""
ModuleOptions[2]="\"${ModuleOutput[2]}=if(row() == 20 && col() == 20 , -0.001, 0)\""
ModuleOptions[3]="\"${ModuleOutput[3]}=0.00025\""
ModuleOptions[4]="\"${ModuleOutput[4]}=0\""
ModuleOptions[5]="\"${ModuleOutput[5]}=20.0\""
ModuleOptions[6]="\"${ModuleOutput[6]}=70.0\""
ModuleOptions[7]="\"${ModuleOutput[7]}=0.15\""
ModuleOptions[8]="\"${ModuleOutput[8]}=0.0001\""
ModuleOptions[9]="-s solver=cg top=${ModuleOutput[5]} bottom=${ModuleOutput[4]} phead=${ModuleOutput[0]} status=${ModuleOutput[1]} hc_x=${ModuleOutput[3]} hc_y=${ModuleOutput[3]} q=${ModuleOutput[2]} s=${ModuleOutput[8]} r=${ModuleOutput[4]} output=${ModuleOutput[9]} dt=8640000 type=confined"
ModuleOptions[10]="-s solver=cg top=${ModuleOutput[6]} bottom=${ModuleOutput[4]} phead=${ModuleOutput[0]} status=${ModuleOutput[1]} hc_x=${ModuleOutput[3]} hc_y=${ModuleOutput[3]} q=${ModuleOutput[2]} s=${ModuleOutput[7]} r=${ModuleOutput[4]} output=${ModuleOutput[10]} dt=8640000 type=unconfined"

