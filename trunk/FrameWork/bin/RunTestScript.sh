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

##################################################################
# This script sources the testscripts and performs the           #
# needed grass module calls. Each provided grass module will     #
# be executed. The returnvalue of the module is checked and,     #
# dependend of the returnvalue, success- or fail entries will be #
# made in the logfiles. If requeseted, the outputdata of the     #
# module is checked via md5 checksum tests. If this check fails, # 
# the test fails. After all modules are called, the created data #
# will be removed.                                               #
##################################################################
#%Module
#% description: Run's the test described in the test description file.
#%End
#%option
#% key: logfile
#% type: string
#% description: The logfile used log the programm outputs
#% answer: /tmp/GRASSTest.log   
#% required : no
#%end
#%option
#% key: summary
#% type: string
#% description: The lile containing the summary of the test
#% answer: /tmp/GRASSTestSummary.txt   
#% required : no
#%end
#%option
#% key: failsum
#% type: string
#% description: The lile containing the failure summary of the test
#% answer: /tmp/GRASSTestFailureSummary.txt   
#% required : no
#%end
#%option
#% key: module
#% type: string
#% description: The module script name which should be tested
#% required : yes
#%end

#Only run if started in GRASS
if [ -z "$GISBASE" ] ; then
 echo "You must be in GRASS GIS to run this program."  >> ${GIS_OPT_LOGFILE} 
 echo "You must be in GRASS GIS to run this program." 
 exit 1
fi

#Parse the arguments, if g.parser not work, skip the test's
if [ "$1" != "@ARGS_PARSED@" ] ; then
  exec g.parser "$0" "$@"
  if [ $? -ne 0 ] ; then
    echo "g.parser failed, no Test available" >> ${GIS_OPT_LOGFILE}
    echo "g.parser failed, no Test available"
  exit 1
  fi
fi

#### check if we have sed
if [ ! -x "`which grep`" ] ; then
 echo "grep required, please install first"  
 exit 1
fi

if [ ! -f  ${GIS_OPT_MODULE} ]; then
  echo "Could not find module ${GIS_OPT_MODULE}" >> ${GIS_OPT_LOGFILE}
  echo "Could not find module ${GIS_OPT_MODULE}"
  exit 1
fi

###########################################
#First read the template of the testscript to
#initialize the variables --- thats very important
. ${CFG_TEST_PATH}/TestScriptTemplate

###########################################
#Source all the function which are needed
. ${LIB_TEST_PATH}/RunTestScriptFunctions.sh 
. ${LIB_TEST_PATH}/CheckDependencies.sh 

###########################################
#source the known module errors for parsing
. ${CFG_TEST_PATH}/KnownErrorMessages


#Get the GIS environment variables
eval `g.gisenv`

# what to do in case of user break:
exitprocedureClean()
{
 echo "User break: will try to clean up!"
 CleanUp
 exit 2
}
trap "exitprocedureClean" 2 3 15


########################################
#--------------------------------------#
#Read the test script and start the Test
. ${GIS_OPT_MODULE}
TestModules
ReturnStat=$?
#--------------------------------------#
########################################


##############################################################
#For better reading
##############################################################
echo "+++!  ::   ::  ::  ::  --- " >> ${GIS_OPT_SUMMARY}
echo "+++!  ::   ::  ::  ::  --- " >> ${GIS_OPT_SUMMARY}
echo "+++!  ::   ::  ::  ::  --- " >> ${GIS_OPT_SUMMARY}
echo "+++!  ::   ::  ::  ::  --- " >> ${GIS_OPT_SUMMARY}

if [ ${ReturnStat} -ne 0 ]; then
  #write only in the faillog, if a failure was detected
  echo "+++!  ::  ::  ::  ::  ::  --- " >> ${GIS_OPT_FAILSUM}
  echo "+++!  ::  ::  ::  ::  ::  --- " >> ${GIS_OPT_FAILSUM}
  echo "+++!  ::  ::  ::  ::  ::  --- " >> ${GIS_OPT_FAILSUM}
  echo "+++!  ::  ::  ::  ::  ::  --- " >> ${GIS_OPT_FAILSUM}
fi
##############################################################


exit ${ReturnStat}
