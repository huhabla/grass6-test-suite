###########################################

Title="r.terraflow test" 

Description="Basic function test of r.terraflow" 

NEED_CXX="yes"

NumberOfTests=1

Module[0]="r.terraflow" 

ModuleOutput[0]="
g2d_test_map_$$_filled 
g2d_test_map_$$_direction
g2d_test_map_$$_swatershed
g2d_test_map_$$_accumulation
g2d_test_map_$$_tci
" 

ModuleOutputType[0]="rast" 

ModuleValidationMD5[0]="
4047a1dd0113fdc5e62e798b79031c2e
49b7ac04ed2d788a9c7db39101351459
17101d3bf23d66d25743a30eed2ec7ab
1232c365ab04ca182dc7809958428ec4
be2737d86f93e78e22d515816dfaca03
" 

ModuleOptions[0]="elev=elevation filled=g2d_test_map_$$_filled direction=g2d_test_map_$$_direction swatershed=g2d_test_map_$$_swatershed accumulation=g2d_test_map_$$_accumulation tci=g2d_test_map_$$_tci STREAM_DIR=/tmp stats=/tmp/stats.out"
