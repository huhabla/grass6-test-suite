###########################################

Title="r.watershed Test" 

Description="Very Basic function test of r.watershed" 

NumberOfTests=1

Module[0]="r.watershed" 

ModuleOutput[0]="
map_$$_accumulation 
map_$$_drainage 
map_$$_basin 
map_$$_stream
map_$$_slope.steepness
map_$$_half.basin
map_$$_length.slope
" 
ModuleOutputType[0]="rast" 

ModuleValidationMD5[0]="
df3e454c485c67cfa14f45fc86b2b56d
40cacc2e196e48d50dddae1626c4bbe1
3b970efadea5bdfd47ad8bf3838994f6
a7c15bea709a4fed3e9efad08feea492
e92118e42488bbf97bd9bc1307c84779
a66f319d2f2457f522c6fbd4551e54d6
c4f0965e0e6aa287b8fd2f1af539e7f9
" 
ModuleOptions[0]="elevation=elevation accumulation=map_$$_accumulation drainage=map_$$_drainage basin=map_$$_basin stream=map_$$_stream slope.steepness=map_$$_slope.steepness half.basin=map_$$_half.basin length.slope=map_$$_length.slope threshold=100"
