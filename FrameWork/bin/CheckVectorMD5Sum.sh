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
#% description: Compares the MD5 Checksum of two vectors. The test vector and the reference vector/MD5 Checksum's (v.out.ascii or topo/coor/cidx checksums) must be declared.
#%End
#%option
#% key: testmap 
#% gisprompt: old,vector,vector
#% type: string
#% description: The vector map which should be tested
#% required : yes
#%end
#%option 
#% key: refmap 
#% gisprompt: old,vector,vector
#% type: string
#% description: The reference vector map
#% required : no
#%end
#%option 
#% key: md5
#% type: string
#% description: The reference v.out.ascii md5 checksum 
#% required : no
#%end
#%option 
#% key: md5coor
#% type: string
#% description: The reference coordinates checksum 
#% required : no
#%end
#%option 
#% key: md5topo
#% type: string
#% description: The reference topologie checksum 
#% required : no
#%end
#%option 
#% key: md5cidx
#% type: string
#% description: The reference cat index checksum 
#% required : no
#%end
#%option 
#% key: dp
#% type: integer
#% description: The float precision of v.out.ascii
#% answer: 2   
#% required : no
#%end
#%flag
#%  key: t
#%  description: Check topologie file vector/topo.
#%end
#%flag
#%  key: c
#%  description: Check coordinates file vector/coor.
#%end
#%flag
#%  key: i
#%  description: Check cat index file vector/cidx.
#%end
#%flag
#%  key: a
#%  description: Use v.out.ascii to performe the md5 checksum test of the vector map
#%end

#Only run if started in GRASS
if [ -z "$GISBASE" ] ; then
 echo "You must be in GRASS GIS to run this program." 
 exit 1
fi

#### check if we have md5sum
if [ ! -x "`which md5sum`" ] ; then
  echo "$PROG: md5sum required, please instals -al first"
  exit 1
fi

#### check if we have cut
if [ ! -x "`which cut`" ] ; then
  echo "cut required, please instals -al first"
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


########## test function goes here
check_md5sum()
{
  EXPECTED="$1"
  FOUND="$2"

   # test for NAN
  if [ "$FOUND" = "nan" ] ; then
    echo "ERROR. $VALUENAME: Expected=$EXPECTED | FOUND=$FOUND"
    return 1
  fi

  if [ "$EXPECTED" != "$FOUND" ] ; then
    echo "ERROR. The md5sum differs." 
    return 1
  else
    echo "The md5sum's are equal."
    return 0
  fi
}

##################
#ASCII output test
if [ ${GIS_FLAG_A} -eq 1 ] ; then

  MD5Test="none"
  MD5Ref=${GIS_OPT_MD5}
  #testmap
  MD5Test="`v.out.ascii dp=${GIS_OPT_DP} format=standard input=${GIS_OPT_TESTMAP} | md5sum | cut -d' ' -f1`" > /dev/null 2>&1
  #refmap
  if [ -z "${GIS_OPT_MD5}" ] ; then
    MD5Ref="`v.out.ascii dp=${GIS_OPT_DP} format=standard input=${GIS_OPT_REFMAP} | md5sum | cut -d' ' -f1`" > /dev/null 2>&1
  fi

  #some information for the logfile
  echo "Check v.out.ascci output of ${GIS_OPT_TESTMAP} = $MD5Test   ${GIS_OPT_REFMAP} = $MD5Ref" 

#############################
#check the md5 coor checksum
check_md5sum $MD5Test $MD5Ref
Return=$?
exit $Return
fi

#Check if a flag is set
if [ $GIS_FLAG_C -eq 0 -a  $GIS_FLAG_T -eq 0 -a $GIS_FLAG_I -eq 0 ]; then
  echo "You have to specify at least on flag (-cti)"
  exit 1
fi


eval `g.gisenv`
: ${GISBASE?} ${GISDBASE?} ${LOCATION_NAME?} ${MAPSET?}
LOCATION=$GISDBASE/$LOCATION_NAME/$MAPSET

Return=0 #the culmulative return value

#####################################
#Perform the coordinates MD5 checksum

if [ $GIS_FLAG_C -eq 1 ] ; then

MD5Test="none"
MD5Ref=${GIS_OPT_MD5COOR}

#We need the checksum or the reffile
if [ -z "${GIS_OPT_MD5COOR}" ] && [ -z "${GIS_OPT_REFMAP}" ] ; then
  echo "Please provide the reference vector or the coordinates md5 checksum"
 exit 1
fi

echo " "
echo "Check the coordinates"

if [ -f $LOCATION/vector/${GIS_OPT_TESTMAP}/coor ] ; then
  ls -al $LOCATION/vector/${GIS_OPT_TESTMAP}/coor
  file $LOCATION/vector/${GIS_OPT_TESTMAP}/coor
  echo " "
  MD5Test="`md5sum $LOCATION/vector/${GIS_OPT_TESTMAP}/coor | cut -d' ' -f1`"
else
  echo "Map ${GIS_OPT_TESTMAP} not found" 
  exit 1
fi

#calculate the md5 for the refmap if needed
if [ -z "${GIS_OPT_MD5COOR}" ] ; then
  if [ -f $LOCATION/vector/${GIS_OPT_REFMAP}/coor ] ; then
    ls -al $LOCATION/vector/${GIS_OPT_REFMAP}/coor
    file $LOCATION/vector/${GIS_OPT_REFMAP}/coor
    echo " "
    MD5Ref="`md5sum $LOCATION/vector/${GIS_OPT_REFMAP}/coor | cut -d' ' -f1`"
  else
    echo "Vector ${GIS_OPT_REFMAP} not found" 
    exit 1
  fi
fi

#some information for the logfile
echo "Check coordinates of ${GIS_OPT_TESTMAP} = $MD5Test   ${GIS_OPT_REFMAP} = $MD5Ref" 
#############################
#check the md5 coor checksum
check_md5sum $MD5Test $MD5Ref
Return=$?
fi

#####################################
#Perform the topologie MD5 checksum

MD5Test="none"
MD5Ref=${GIS_OPT_MD5TOPO}

if [ $GIS_FLAG_T -eq 1 ] ; then

#We need the checksum or the reffile
if [ -z "${GIS_OPT_MD5TOPO}" ] && [ -z "${GIS_OPT_REFMAP}" ] ; then
 echo "Please provide the reference map or the topologie md5 checksum"
 exit 1
fi

echo " "
echo "Check the topologie"

if [ -f $LOCATION/vector/${GIS_OPT_TESTMAP}/topo ] ; then
  ls -al $LOCATION/vector/${GIS_OPT_TESTMAP}/topo
  file $LOCATION/vector/${GIS_OPT_TESTMAP}/topo
  echo " "
  MD5Test="`md5sum $LOCATION/vector/${GIS_OPT_TESTMAP}/topo | cut -d' ' -f1`"
else
  echo "Map ${GIS_OPT_TESTMAP} not found" 
  exit 1
fi

#calculate the md5 for the refmap if needed
if [ -z "${GIS_OPT_MD5TOPO}" ] ; then
  if [ -f $LOCATION/vector/${GIS_OPT_REFMAP}/topo ] ; then
    ls -al $LOCATION/vector/${GIS_OPT_REFMAP}/topo
    file $LOCATION/vector/${GIS_OPT_REFMAP}/topo
    echo " "
    MD5Ref="`md5sum $LOCATION/vector/${GIS_OPT_REFMAP}/topo | cut -d' ' -f1`"
  else
    echo "Map ${GIS_OPT_REFMAP} not found" 
    exit 1
  fi
fi

#some information for the logfile
echo "Check topologie of ${GIS_OPT_TESTMAP} = $MD5Test   ${GIS_OPT_REFMAP} = $MD5Ref" 

############################
#check the md5 topo checksum
check_md5sum $MD5Test $MD5Ref
Return=`expr $Return + $?`
fi

#####################################
#Perform the cidx MD5 checksum

if [ $GIS_FLAG_I -eq 1 ] ; then

MD5Test="none"
MD5Ref=${GIS_OPT_MD5CIDX}


echo " "
echo "Check the coordinates index"

#We need the checksum or the reffile
if [ -z "${GIS_OPT_MD5CIDX}" ] && [ -z "${GIS_OPT_REFMAP}" ] ; then
 echo "Please provide the reference map or the cidx md5 checksum"
 exit 1
fi

if [ -f $LOCATION/vector/${GIS_OPT_TESTMAP}/cidx ] ; then
  ls -al $LOCATION/vector/${GIS_OPT_TESTMAP}/cidx
  file $LOCATION/vector/${GIS_OPT_TESTMAP}/cidx
  echo " "
  MD5Test="`md5sum $LOCATION/vector/${GIS_OPT_TESTMAP}/cidx | cut -d' ' -f1`"
else
  echo "Map ${GIS_OPT_TESTMAP} not found" 
  exit 1
fi

#calculate the md5 for the refmap if needed
if [ -z "${GIS_OPT_MD5CIDX}" ] ; then
  if [ -f $LOCATION/vector/${GIS_OPT_REFMAP}/cidx ] ; then
    ls -al $LOCATION/vector/${GIS_OPT_REFMAP}/cidx
    file $LOCATION/vector/${GIS_OPT_REFMAP}/cidx
    echo " "
    MD5Ref="`md5sum $LOCATION/vector/${GIS_OPT_REFMAP}/cidx | cut -d' ' -f1`"
  else
    echo "Map ${GIS_OPT_REFMAP} not found" 
    exit 1
  fi
fi

#some information for the logfile
echo "Check cat index of ${GIS_OPT_TESTMAP} = $MD5Test   ${GIS_OPT_REFMAP} = $MD5Ref" 

############################
#check the md5 topo checksum
check_md5sum $MD5Test $MD5Ref
Return=`expr $Return + $?`
fi
exit $Return
