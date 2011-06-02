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
#% description: Compares the MD5 Checksum of two g3d raster maps. The test map and the reference map/MD5 Checksum must be declared.
#%End
#%option
#% key: testmap
#% gisprompt: old,cell,raster3
#% type: string
#% description: The map which should be tested
#% required : yes
#%end
#%option 
#% key: refmap
#% gisprompt: old,cell,raster3
#% type: string
#% description: The reference map
#% required : no
#%end
#%option 
#% key: md5
#% type: string
#% description: The reference checksum 
#% required : no
#%end
#%option 
#% key: dp
#% type: integer
#% description: The float precision of r3.out.ascii
#% answer: 5   
#% required : no
#%end
#%flag
#%  key: a
#%  description: Use r3.out.ascii to performe the md5 checksum test of the map
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
if [ -z "${GIS_OPT_MD5}" ] && [ -z "${GIS_OPT_REFMAP}"  ] ; then
  echo "Please provide the reference map or the md5 checksum"
 exit 1
fi

MD5Test="none"
MD5Ref=${GIS_OPT_MD5}

if [ ${GIS_FLAG_A} -eq 0 ] ; then
  eval `g.gisenv`
  : ${GISBASE?} ${GISDBASE?} ${LOCATION_NAME?} ${MAPSET?}
  LOCATION=$GISDBASE/$LOCATION_NAME/$MAPSET

  #Perform the MD5 checksum
  if [ -f $LOCATION/grid3/${GIS_OPT_TESTMAP}/cell ] ; then
    ls -al $LOCATION/grid3/${GIS_OPT_TESTMAP}
    file $LOCATION/grid3/${GIS_OPT_TESTMAP}
    MD5Test="`md5sum $LOCATION/grid3/${GIS_OPT_TESTMAP}/cell | cut -d' ' -f1`"
  else
      echo "Map ${GIS_OPT_TESTMAP} not found" 
    exit 1
  fi

  #calculate the md5 for the refmap if needed
  if [ -z "${GIS_OPT_MD5}" ] ; then
    if [ -f $LOCATION/grid3/${GIS_OPT_REFMAP}/cell ] ; then
      ls -al $LOCATION/grid3/${GIS_OPT_REFMAP}
      file $LOCATION/grid3/${GIS_OPT_REFMAP}
      MD5Ref="`md5sum $LOCATION/grid3/${GIS_OPT_REFMAP}/cell | cut -d' ' -f1`"
    else
      echo "Map ${GIS_OPT_REFMAP} not found" 
      exit 1
    fi
  fi
else
  #testmap
  MD5Test="`r3.out.ascii -h dp=${GIS_OPT_DP} input=${GIS_OPT_TESTMAP} | md5sum | cut -d' ' -f1`" > /dev/null 2>&1

  #refmap
  if [ -z "${GIS_OPT_MD5}" ] ; then
    MD5Ref="`r3.out.ascii -h dp=${GIS_OPT_DP} input=${GIS_OPT_REFMAP} | md5sum | cut -d' ' -f1`" > /dev/null 2>&1

  fi
fi

#some information for the logfile
echo " "
echo "${GIS_OPT_TESTMAP} = $MD5Test   ${GIS_OPT_REFMAP} = $MD5Ref" 

#check the md5 checksum
check_md5sum $MD5Test $MD5Ref

exit 0
