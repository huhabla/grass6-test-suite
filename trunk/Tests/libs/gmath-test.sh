###########################################

Title="gmath library test"

TestType="unit"

Description="Full test of the numerical part of the gmath library"

NumberOfTests=9

Module[0]="test.gmath.lib"
Module[1]="test.gmath.lib"
Module[2]="test.gmath.lib"
Module[3]="test.gmath.lib"
Module[4]="test.gmath.lib"
Module[5]="test.gmath.lib"
Module[6]="test.gmath.lib"
Module[7]="test.gmath.lib"
Module[8]="test.gmath.lib"

ModuleOptions[0]="unit=blas1"
ModuleOptions[1]="unit=blas2"
ModuleOptions[2]="unit=blas3"
ModuleOptions[3]="unit=solver"
ModuleOptions[4]="-i"
ModuleOptions[5]="rows=500 solverbench=krylov"
ModuleOptions[6]="rows=500 solverbench=direct"
ModuleOptions[7]="rows=1000 blasbench=blas2"
ModuleOptions[8]="rows=100 blasbench=blas3"

