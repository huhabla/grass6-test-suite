#!/bin/sh
# Use a case to check the command line options
case "$1" in

  # Check if the user asked for help
  help|-h|-help|--help)
      echo "Usage:"
      echo "  $CMD_NAME [-h | -help | --help] [GRASS_COMMAND]"
      echo
      echo "Flags:"
      echo "  -h or -help or --help          print this help message"
      echo
      echo "Parameters:"
      echo "  GRASS_COMMAND                  grass64 command with path eg: /usr/local/bin/grass64"
      echo "                                 default is grass64 in your path                     "
      exit
      ;;

  # Check if the GRASS_COMMAND option was given
  *)
      if [ "$1" != "" ] ; then
        GRASSCMD=$1
      else
        GRASSCMD=grass64
      fi
      shift
      ;;
esac

#check if we have the right path
if [ ! -f RunGRASSTestSuite.sh ] ; then
  echo "You have to be in the test suite directory to run the tests"
  exit 1
fi

TESTSUITE_INSTALLDIR=`pwd`
export TESTSUITE_INSTALLDIR
exec $GRASSCMD -text $TESTSUITE_INSTALLDIR/TestLocation/testmapset
