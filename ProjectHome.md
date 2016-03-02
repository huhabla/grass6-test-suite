The GRASS Test Framework framework provides an environment
for testing most of the GRASS raster, raster3, vector, general,
image and database modules.

The GRASS modules are only tested whether they terminate properly.
Otherwise the failure supposed will be written to the summary.

The test environment includes functions for output validation via
md5 checksums of files, raster-, raster3- and vectormaps.
It also provides the functionality to remove the produced output automatically.
Memory check is available if valgrind is installed at your system.

Text or html summary and logfile are generated on demand.
All tests processed by the framework will be listed in the
summary and logfile.

The module tests have to be written in bash style. A lot examples
are available in the "tests" directory. The TestScriptTemplate in the config
directory lists all variables which are used by the framework to perform the tests.

If you want to write a test, take a look at the template and all the
available tests. Add your test to the correct directory (tests/raster, tests/vector ...)
and make an entry in the list-file of the directory (raster.list, verctor.list ....)