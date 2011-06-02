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


#################################
# all (known) dependencies of    #
# grass                         #
#################################
#  BLAS support:               no
#  C++ support:                no
#  DWG support:                no
#  FFMPEG support:             no
#  FFTW support:               no
#  FreeType support:           no
#  GDAL support:               no
#  GLw support:                no
#  JPEG support:               no
#  LAPACK support:             no
#  Large File Support (LFS):   no
#  Motif support:              no
#  MySQL support:              no
#  NLS support:                no
#  ODBC support:               no
#  OGR support:                no
#  OpenGL(R) support:          no
#  PNG support:                no
#  PostgreSQL support:         no
#  Readline support:           no
#  SQLite support:             no
#  Tcl/Tk support:             no
#  TIFF support:               no
#  X11 support:                no

#additional the proj library is checked

####################################
# check if the module dependencies  #
# are fulfilled, return 1 if not,  #
# so the test will not performed   #
####################################
CheckModuleDependencies()
{
if [ "$HAVE_BLAS" = "no" ] && [ "$NEED_BLAS" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_CXX" = "no" ] && [ "$NEED_CXX" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_DWG" = "no" ] && [ "$NEED_DWG" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_FFMPEG" = "no" ] && [ "$NEED_FFMPEG" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_FFTW" = "no" ] && [ "$NEED_FFTW" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_FREETYPE" = "no" ] && [ "$NEED_FREETYPE" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_GDAL" = "no" ] && [ "$NEED_GDAL" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_GLW" = "no" ] && [ "$NEED_GLW" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_JPEG" = "no" ] && [ "$NEED_JPEG" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_LAPACK" = "no" ] && [ "$NEED_LAPACK" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_LFS" = "no" ] && [ "$NEED_LFS" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_MOTIF" = "no" ] && [ "$NEED_MOTIF" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_MYSQL" = "no" ] && [ "$NEED_MYSQL" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_NLS" = "no" ] && [ "$NEED_NLS" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_ODBC" = "no" ] && [ "$NEED_ODBC" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_OGR" = "no" ] && [ "$NEED_OGR" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_OPENGL" = "no" ] && [ "$NEED_OPENGL" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_PNG" = "no" ] && [ "$NEED_PNG" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_POSTGRESQL" = "no" ] && [ "$NEED_POSTGRESQL" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_PROJ" = "no" ] && [ "$NEED_PROJ" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_READLINE" = "no" ] && [ "$NEED_READLINE" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_SQLITE" = "no" ] && [ "$NEED_SQLITE" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_TCLTK" = "no" ] && [ "$NEED_TCLTK" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_TIFF" = "no" ] && [ "$NEED_TIFF" = "yes" ] ; then
  return 1;
fi
if [ "$HAVE_X11" = "no" ] && [ "$NEED_X11" = "yes" ] ; then
  return 1;
fi

return 0;
}

####################################
#Check the dependencies if set to no
#and export them
CheckGRASSDependencies()
{

#check blas
#if [ "$HAVE_BLAS" = "no" ] ; then
#  if [ `which ?` ] ; then
#     export HAVE_BLAS="yes"
#  fi
#fi

#check c++, r.terraflow use this
#so it should be in the path
if [ "$HAVE_CXX" = "no" ] ; then
  if [ `which r.terraflow` ] ; then
     export HAVE_CXX="yes"
  fi
fi

#check dwg, v.in.dwg use this
#so it should be in the path
if [ "$HAVE_DWG" = "no" ] ; then
  if [ `which v.in.dwg` ] ; then
     export HAVE_DWG="yes"
  fi
fi

#check FFMPEG, nviz use this
#so it should be in the path
if [ "$HAVE_FFMPEG" = "no" ] ; then
  if [ `which nviz` ] ; then
     export HAVE_FFMPEG="yes"
  fi
fi

#check FFTW, r.surf.random use this
#so it should be in the path
if [ "$HAVE_FFTW" = "no" ] ; then
  if [ `which r.surf.random` ] ; then
     export HAVE_FFTW="yes"
  fi
fi

#check FREETYPE, ? use this
#so it should be in the path
#if [ "$HAVE_FREETYPE" = "no" ] ; then
#  if [ `which ` ] ; then
#     export HAVE_FREETYPE="yes"
#  fi
#fi

#check GDAL, r.in.gdal use this
#so it should be in the path
if [ "$HAVE_GDAL" = "no" ] ; then
  if [ `which r.in.gdal` ] ; then
     export HAVE_GDAL="yes"
  fi
fi

#check GLW, r3.showdspf use this
#so it should be in the path
if [ "$HAVE_GLW" = "no" ] ; then
  if [ `which r3.showdspf` ] ; then
     export HAVE_GLW="yes"
  fi
fi

#check JPEG, ? use this
#so it should be in the path
#if [ "$HAVE_JPEG" = "no" ] ; then
#  if [ `which ?` ] ; then
#     export HAVE_JPEG="yes"
#  fi
#fi

#check LAPACK, gmath use this
#so it should be in the path
#if [ "$HAVE_LAPACK" = "no" ] ; then
#  if [ `which ?` ] ; then
#     export HAVE_LAPACK="yes"
#  fi
#fi

#check LFS,  lib use this
#so it should be in the path
#if [ "$HAVE_LFS" = "no" ] ; then
#  if [ `which ?` ] ; then
#     export HAVE_LFS="yes"
#  fi
#fi

#check , xganim use this
#so it should be in the path
if [ "$HAVE_MOTIF" = "no" ] ; then
  if [ `which xganim` ] ; then
     export HAVE_MOTIF="yes"
  fi
fi

#check MYSQL, db-driver use this
#so it should be in the path
if [ "$HAVE_MYSQL" = "no" ] ; then
  db.drivers -p | grep mysql > /dev/null 2>&1
  if [ $? = 0 ] ; then
     export HAVE_MYSQL="yes"
  fi
fi

#check NLS, v.voronoi use this
#so it should be in the path
if [ "$HAVE_NLS" = "no" ] ; then
  if [ `which v.voronoi` ] ; then
     export HAVE_NLS="yes"
  fi
fi

#export HAVE_ODBC="no"

#check ODBC, db-driver use this
#so it should be in the path
if [ "$HAVE_ODBC" = "no" ] ; then
  db.drivers -p | grep odbc > /dev/null 2>&1
  if [ $? = 0 ] ; then
     export HAVE_ODBC="yes"
  fi
fi

#check OGR, v.in.ogr use this
#so it should be in the path
if [ "$HAVE_OGR" = "no" ] ; then
  if [ `which v.in.ogr` ] ; then
     export HAVE_OGR="yes"
  fi
fi

#check OPENGL,  use this
#so it should be in the path
if [ "$HAVE_OPENGL" = "no" ] ; then
  if [ `which nviz` ] ; then
     export HAVE_OPENGL="yes"
  fi
fi

#check PNG, r.out.png use this
#so it should be in the path
if [ "$HAVE_PNG" = "no" ] ; then
  if [ `which r.out.png` ] ; then
     export HAVE_PNG="yes"
  fi
fi

#check POSTGRESQL, db-driver use this
#so it should be in the path
if [ "$HAVE_POSTGRESQL" = "no" ] ; then
  db.drivers -p | grep pg > /dev/null 2>&1
  if [ $? = 0 ] ; then
      export HAVE_POSTGRESQL="yes"
  fi
fi

#check PROJ.4, g.proj use this
#so it should be in the path
if [ "$HAVE_PROJ" = "no" ] ; then
  if [ `which g.proj` ] ; then
      export HAVE_PROJ="yes"
  fi
fi

#check READLINE, r/r3.mapcalc use this
#so it should be in the path
#if [ "$HAVE_READLINE" = "no" ] ; then
#  if [ `which ?` ] ; then
#     export HAVE_READLINE="yes"
#  fi
#fi

#check SQLITE, db-driver use this
#so it should be in the path
if [ "$HAVE_SQLITE" = "no" ] ; then
  db.drivers -p | grep sqlite > /dev/null 2>&1
  if [ $? = 0 ] ; then
     export HAVE_SQLITE="yes"
  fi
fi

#export HAVE_TCLTK="no"

#check TCLTK, gis.m use this
#so it should be in the path
if [ "$HAVE_TCLTK" = "no" ] ; then
  if [ `which gis.m` ] ; then
     export HAVE_TCLTK="yes"
  fi
fi

#check TIFF, r.out.tiff use this
#so it should be in the path
if [ "$HAVE_TIFF" = "no" ] ; then
  if [ `which r.out.tiff` ] ; then
     export HAVE_TIFF="yes"
  fi
fi

#check X11, gis.m use this
#so it should be in the path
if [ "$HAVE_X11" = "no" ] ; then
  if [ `which gis.m` ] ; then
     export HAVE_X11="yes"
  fi
fi

} > /dev/null 2>&1

PrintGRASSDependencies()
{
echo "
BLAS       $HAVE_BLAS
CXX        $HAVE_CXX
DWG        $HAVE_DWG
FFMPEG     $HAVE_FFMPEG
FFTW       $HAVE_FFTW
FREETYPE   $HAVE_FREETYPE
GDAL       $HAVE_GDAL
GLW        $HAVE_GLW
JPEG       $HAVE_JPEG
LAPACK     $HAVE_LAPACK
LFS        $HAVE_LFS
MOTIF      $HAVE_MOTIF
MYSQL      $HAVE_MYSQL
NLS        $HAVE_NLS
ODBC       $HAVE_ODBC
OGR        $HAVE_OGR
OPENGL     $HAVE_OPENGL
PNG        $HAVE_PNG
POSTGRESQL $HAVE_POSTGRESQL
PROJ.4     $HAVE_PROJ
READLINE   $HAVE_READLINE
SQLITE     $HAVE_SQLITE
TCLTK      $HAVE_TCLTK
TIFF       $HAVE_TIFF
X11        $HAVE_X11        
" 
}
