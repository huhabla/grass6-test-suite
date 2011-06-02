./RunGRASSTestSuite.sh -dgr
exit
cat QuickStart.txt 
./RunGRASSTestSuite.sh -dgr3vlh htmlfile=index.html htmlfilelog=log.html htmlpath=./
l
konqueror index.html 
bg
cd ..
cd grass640_rc5/
svn log
svn log | less
l
mv grass6.4_gpde_gmath_ccmath_patch_11.Aug.2009.diff ..
cd ..
rm -rf grass640_rc5
l
ls -la
svn checkout https://svn.osgeo.org/grass/grass/branches/develbranch_6 grass6_devel
exit
g.region -p
exit
g.region -p
g.list rast
./RunGRASSTestSuite.sh -dgr3vlh htmlfile=index.html htmlfilelog=log.html htmlpath=./
cd ../grass6_devel/lib/gmath/test/
make
cd -
cd ../grass6_devel/lib/gpde/test/
make
cd -
./RunGRASSTestSuite.sh -dgr3vlh htmlfile=index.html htmlfilelog=log.html htmlpath=./
l
scp *.html TestSuiteDepends.txt soeren@unixpool.math.tu-berlin.de:public_html/grass/GRASS_TestSuite/html_grass-6.4/.
vim Tests/raster/r.gwflow-test.sh 
./RunGRASSTestSuite.sh -dgr3vlh htmlfile=index.html htmlfilelog=log.html htmlpath=./
scp *.html TestSuiteDepends.txt soeren@unixpool.math.tu-berlin.de:public_html/grass/GRASS_TestSuite/html_grass-6.4/.
l
rm *.html
l
rm TestSuiteDepends.txt
g.list rast
g.list vect
exit
./RunGRASSTestSuite.sh help
./RunGRASSTestSuite.sh -dl
./RunGRASSTestSuite.sh -dgrv3sg
./RunGRASSTestSuite.sh -dgrv3sgh help
./RunGRASSTestSuite.sh -dgrv3sgh 
l
vim QuickStart.txt 
cd Doc/
l
vim README 
acroread GRASS-Testsuite-Presentation.pdf 
l
cd ..
l
tree
g.list rast
g.list vect
g.list rast3d
exit
