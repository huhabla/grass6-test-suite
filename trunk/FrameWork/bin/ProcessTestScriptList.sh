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

##########################################################
# This script reads one test-script-list-file and
# run for each entry in the list the testscript
##########################################################
#%Module
#% description: This script reads one test-script-list-file and run for each entry in the list the testscript.
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
#% key: modlist
#% type: string
#% description: The file which lists the testscripts
#% answer: raster3.list   
#% required : yes
#%end
#%option
#% key: modpath
#% type: string
#% description: Path to the test description files
#% required : yes
#%end
#%option
#% key: htmlpath
#% type: string
#% description: The Grass html output path (for source files)
#% answer: /tmp   
#% required : no
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
    echo "g.parser failed, no test available" >> ${GIS_OPT_LOGFILE}
    echo "g.parser failed, no test available"
  exit 1
  fi
fi

#Create the source html file
CreateSourceHTMLFile()
{
#If everything is fine, create the html sorce file if requested
if [ -n "${GIS_OPT_HTMLPATH}" ] ; then
  
  #Clean up for sh2html
  if [ -f ${GIS_OPT_HTMLPATH}/${i}.html ] ; then
    rm -f ${GIS_OPT_HTMLPATH}/${i}.html
  fi

  #Create syntax highlighted output with sh2html
  ${BIN_TEST_PATH}/sh2html ${GIS_OPT_MODPATH}/${i} ${GIS_OPT_HTMLPATH}/${i}.html
fi
}

#The script to run the tests
RunTestScript="RunTestScript.sh"

if [ -f  ${GIS_OPT_MODLIST} ]; then
  #Get the testscript names
  . ${GIS_OPT_MODLIST}
else
  echo "Could not find file ${GIS_OPT_MODLIST}, Break!"
  exit 1
fi

#write the list description to the summary
echo "<-- ${ListDescription} -->" >> ${GIS_OPT_SUMMARY}

#We have some dependencies, so we need to test some modlist first
#if one of these tests fail, no other test will run

##########################################################
#For each entry in *.list call the RunTestScript.sh script 
for i in ${DepModules}; do
  ${BIN_TEST_PATH}/$RunTestScript module=${GIS_OPT_MODPATH}/$i logfile=${GIS_OPT_LOGFILE} summary=${GIS_OPT_SUMMARY} failsum=${GIS_OPT_FAILSUM} 
  if [ $? -ne 0 ]; then 
    echo "$i test failed, no other tests are available" >> ${GIS_OPT_LOGFILE}
    echo "$i test failed, no other tests are available"
    exit 1
  fi
#if success create the html source file
CreateSourceHTMLFile
done 

#process the normal modlist
##########################################################
#For each entry in *.list call the RunTestScript.sh script 
for i in ${Modules}; do
  ${BIN_TEST_PATH}/$RunTestScript module=${GIS_OPT_MODPATH}/$i logfile=${GIS_OPT_LOGFILE} summary=${GIS_OPT_SUMMARY} failsum=${GIS_OPT_FAILSUM} 
  #stop if user break!
  if [ $? -eq 2 ]; then
  	exit 1
  fi
#if success create the html source file
CreateSourceHTMLFile
done 

exit 0


