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

#%Module
#% description: Compares the MD5 Checksum of two files. The test file and the reference file/MD5 Checksum must be declared.
#%End
#%option
#% key: testfile
#% gisprompt: file,file,file
#% type: string
#% description: The file which should be tested
#% required : yes
#%end
#%option 
#% key: reffile
#% gisprompt: file,file,file
#% type: string
#% description: The reference file
#% required : no
#%end
#%option 
#% key: md5
#% type: string
#% description: The reference file checksum 
#% answer:    
#% required : no
#%end

#Only run if started in GRASS
if [ -z "$GISBASE" ] ; then
   echo "You must be in GRASS GIS to run this program." 
 exit 1
fi

#### check if we have md5sum
if [ ! -x "`which md5sum`" ] ; then
   echo "$PROG: md5sum required, please install first"
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

#### check if we have cut
if [ ! -x "`which cut`" ] ; then
    echo "cut required, please install first"
    exit 1
fi

echo " "
echo "MD5 checksum test "
  
########## test function goes here
check_md5sum()
{
 EXPECTED="$1"
 FOUND="$2"

 # test for NAN
if [ "$FOUND" = "nan" ] ; then
  echo "ERROR. $VALUENAME: Expected=$EXPECTED | FOUND=$FOUND"
  exit 1
fi

 if [ "$EXPECTED" != "$FOUND" ] ; then
  echo "ERROR. The md5sum differs." 
  exit 1
 else
  echo "The md5sum's are equal."
  exit 0
 fi
}

#We need the checksum or the reffile
if [ -z "${GIS_OPT_MD5}" ] && [ -z "${GIS_OPT_REFFILE}" ] ; then
 echo "Please provide the reference file or the md5 checksum"
 exit 1
fi

MD5Test=""
MD5Ref=${GIS_OPT_MD5}

#Perform the MD5 checksum
if [ -f ${GIS_OPT_TESTFILE} ] ; then
  ls -al ${GIS_OPT_TESTFILE}
  file ${GIS_OPT_TESTFILE}
  MD5Test="`md5sum ${GIS_OPT_TESTFILE} | cut -d' ' -f1`"
else
  echo "File ${GIS_OPT_TESTFILE} not found" 
  exit 1
fi

#calculate the md5 for the reffile if needed
if [ -z "${GIS_OPT_MD5}" ] ; then
  if [ -f ${GIS_OPT_REFFILE} ] ; then
    ls -al ${GIS_OPT_TESTFILE}
    file ${GIS_OPT_REFFILE}
    MD5Ref="`md5sum ${GIS_OPT_REFFILE} | cut -d' ' -f1`"
  else
    echo "File ${GIS_OPT_REFFILE} not found" 
    exit 1
  fi
fi

#some information
echo "${GIS_OPT_TESTFILE} = $MD5Test   ${GIS_OPT_REFFILE} = $MD5Ref" 

#check the md5 checksum
check_md5sum $MD5Test $MD5Ref

exit 0
