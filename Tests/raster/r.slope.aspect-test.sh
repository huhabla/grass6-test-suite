###########################################

Title="r.slope.aspect Test" 

Description="Basic function test of r.slope.aspect" 

NumberOfTests=1

Module[0]="r.slope.aspect" 

ModuleOutput[0]="
g2d_test_map_$$_slope 
g2d_test_map_$$_aspect 
g2d_test_map_$$_pcurv 
g2d_test_map_$$_tcurv
g2d_test_map_$$_dx
g2d_test_map_$$_dy
g2d_test_map_$$_dxx
g2d_test_map_$$_dyy
g2d_test_map_$$_dxy
" 
ModuleOutputType[0]="rast" 

ModuleValidationMD5[0]="
e1e1d4a52d7a2bc477d1faaf4d19f5ba
9e9e88faeea5a82d02a4e230571ee283
f08a0f99bf5b661826aa3c99c7fd2e9b
8f94d80a22142fa1502939f72459ba1f
f87248c6ba0b90207cec52a49d8feca0
53a03e1d66087334184a6c191c129f5f
61000c36c02ebe5fd37e40d038383b37
37dcb4cd83b44a07e894ff310c5002a4
95772865379d7aff41a3bb98a2e22ec3
" 
ModuleOptions[0]="elevation=elevation slope=g2d_test_map_$$_slope aspect=g2d_test_map_$$_aspect pcurv=g2d_test_map_$$_pcurv tcurv=g2d_test_map_$$_tcurv dx=g2d_test_map_$$_dx dy=g2d_test_map_$$_dy dxx=g2d_test_map_$$_dxx dyy=g2d_test_map_$$_dyy dxy=g2d_test_map_$$_dxy"
