# Quick start guide #

To start GRASS use the StartGRASS.sh script
Make sure grass64 is located in your PATH

```
./StartGRASS.sh
```

type "./StartGRASS.sh grass65" if you want to start grass65

The test suite works like all other grass scripts,
g.parser is used to parse the command line
and a tcl/tk gui will created automatically
if the test suite is started without parameters and
if its located in your addon path

Befor the general and vector test can be run, make sure the database paths
are set correctly. To asure this, start the test suite with option "-d" first

```
./RunGRASSTestSuite.sh -d

```

the output should look like this

```
Mapset <testmapset> in Location <TestLocation>
GRASS 6.1.cvs > ./RunGRASSTestSuite.sh -d
===========================================================
Start testing database (db.*) modules
===========================================================
db.columns test:   success  success  success  success   finished
db.copy test:   success  success  success   finished
db.drivers test:   success  success   finished
db.tables test:   success  success  success  success   finished
db.connect test:   success  success  success   finished
db.describe test:   success  success  success  success  success  success   finished
db.execute test:   success  success   finished
db.select test:   success  success  success  success  success   finished
db.test test:   success  success   finished
===========================================================
Finished testing database (db.*) modules
===========================================================
Creating text files
```

Now all database links should be set automatically
and all database modules are tested
All other tests are available now

**General tests
```
./RunGRASSTestSuite.sh -g
```** Raster tests
```
./RunGRASSTestSuite.sh -r
```

**Raster3d tests
```
./RunGRASSTestSuite.sh -3
```**

**Vector tests
```
./RunGRASSTestSuite.sh -v
```**

**Library tests (only grass65)
```
./RunGRASSTestSuite.sh -l
```**

**All together
```
./RunGRASSTestSuite.sh -dgr3vl
```**

**For html summary generation
```
./RunGRASSTestSuite.sh -dgr3vlh htmlfile=index.html htmlfilelog=log.html htmlpath=./
```**

