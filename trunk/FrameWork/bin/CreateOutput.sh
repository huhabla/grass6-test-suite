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

#########################################################
# This script creates the output for the GRASS Testsuite
# It parses the temporary log and summary files to create
# text and html output
#########################################################
#%Module
#% description: Creates the output for the GRASS Testsuite.
#%End
#%option
#% key: htmlsum 
#% type: string
#% description: The HTML output file
#% answer: /tmp/GRASSTest.html   
#% required : no
#%end
#%option
#% key: htmlog 
#% type: string
#% description: The HTML output file
#% answer: /tmp/GRASSTestlog.html   
#% required : no
#%end
#%option
#% key: inlogfile
#% type: string
#% description: The logfile used log the programm outputs
#% required : yes
#%end
#%option
#% key: insummary
#% type: string
#% description: The file containing the success summary of the test
#% required : yes
#%end
#%option
#% key: infailsum
#% type: string
#% description: The file containing the failure summary of the test
#% required : yes
#%end
#%option
#% key: outlogfile
#% type: string
#% description: The logfile used log the programm outputs
#% answer: /tmp/GRASSTest.log   
#% required : yes
#%end
#%option
#% key: outsummary
#% type: string
#% description: The file containing the success summary of the test
#% answer: /tmp/GRASSTestSummary.txt   
#% required : yes
#%end
#%option
#% key: outfailsum
#% type: string
#% description: The file containing the failure summary of the test
#% answer: /tmp/GRASSTestFailureSummary.txt   
#% required : yes
#%end
#%option
#% key: htmlpath
#% type: string
#% description: The Grass html output path (place of html source files)
#% answer: /tmp   
#% required : no
#%end
#%flag
#%  key: h
#%  description: Create HTML output file
#%end
#%flag
#%  key: o
#%  description: Dont create HTML header
#%end

#Only run if started in GRASS
if [ -z "$GISBASE" ]; then
 echo "You must be in GRASS GIS to run this program." 
 exit 1
fi

#Parse the arguments, if g.parser not work, skip the test's
if [ "$1" != "@ARGS_PARSED@" ] ; then
  exec g.parser "$0" "$@"
  if [ $? -ne 0 ] ; then
    echo "g.parser failed, no test available" 
  exit 1
  fi
fi

#### check if we have sed
if [ ! -x "`which sed`" ] ; then
 echo "sed required, please install first"  
 exit 1
fi

#Check if the files are provided
if [ -z "${GIS_OPT_INSUMMARY}" ] || [ -z "${GIS_OPT_INFAILSUM}" ] || [ -z "${GIS_OPT_OUTSUMMARY}" ] || [ -z "${GIS_OPT_OUTFAILSUM}" ] || [ -z "${GIS_OPT_INLOGFILE}" ] || [ -z "${GIS_OPT_OUTLOGFILE}" ]; then 
  echo "You have to specify the in and output files"
  exit 1
fi

if [ ${GIS_FLAG_H} -eq 1 ] ; then
  if [ -z "${GIS_OPT_HTMLSUM}" ] || [ -z "${GIS_OPT_HTMLOG}" ] ; then 
    echo "You have to specify the html output files"
    exit 1
  fi
fi

##############################
#source the required functions
. ${LIB_TEST_PATH}/CheckDependencies.sh 

#create the config html files and entries in the summary
CreateSourceHTMLFile()
{
if [ -n "${GIS_OPT_HTMLPATH}" ] ; then
  
  #Clean up for sh2html
  if [ -f ${GIS_OPT_HTMLPATH}/$1.html ] ; then
    rm -f ${GIS_OPT_HTMLPATH}/$1.html
  fi

  #Create syntax highlighted output with sh2html
  ${BIN_TEST_PATH}/sh2html ${CFG_TEST_PATH}/$1 ${GIS_OPT_HTMLPATH}/$1.html

  #Setting of the testsuite
  echo "<a href=\"${GIS_OPT_HTMLPATH}/$1.html\" target=\"blank\">$1</a>" >> ${GIS_OPT_HTMLSUM}
  
fi
}

########################################################
#Write the hmtl output
########################################################
if [ ${GIS_FLAG_H} -eq 1 ] ; then


#create the HTML head
if [ ${GIS_FLAG_O} -eq 0 ] ; then
echo '
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
       "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <title>GRASS Test Suite Logfile</title>
</head>
<body bgcolor="#000000" text=#00dd00>'  > ${GIS_OPT_HTMLOG}

echo '
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
       "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <title>GRASS Test Suite Summary</title>
</head>
<body bgcolor="#ffffff">' > ${GIS_OPT_HTMLSUM}
else
  echo '<body bgcolor="#ffffff"> ' > ${GIS_OPT_HTMLOG}
  echo ' <body bgcolor="#ffffff"> ' > ${GIS_OPT_HTMLSUM} 
fi

##################################################################
#Some testrun information
echo "<h1> GRASS Test Suite $Version </h1> " >> ${GIS_OPT_HTMLSUM}  
echo -n "<h3> " >> ${GIS_OPT_HTMLSUM}
echo "Output generated at: `date`" >> ${GIS_OPT_HTMLSUM}
echo  " </h3> " >> ${GIS_OPT_HTMLSUM}
echo "<h3>GRASS Test Environment</h3>"  >> ${GIS_OPT_HTMLSUM}
echo "<pre>"  >> ${GIS_OPT_HTMLSUM}
set  | grep GRASS | grep -v 'PATH\|PS1' | grep -v GIS_OPT | grep -v TMP_DATA_DIR | grep -v BASH_SOURCE | grep -v PWD= >> ${GIS_OPT_HTMLSUM}
echo "</pre>"   >> ${GIS_OPT_HTMLSUM}
echo -n "<br><b>Build information: </b>" >> ${GIS_OPT_HTMLSUM}
echo `g.version -b` >> ${GIS_OPT_HTMLSUM}
echo -n "<br><br><b>Machine: </b> " >> ${GIS_OPT_HTMLSUM}
echo  `uname -a` >> ${GIS_OPT_HTMLSUM}

#If valgrind was used
if [ -n "$MEMCHECK_TEST_PATH" ] ; then
  echo "<h4>Valgrind memcheck was activated</h4>"   >> ${GIS_OPT_HTMLSUM}
  echo "<b>Version: </b>  `valgrind --version`" >> ${GIS_OPT_HTMLSUM}
fi

#write the test suite settings to the output file
echo  "<h3>Test suite settings</h3>" >> ${GIS_OPT_HTMLSUM}

#create the depend, config html files and entries in the summary
#create the dependency file
echo "GRASS library dependencies identified by the test suite"  > ${GIS_OPT_HTMLPATH}/TestSuiteDepends.txt
echo " "  >> ${GIS_OPT_HTMLPATH}/TestSuiteDepends.html
PrintGRASSDependencies >> ${GIS_OPT_HTMLPATH}/TestSuiteDepends.txt
#Set the link
echo "<a href=\"${GIS_OPT_HTMLPATH}/TestSuiteDepends.txt\" target=\"blank\">TestSuiteDependencies</a>" >> ${GIS_OPT_HTMLSUM}
echo  "<br>" >> ${GIS_OPT_HTMLSUM}
CreateSourceHTMLFile GlobalSettings
echo  "<br>" >> ${GIS_OPT_HTMLSUM}
CreateSourceHTMLFile TestScriptTemplate

TMPFILE_1=$TMP_DATA_DIR/CreateOutputTempFile1.txt
TMPFILE_2=$TMP_DATA_DIR/CreateOutputTempFile2.txt

########
#failsum
sed -f ${CFG_TEST_PATH}/CreateHTMLSummarySedCommands ${GIS_OPT_INFAILSUM}  > ${TMPFILE_1}
#Set the filenames and the paths
#replace the placeholders from the sed input
echo "<hr>" >> ${GIS_OPT_HTMLSUM}
sed `eval echo "s?filenamedummy?${GIS_OPT_HTMLOG}?g"` ${TMPFILE_1} >  ${TMPFILE_2}
sed `eval echo "s?htmlpath?${GIS_OPT_HTMLPATH}/?g"` ${TMPFILE_2} >> ${GIS_OPT_HTMLSUM}
echo "<h4>-- end of fail summary --</h4>" >> ${GIS_OPT_HTMLSUM}
echo "<hr>" >> ${GIS_OPT_HTMLSUM}

########
#summary
sed -f ${CFG_TEST_PATH}/CreateHTMLSummarySedCommands ${GIS_OPT_INSUMMARY}  > ${TMPFILE_1} 
#Set the filenames and the paths
#replace the placeholders from the sed input
sed `eval echo "s?filenamedummy?${GIS_OPT_HTMLOG}?g"` ${TMPFILE_1} > ${TMPFILE_2}
sed `eval echo "s?htmlpath?${GIS_OPT_HTMLPATH}/?g"` ${TMPFILE_2} >> ${GIS_OPT_HTMLSUM}
echo "<h4>-- end of complete summary --</h4>" >> ${GIS_OPT_HTMLSUM}
echo "<hr>" >> ${GIS_OPT_HTMLSUM}

###################
#The logfile output
echo "<pre>" >> ${GIS_OPT_HTMLOG}

cat ${GIS_OPT_INLOGFILE} | \
  sed s?'-ID-'?'</pre><a name="'?g | \
  sed s?'+ID+'?'"><a><pre>'?g  >> ${GIS_OPT_HTMLOG}

echo "</pre>" >> ${GIS_OPT_HTMLOG}
echo "</body></html>" >> ${GIS_OPT_HTMLSUM} 
echo "</body></html>" >> ${GIS_OPT_HTMLOG}

fi

########################################################
#Create the normal Text output
#Remove all the tags which are set for the html output
########################################################

########
#failsum
sed -f ${CFG_TEST_PATH}/CreateTextSummarySedCommands ${GIS_OPT_INFAILSUM} > ${GIS_OPT_OUTFAILSUM}
########
#summary
sed -f ${CFG_TEST_PATH}/CreateTextSummarySedCommands ${GIS_OPT_INSUMMARY} > ${GIS_OPT_OUTSUMMARY}
########
#logfile
sed -f ${CFG_TEST_PATH}/CreateTextLogfileSedCommands ${GIS_OPT_INLOGFILE} > ${GIS_OPT_OUTLOGFILE}

exit 0


