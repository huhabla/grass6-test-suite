#!/bin/sh
############################################################################
# 
# AUTHOR(S):    Soeren Gebbert soerengebbert <at> gmx <dot> de
# PURPOSE:      Part of the grass test suite
# COPYRIGHT:    (C) 2005 by the GRASS Development Team
#
#               This program is free software under the GNU General Public
#               License (>=v2). Read the file COPYING that comes with GRASS
#               for details.
#
#############################################################################

###########################################
# Startscript of the GRASS test framework #
###########################################
#%Module
#% description: A test framework for GRASS to test modules of correct execution and valid output. It also provides memory check via valgrind.
#%End
#%flag
#%  key: x
#%  description: Test display (d.*) modules (currently no tests available)
#%end
#%flag
#%  key: d
#%  description: Test database (db.*) modules
#%end
#%flag
#%  key: g
#%  description: Test general (g.*) modules
#%end
#%flag
#%  key: h
#%  description: Create HTML output
#%end
#%flag
#%  key: o
#%  description: Dont create the HTML header 
#%end
#%flag
#%  key: i
#%  description: Test image (i.*) modules (currently no tests available)
#%end
#%flag
#%  key: m
#%  description: use valgrind to run memchecks for every module
#%end
#%flag
#%  key: r
#%  description: Test raster (r.*) modules
#%end
#%flag
#%  key: s
#%  description: Test grass scripts (currently no tests available)
#%end
#%flag
#%  key: v
#%  description: Test vector (v.*) modules
#%end
#%flag
#%  key: p
#%  description: Print the current testsuite version to stdout and exit
#%end
#%flag
#%  key: 3
#%  description: Test raster3d (r3.*) modules
#%end
#%flag
#%  key: l
#%  description: Test grass libraries (currently only gpde and gmath libraries)
#%end
#%flag
#%  key: u
#%  description: Test userdefined modules
#%end
#%option
#% key: logfile
#% type: string
#% description: The Logfile used log the programm outputs
#% answer: /tmp/GRASSTest.log   
#% required : no
#%end
#%option
#% key: summary
#% type: string
#% description: The file containing the summary of the test
#% answer: /tmp/GRASSTestSummary.txt   
#% required : no
#%end
#%option
#% key: failsum
#% type: string
#% description: The file containing the failure summary of the test
#% answer: /tmp/GRASSTestFailureSummary.txt   
#% required : no
#%end
#%option
#% key: htmlfile
#% type: string
#% description: The GRASS summary (success and fail) html file
#% answer: /tmp/GRASSTestSummary.html   
#% required : no
#%end
#%option
#% key: htmlpath
#% type: string
#% description: The GRASS html output path (memcheck output and html test source files)
#% answer: /tmp   
#% required : no
#%end
#%option
#% key: htmlfilelog
#% type: string
#% description: The GRASS testlog html file
#% answer: /tmp/GRASSTestLog.html   
#% required : no
#%end
#%option
#% key: userdef
#% type: string
#% description: Path to a user defined test directory containing userdef.list
#% answer: ./Tests/MyGrassTest   
#% required : no
#%end
#%option
#% key: module
#% type: string
#% description: Test a single module
#% required : no
#%end
#%option
#% key: memcheckpath
#% type: string
#% description: The memchecker txt output path (txt output files, not used if html should created)
#% answer: /tmp   
#% required : no
#%end
#%option
#% key: valgrindopts
#% type: string
#% description: Additional options for valgrind
#% answer: --error-limit=no --leak-check=full --time-stamp=yes 
#% required : no
#%end

#Only run if started in GRASS
if [ -z "$GISBASE" ] ; then
 echo "You must be in GRASS GIS to run this program." 
 exit 1
fi

#Parse the arguments, if g.parser not work, skip the test's
if [ "$1" != "@ARGS_PARSED@" ] ; then
  exec g.parser "$0" "$@"
  if [ $? -ne 0 ] ; then
  	echo "g.parser failed, no Test available"
	exit 1
  fi
fi

#### check if we have tee
if [ ! -x "`which tee`" ] ; then
 echo "tee required, please install first"  
    exit 1
fi

#### check if we have sed
if [ ! -x "`which sed`" ] ; then
 echo "sed required, please install first"  
 exit 1
fi

#### check if we have grep
if [ ! -x "`which grep`" ] ; then
 echo "grep required, please install first"  
 exit 1
fi


#### check if we have valgrind
if [ ${GIS_FLAG_M} = 1 ] ; then
  if [ ! -x "`which valgrind`" ] ; then
    echo "valgrind required, please install first or dont use flag -m"  
    exit 1
  fi
fi

################################################
# ./ should be replaced by the GIS_PATH variable
if [ -z "$TESTSUITE_INSTALLDIR" ] ; then
  export TESTSUITE_INSTALLDIR="./"
fi
################################################
#Set the global PATH variables
export LIB_TEST_PATH=${TESTSUITE_INSTALLDIR}/FrameWork/lib
export BIN_TEST_PATH=${TESTSUITE_INSTALLDIR}/FrameWork/bin
export CFG_TEST_PATH=${TESTSUITE_INSTALLDIR}/FrameWork/config

##########################################
##########################################
#source the config and function files
. ${CFG_TEST_PATH}/GlobalSettings
. ${LIB_TEST_PATH}/CheckDependencies.sh
export Version

##########################################
#Now check the dependencies!!
CheckGRASSDependencies

#Print the Version and exit
if [ $GIS_FLAG_P -eq 1 ] ; then
  echo "GRASS Testsuite Version $Version"
  exit 1
fi

#At least one flag should be set
if [  $GIS_FLAG_G -eq 0  ] && [  $GIS_FLAG_R -eq 0  ] && [  $GIS_FLAG_V -eq 0  ] && [  $GIS_FLAG_I -eq 0  ] && [  $GIS_FLAG_3 -eq 0  ] && [  $GIS_FLAG_U -eq 0  ] && [ -z "${GIS_OPT_MODULE}"  ] && [  $GIS_FLAG_S -eq 0  ] && [  $GIS_FLAG_D -eq 0 ] && [  $GIS_FLAG_L -eq 0 ]; then
    echo "ERROR: Select a flag to specify the test"
    exit 1
fi

#Check the html option and set the html path
if [ $GIS_FLAG_H -eq 1 ] ; then
  if [ -z "$GIS_OPT_HTMLPATH" ] ; then
	echo "Please specify the html path."
  	exit 1
  fi
else
  GIS_OPT_HTMLPATH=""  
fi

#############################################################
#Create a temporary directory for the logfiles and data files
TMPDIR="`g.tempfile pid=$$`"
if [ $? -ne 0 ] || [ -z "$TMPDIR" ] ; then
    echo "ERROR: unable to create temporary files" 
    exit 1
fi
rm -rf "$TMPDIR"
mkdir "$TMPDIR"

#define the temporary logfiles
GRASSLOG=$TMPDIR/GRASSLOG.txt
GRASSSUM=$TMPDIR/GRASSSUM.txt
GRASSFAILSUM=$TMPDIR/GRASSFAILSUM.txt

#Create a temp dir for the tests outputs
export TMP_DATA_DIR="$TMPDIR/testdata"
mkdir $TMP_DATA_DIR

##################################################
#Set the path for the temporary memchecker output#
#if this path is set, valgrind is used to check the modules
#for every checked module a output txt/html file will be created
if [ ${GIS_FLAG_M} -eq 1 ] ; then
  mkdir $TMPDIR/memcheck
  export MEMCHECK_TEST_PATH=$TMPDIR/memcheck
  #additional valgrind otpions
  export ADD_VALGRIND_OPTIONS=${GIS_OPT_VALGRINDOPTS}
else
  export MEMCHECK_TEST_PATH=""
fi


# what to do in case of user break:
exitprocedure()
{
 echo "Stop test because of user break or error!"
 cp $GRASSLOG ${GIS_OPT_LOGFILE}
 rm -rf "$TMPDIR"
 exit 1
}
trap "exitprocedure" 2 3 15


##################################################
#Test if the Logfile and the Summary are writeable
echo "GRASS TestSuite Version ${Version} Logfile" > ${GRASSLOG}
if [ $? -ne 0 ] ; then
  echo "Could not write to logfile"
  exitprocedure
fi

echo "-+- Complete Summary"  +-+ > ${GRASSSUM} 
if [ $? -ne 0 ] ; then
  echo "Could not write to success-summary file"
  exitprocedure
fi

echo "-+- Fail Summary"  +-+ > ${GRASSFAILSUM} 
if [ $? -ne 0 ] ; then
  echo "Could not write to fail-summary file"
  exitprocedure
fi

############################
#For HTML parser TABLE begin
echo "++++" >> ${GRASSFAILSUM}
echo "++++" >> ${GRASSSUM}

##########################################################################################
# START THE TESTS ########################################################################
##########################################################################################

if [ $GIS_FLAG_X -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing display (d.*) modules " | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH} modpath=${DISPLAY_TEST_PATH} modlist=${display_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing display (d.*) modules" | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_D -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing database (db.*) modules " | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH} modpath=${DB_TEST_PATH} modlist=${db_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing database (db.*) modules" | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_G -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing general (g.*) modules " | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH} modpath=${GENERAL_TEST_PATH} modlist=${general_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing general (g.*) modules" | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_I -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing image  (i.*) modules "  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH}  modpath=${IMAGE_PATH} modlist=${image_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing image  (i.*) modules"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_R -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing raster (r.*) modules "  | tee -a ${GRASSLOG}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH} modpath=${RASTER_TEST_PATH} modlist=${raster_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing raster (r.*) modules" | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_3 -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing raster3 (r3.*) modules "  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH}  modpath=${RASTER3_TEST_PATH} modlist=${raster3_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing raster3 (r3.*) modules"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_S -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing grass scripts "  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH}  modpath=${SCRIPT_TEST_PATH} modlist=${script_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing grass scripts"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_V -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing vector (v.*) modules "  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH}  modpath=${VECTOR_TEST_PATH} modlist=${vector_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing vector (v.*) modules"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ $GIS_FLAG_L -eq 1 ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start grass library testing "  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH}  modpath=${LIBRARY_TEST_PATH} modlist=${library_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished grass library testing"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi


if [ $GIS_FLAG_U -eq 1 ] ; then
  userdef_list="${GIS_OPT_USERDEF}/userdef.list"
  export USER_TEST_PATH=${GIS_OPT_USERDEF}
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing user defined modules "  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/ProcessTestScriptList.sh htmlpath=${GIS_OPT_HTMLPATH}  modpath=${USER_TEST_PATH} modlist=${userdef_list} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing user defined modules"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

if [ -n "${GIS_OPT_MODULE}" ] ; then
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Start testing single module ${GIS_OPT_MODULE}" | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  ${BIN_TEST_PATH}/RunTestScript.sh  module=${GIS_OPT_MODULE} logfile=${GRASSLOG} summary=${GRASSSUM} failsum=${GRASSFAILSUM} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
  echo "Finished testing single module ${GIS_OPT_MODULE}"  | tee -a ${GRASSLOG} 
  echo "==========================================================="  | tee -a ${GRASSLOG} 
fi

#################################
#HTML parser entries end of table
echo "----" >> ${GRASSSUM}
echo "----" >> ${GRASSFAILSUM}

#########################
#Create html summary file
if [ $GIS_FLAG_H -eq 1 ] ; then
  echo "Creating html and text files"

  #Copy the valgrind file to the htmlout dir
  if [ -n "$MEMCHECK_TEST_PATH" ] ; then
	for i in `ls $MEMCHECK_TEST_PATH` ; do
	  cp $MEMCHECK_TEST_PATH/$i ${GIS_OPT_HTMLPATH}
	done
  fi
  
  if [ $GIS_FLAG_O -eq 1 ] ; then
    ${BIN_TEST_PATH}/CreateOutput.sh -ho insummary=${GRASSSUM} infailsum=${GRASSFAILSUM} inlogfile=${GRASSLOG} htmlog=${GIS_OPT_HTMLFILELOG} htmlsum=${GIS_OPT_HTMLFILE} outsummary=${GIS_OPT_SUMMARY} htmlpath=${GIS_OPT_HTMLPATH} outfailsum=${GIS_OPT_FAILSUM} outlogfile=${GIS_OPT_LOGFILE}
  else
    ${BIN_TEST_PATH}/CreateOutput.sh -h insummary=${GRASSSUM} infailsum=${GRASSFAILSUM} inlogfile=${GRASSLOG} htmlog=${GIS_OPT_HTMLFILELOG} htmlsum=${GIS_OPT_HTMLFILE} outsummary=${GIS_OPT_SUMMARY} htmlpath=${GIS_OPT_HTMLPATH} outfailsum=${GIS_OPT_FAILSUM} outlogfile=${GIS_OPT_LOGFILE}
  fi
else
  echo "Creating text files"
  ${BIN_TEST_PATH}/CreateOutput.sh insummary=${GRASSSUM} infailsum=${GRASSFAILSUM} inlogfile=${GRASSLOG} outsummary=${GIS_OPT_SUMMARY} outfailsum=${GIS_OPT_FAILSUM} outlogfile=${GIS_OPT_LOGFILE} 

  #Copy the valgrind file to the memcheck dir
  if [ -n "$MEMCHECK_TEST_PATH" ] ; then
	for i in `ls $MEMCHECK_TEST_PATH` ; do
	  cp $MEMCHECK_TEST_PATH/$i ${GIS_OPT_MEMCHECKPATH}
	done
  fi

fi

#Cleanup
rm -rf "$TMPDIR"
 
exit 0
