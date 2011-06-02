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
# This file provides most of the important functions    #
# for the Testframework: Module execution, validation,  #
# output removing and the fail and success entries in   #
# the log and summarie files                            #
#                                                       #
#    !!!! THIS IS THE BRAIN OF THE TESTFRAMEWORK !!!!   #
#                                                       #
#########################################################


###############################################################
# We need to set a region which fulfils the needs of the Test
###############################################################
SetProperRegion() 
{
  #Save the current region and set a proper g3d region!
  echo "Save the current region" >> ${GIS_OPT_LOGFILE}
  echo g.region save=${GRASSTEST_CurrentRegionSettings} >> ${GIS_OPT_LOGFILE}
  g.region save=${GRASSTEST_CurrentRegionSettings} >> ${GIS_OPT_LOGFILE} 2>&1
  #Make sure the default region is set bevor
  echo g.region -d >> ${GIS_OPT_LOGFILE} 2>&1
  g.region -d >> ${GIS_OPT_LOGFILE} 2>&1
  echo g.region ${TestRegion} >> ${GIS_OPT_LOGFILE}
  g.region ${TestRegion} >> ${GIS_OPT_LOGFILE} 2>&1
}

################################
# Restor the former saved region
################################
RecoverRegion() 
{
  echo "Recover region" 2>&1 >> ${GIS_OPT_LOGFILE}
  echo g.region region=${GRASSTEST_CurrentRegionSettings}  >> ${GIS_OPT_LOGFILE}
  g.region region=${GRASSTEST_CurrentRegionSettings}  >> ${GIS_OPT_LOGFILE} 2>&1
  echo g.remove region=${GRASSTEST_CurrentRegionSettings} >> ${GIS_OPT_LOGFILE}
  g.remove region=${GRASSTEST_CurrentRegionSettings}  >> ${GIS_OPT_LOGFILE} 2>&1
}

#########################################################
# Create the summary header                              
#########################################################
CreateSummaryHeader()
{
#summary header
echo "+-+-  ${Title} (${TestType}) !§${ModName}§! :::   ${Description}   -- " >> ${GIS_OPT_SUMMARY}
echo "+++  Test ::  Module :: Status :: Output validation :: command line argument --- " >> ${GIS_OPT_SUMMARY}
}

#########################################################
# Add an entry to the summary                           
#########################################################
AddSummaryEntry()
{
#++  Test ::  Module :: Status :: Output validation :: command line argument --
echo "++ $1 :: $2  :: $3 :: $4 :: $5 -- " >> ${GIS_OPT_SUMMARY}
}

#########################################################
# Create the fail-summary header
#########################################################
CreateFailSummaryHeader()
{
#failsum header
echo "+-+- ${Title} (${TestType}) !§${ModName}§! ::: ${Description} -+-+ " >> ${GIS_OPT_FAILSUM}
echo "!+++ Test ::  Module :: Status :: Guessed error :: Output validation :: command line argument --- " >> ${GIS_OPT_FAILSUM}
}

#########################################################
# Add an entry to the sail-fummary                           
#########################################################
AddFailSummaryEntry()
{
#++ Test ::  Module :: Status :: Guessed error :: Output validation :: command line argument -- 
echo "!++ $1 :: $2 :: $3 :: $4 :: $5 :: $6 -- " >> ${GIS_OPT_FAILSUM}
return 0
}

#######################################################################
#Create the logifile entries
#######################################################################
CreateSumLogfileEntries()
{
#generate the name of the html source file
ModName=`echo ${GIS_OPT_MODULE} |  sed s?^.?/? | sed s?/.*/??g`.html

CreateSummaryHeader #=-FUNCTION-=#
if [ ${Status_Sum} -ne 0 ]; then
  #write only in the faillog, if a failure was detected
  CreateFailSummaryHeader #=-FUNCTION-=#
fi

#################################################
#now create the important entries in the logfiles
declare -i CountSumLog=0
while [ ${CountSumLog} -lt ${NumberOfTests} ] ; do
  if [ "${Status_SumArray[${CountSumLog}]}" != "0" ] && [ -n "${Status_SumArray[${CountSumLog}]}" ]; then
     #write only in the faillog, if a failure was detected
     #Mark the summary entres red
     echo "!${FailMessage[${CountSumLog}]}" >> ${GIS_OPT_FAILSUM}
     echo "!${SummaryMessage[${CountSumLog}]}" >> ${GIS_OPT_SUMMARY}
  else
     echo "${SummaryMessage[${CountSumLog}]}" >> ${GIS_OPT_SUMMARY}
  fi
  CountSumLog=`expr $CountSumLog + 1`
done
}

#######################################################################
#Removing the output files
#######################################################################
CleanUp()
{
#To provide user specific run
if [ $CleanUpFlag -eq 1 ] ; then
  return 0;
fi

echo " " >> ${GIS_OPT_LOGFILE}
echo "Cleaning up " >> ${GIS_OPT_LOGFILE}

#We are using g.remove and rm for this job

declare -i CountClean=0

#For every entry, remove the output
#raster, raster3, file, vect, icon, labels, region, group
while [ ${CountClean} -lt ${NumberOfTests} ] ; do
  #remove only "existing" files and maps
  if [ -n "${ModuleOutput[${CountClean}]}" ] ; then
    #We may have multiple outputs
    for i in ${ModuleOutput[${CountClean}]} ; do
      case "${ModuleOutputType[${CountClean}]}" in
	file)	rm -vf  $i >> ${GIS_OPT_LOGFILE} 2>&1;;
	rast)	g.remove  rast=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
	rast3d) g.remove  rast3d=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
	vect) g.remove  vect=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
	icon) g.remove  icon=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
	labels) g.remove  labels=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
	region) g.remove  region=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
	group) g.remove  group=$i >> ${GIS_OPT_LOGFILE} 2>&1;;
      esac
    done
  fi
  CountClean=`expr $CountClean + 1`
done
return 0
}

#######################################################################
#Make the md5 checksum test
#######################################################################
CheckMD5()
{

#These script are located in the bin directory of the test
#only files, vector, raster and raster3 maps are supported for now
echo "Running the md5 checksum test " >> ${GIS_OPT_LOGFILE}
declare -i CountMD5=0
declare -i ReturnMD5=0
case "${ModuleOutputType[${Count}]}" in

  #Validate a normal file
  file)	
        #count the files
        declare -i mocount=0
        for i in ${ModuleOutput[${Count}]} ; do
	  TESTFILE[${mocount}]=$i
          mocount=`expr $mocount + 1`
	done

        #count the reference files      
        declare -i mvcount=0
        for i in ${ModuleValidation[${Count}]} ; do
	  REFFILE[${mvcount}]=$i
          mvcount=`expr $mvcount + 1`
	done
	
        #count the md5 checksumms
        declare -i mvmcount=0
        for i in ${ModuleValidationMD5[${Count}]} ; do
	  MD5[${mvmcount}]=$i
          mvmcount=`expr $mvmcount + 1`
	done
	
	#Validation
        declare -i CountMD5=0
        for i in ${ModuleOutput[${Count}]} ; do
	  if [ -n "${MD5[${CountMD5}]}" ] ; then
          ${BIN_TEST_PATH}/CheckFilesMD5Sum.sh  testfile=${TESTFILE[${CountMD5}]} \
	    reffile=${REFFILE[${CountMD5}]} md5=${MD5[${CountMD5}]} >> ${GIS_OPT_LOGFILE} 2>&1
	  var=$?
	  MD5[$CountMD5]=""
	  REFFILE[$CountMD5]=""
          ReturnMD5=`expr $ReturnMD5 + $var`
          CountMD5=`expr $CountMD5 + 1`
	  fi
	done;;
 
  #If more than one output is specified (r.to.rast3), check every output for validation
  rast)
        #count the raster maps
        declare -i mocount=0
        for i in ${ModuleOutput[${Count}]} ; do
	  TESTMAP[${mocount}]=$i
          mocount=`expr $mocount + 1`
	done

        #count the reference raster maps
        declare -i mvcount=0
        for i in ${ModuleValidation[${Count}]} ; do
	  REFMAP[${mvcount}]=$i
          mvcount=`expr $mvcount + 1`
	done
	
        #count the md5 checksumms
        declare -i mvmcount=0
        for i in ${ModuleValidationMD5[${Count}]} ; do
	  MD5[${mvmcount}]=$i
          mvmcount=`expr $mvmcount + 1`
	done
	
	#Validation
        declare -i CountMD5=0
        for i in ${ModuleOutput[${Count}]} ; do
	  if [ -n "${MD5[${CountMD5}]}" ] ; then
          ${BIN_TEST_PATH}/CheckRasterMD5Sum.sh  -a  dp=${RAST_TEST_PRECISION} testmap=${TESTMAP[${CountMD5}]} \
	    refmap=${REFMAP[${CountMD5}]} md5=${MD5[${CountMD5}]} >> ${GIS_OPT_LOGFILE} 2>&1
	  var=$?
	  MD5[$CountMD5]=""
	  REFMAP[$CountMD5]=""
          ReturnMD5=`expr $ReturnMD5 + $var`
          CountMD5=`expr $CountMD5 + 1`
	  fi
	done;;
	
  #If more than one output is specified, check every output for validation
  rast3d) 
        #count the raster3 maps
        declare -i mocount=0
        for i in ${ModuleOutput[${Count}]} ; do
	  TESTMAP[${mocount}]=$i
          mocount=`expr $mocount + 1`
	done

        #count the reference raster3 maps
        declare -i mvcount=0
        for i in ${ModuleValidation[${Count}]} ; do
	  REFMAP[${mvcount}]=$i
          mvcount=`expr $mvcount + 1`
	done
	
        #count the md5 checksumms
        declare -i mvmcount=0
        for i in ${ModuleValidationMD5[${Count}]} ; do
	  MD5[${mvmcount}]=$i
          mvmcount=`expr $mvmcount + 1`
	done
	
	#Validation
        declare -i CountMD5=0
        for i in ${ModuleOutput[${Count}]} ; do
	  if [ -n "${MD5[${CountMD5}]}" ] ; then
          ${BIN_TEST_PATH}/CheckRaster3MD5Sum.sh  -a  dp=${RAST_TEST_PRECISION} testmap=${TESTMAP[${CountMD5}]} \
	    refmap=${REFMAP[${CountMD5}]} md5=${MD5[${CountMD5}]} >> ${GIS_OPT_LOGFILE} 2>&1
	  var=$?
	  MD5[$CountMD5]=""
	  REFMAP[$CountMD5]=""
          ReturnMD5=`expr $ReturnMD5 + $var`
          CountMD5=`expr $CountMD5 + 1`
	  fi
	done;;
 
  #The vectordata requires 3 MD5 checksums coor/topo/cidx or one v.out.ascci md5 checksum 
  vect) 
        for s in ${ModuleValidationMD5[${Count}]} ; do
	  VECTMD5STRING=`echo $s | sed -e s/\;/\ /g`
          declare -i CountMD5=0
          for i in ${VECTMD5STRING} ; do
  	    MD5[$CountMD5]=$i #provide the correct md5 sum
	    #set the right flag
	    if [ $CountMD5 -eq 0 ] ; then 
	      MD5Flag[$CountMD5]="-c" #fist the coordinates
	    elif [ $CountMD5 -eq 1 ] ; then
	      MD5Flag[$CountMD5]="-t" #second the topologie
	    elif  [ $CountMD5 -eq 2 ] ; then
	      MD5Flag[$CountMD5]="-i" #third coordinate index
	    fi
            CountMD5=`expr $CountMD5 + 1`
	  done
          ${BIN_TEST_PATH}/CheckVectorMD5Sum.sh  -a  dp=${VECT_TEST_PRECISION} ${MD5Flag[0]} ${MD5Flag[1]} ${MD5Flag[2]} \
	    md5=${MD5[0]} md5coor=${MD5[0]} md5topo=${MD5[1]} md5cidx=${MD5[2]} \
	    testmap=${ModuleOutput[${Count}]} refmap=${ModuleValidation[${Count}]}  >> ${GIS_OPT_LOGFILE} 2>&1
          ReturnMD5=$?
	done;;
esac

#Return failure or success
if [ $ReturnMD5 -ne 0 ] ; then
  return 1;
else
  return 0
fi
}


#######################################################################
#---------------------------------------------------------------------#
#   This function does all the work, running, parsing, checking ...   #
#---------------------------------------------------------------------#
#######################################################################
TestModules() 
{

#To provide user specific run
if [ $TestModulesFlag -eq 1 ] ; then
  return 0;
fi
 
##########################
#get the grass environment
eval `g.gisenv`

###############################################
#Check if the module dependencies are fullfilled
CheckModuleDependencies #=-FUNCTION-=#
if [ $? -ne 0 ] ; then
    echo "###############################################################################"  >> ${GIS_OPT_LOGFILE}
    echo "The Module dependencies of \"$Title\" are not fulfilled, NO test will performed!"  >> ${GIS_OPT_LOGFILE}
    echo "###############################################################################"  >> ${GIS_OPT_LOGFILE}
    echo -e "The Module dependencies of \"$Title\" are not fulfilled, \033[31m  NO \033[0m test will performed!"
    exit 1;
fi

###############################################
#Check if a testlocation is needed and break if 
#we are not in this location
if [ -n "${RequiredTestLocation}" ] ; then
  if [ "${RequiredTestLocation}" != "${LOCATION_NAME}" ] ; then
    echo "###############################################################################"  >> ${GIS_OPT_LOGFILE}
    echo "\"$Title\" need location ${RequiredTestLocation}, NO test will performed!"  >> ${GIS_OPT_LOGFILE}
    echo "###############################################################################"  >> ${GIS_OPT_LOGFILE}
    echo -e "\"$Title\" need location ${RequiredTestLocation}, \033[31m  NO \033[0m test will performed!"
    exit 1;
  fi
fi

############################################################################
#Create a temporary directory for the temporary log file (for error parsing)
TMPDIR="`g.tempfile pid=$$`"
if [ $? -ne 0 ] || [ -z "$TMPDIR" ] ; then
    echo "ERROR: unable to create temporary files" >> ${GIS_OPT_LOGFILE}
    exit 1
fi
rm -rf "$TMPDIR"
mkdir "$TMPDIR"

#For the logfiles we have to store the success and 
#failmessages
SummaryMessage[0]=""
FailMessage[0]=""

#small information for stdout
echo -n "${Title}:  "

#Some vars
declare -i Status_SumArray=0
declare -i Status_Sum=0
declare -i Status=0
declare -i MD5Status=0
declare -i Count=0
declare -i CountOut=1
TempFile="GRASSTesttmp.log"

#For Region recovery
GRASSTEST_CurrentRegionSettings="GRASSTEST_CurrentRegionSettings_$$"

#########################
#calc the number of tests
if [ -z "${NumberOfTests}" ] ; then
  NumberOfTests=0
fi
if [ ${NumberOfTests} -eq 0 ] ; then
  while [ -n "${Module[${NumberOfTests}]}" ] ; do
    NumberOfTests=`expr $NumberOfTests + 1`
  done
fi

#Make a entry to the logfile
echo " " >> ${GIS_OPT_LOGFILE}
echo "********************************************************************" >> ${GIS_OPT_LOGFILE}
echo "START TESTRUN" >> ${GIS_OPT_LOGFILE}
echo " " >> ${GIS_OPT_LOGFILE}
echo "Title: $Title (${TestType})"  >> ${GIS_OPT_LOGFILE}
echo "Description: ${Description}"  >> ${GIS_OPT_LOGFILE}

#Set the provided region
SetProperRegion #=-FUNCTION-=#


###############################################
#loop over every module that should be executed
###############################################
while [ ${Count} -lt ${NumberOfTests} ] && [ -n "${Module[${Count}]}" ] ; do

Error=" none "
ChecksumTest="none"
EndMessage="\033[32m finished \033[0m"

  #create an id enty in the logfile for html linking support
  echo " -ID-$$.${Count}+ID+  " >> ${GIS_OPT_LOGFILE} 2>&1
  

  #####################
  #Now run the module!#
  ################################################################################
  echo "----- Test  ${CountOut} -----" >> ${GIS_OPT_LOGFILE}
  echo "Running module ${Module[${Count}]}:" >> ${GIS_OPT_LOGFILE}
  echo ${Module[${Count}]} ${ModuleOptions[${Count}]} >> ${GIS_OPT_LOGFILE} 
  echo " " >> ${GIS_OPT_LOGFILE}

  ###############################################################################
  #Perform a normal testrun or use valgrind to run the test and check the memory#
  ###############################################################################
  MEMCHECK_LINK="" #the link in the html summary file and the output name of the textfile
  MEMCHECK_ERROR_COUNT="" #Number of Error detected by valgrind
  MEMCHECK_ERROR_COUNT_ENTRY="" #Entrie in the summary status field
  if [ -n "$MEMCHECK_TEST_PATH" ] ; then
     MEMCHECK_NAME="${Module[${Count}]}-MemCheckLog$$.${Count}.txt"
     MEMCHECK_LINK="-MEM-$MEMCHECK_NAME+MEM+"
     #Run the test with valgrind
     touch $MEMCHECK_TEST_PATH/$MEMCHECK_NAME
     eval valgrind --tool=memcheck $ADD_VALGRIND_OPTIONS --log-file=$MEMCHECK_TEST_PATH/$MEMCHECK_NAME ${Module[${Count}]} ${ModuleOptions[${Count}]} > ${TMPDIR}/${TempFile} 2>&1
     #save the return status
     Status=$?
     #get the number of errors found by valgrind
     MEMCHECK_ERROR_COUNT="`cat $MEMCHECK_TEST_PATH/$MEMCHECK_NAME | grep "ERROR SUMMARY" | sed s/==.\*==//g | cut --delimiter=" " --fields=4`"
     if [ -z "$MEMCHECK_ERROR_COUNT" ] || [ "$MEMCHECK_ERROR_COUNT" = "0" ]; then
       MEMCHECK_ERROR_COUNT_ENTRY="<br> no memory errors"
     else
       MEMCHECK_ERROR_COUNT_ENTRY="<br> memory errors detected"
     fi
  else
     #run the normal test
     eval -- ${Module[${Count}]} ${ModuleOptions[${Count}]} > ${TMPDIR}/${TempFile} 2>&1
     #save the return status
     Status=$?
  fi

  ################################################################################
  #return value of the module
  Status_SumArray[${Count}]=$Status
  
  #Put the temp logfile content to the real logfile
  cat ${TMPDIR}/${TempFile} >> ${GIS_OPT_LOGFILE} 
  echo " " >> ${GIS_OPT_LOGFILE}

  #Check the return value of the grass module
  if [ ${Status} -ne 0 ]; then
    #Test failed
    eval echo -- "${Module[${Count}]} ${ModuleOptions[${Count}]} failed!!"  >> ${GIS_OPT_LOGFILE}
    TestStatus="module-failure"
    Error="dont know "
    
    ################################################################
    #parse the reason for the failure, defined in KnownErrorMessages
    declare -i ErrorCount=0
    while [ -n "${KnownErrors[$ErrorCount]}" ] ; do
      cat ${TMPDIR}/${TempFile} | grep -i "${KnownErrors[$ErrorCount]}" > /dev/null 2>&1 
      if [ $? -eq 0 ]; then
        Error="${KnownErrorMessages[$ErrorCount]}"
      fi
        ErrorCount=`expr $ErrorCount + 1`
    done
    
    #create the fail summary file entry
    FailMessage[${Count}]="++ ${CountOut} of ${NumberOfTests} -ID-$$.${Count}+ID+ $MEMCHECK_LINK :: ${Module[${Count}]} :: ${TestStatus} $MEMCHECK_ERROR_COUNT_ENTRY :: ${Error} :: ${ChecksumTest} :: ${ModuleOptions[${Count}]} --"
  else
    TestStatus="success"
    ##########################
    #Now run the checksum test
    if [ $ValidateData -eq 0 ]; then
      if [ -n "${ModuleValidation[${Count}]}" ] || [ -n "${ModuleValidationMD5[${Count}]}" ] ; then
        CheckMD5 #=-FUNCTION-=#
        MD5Status=$?
        if [ $MD5Status -ne 0 ] ; then 
          Status_SumArray[${Count}]=$MD5Status
          ChecksumTest="Output invalid"
          TestStatus="validation-failure"
          #create the Summary file entries
          FailMessage[${Count}]="++ ${CountOut} of ${NumberOfTests} -ID-$$.${Count}+ID+ $MEMCHECK_LINK :: ${Module[${Count}]} :: ${TestStatus} $MEMCHECK_ERROR_COUNT_ENTRY :: ${Error} ::  ${ChecksumTest} :: ${ModuleOptions[${Count}]} --"
        else
          ChecksumTest="Output valid"
        fi
        echo ${ChecksumTest} >> ${GIS_OPT_LOGFILE}
      fi
    fi
  fi
  
  #Create the summary entry
  SummaryMessage[${Count}]="++ ${CountOut} of ${NumberOfTests} -ID-$$.${Count}+ID+ $MEMCHECK_LINK :: ${Module[${Count}]} :: ${TestStatus} $MEMCHECK_ERROR_COUNT_ENTRY :: ${ChecksumTest} :: ${ModuleOptions[${Count}]} --"

  #logfile entry
  echo "Status **$TestStatus** of ${Title} --> Module ${Module[${Count}]}" >> ${GIS_OPT_LOGFILE}

  #############################
  #small information for stdout
  if [ "${TestStatus}" = "module-failure" ] ; then
    echo -en "\033[31m ${TestStatus} \033[0m"
  elif [ "${TestStatus}" = "validation-failure" ] ; then
    echo -en "\033[1;31m ${TestStatus} \033[0m"
  else
    echo -en "\033[32m ${TestStatus} \033[0m"
  fi

  #calculate the final status
  let Status_Sum=${Status_Sum}+${Status}+${MD5Status}

  ########################################################
  #If we have a integration test, break if one test failes
  if [ "${TestType}" = "integration" ] ; then
    if [ ${Status_Sum} -gt 0 ] ; then
      echo "integration test ${CountOut} of ${NumberOfTests} failed, break!" >> ${GIS_OPT_LOGFILE}
      EndMessage="\033[31m Break \033[0m"
      break;
    fi
  fi
  
  #increase the counter 
  Count=`expr $Count + 1`
  CountOut=`expr $CountOut + 1`
done

#########################
#cleanup the output files
CleanUp #=-FUNCTION-=#

###################
#write the logfiles     
CreateSumLogfileEntries #=-FUNCTION-=#

#revover the region
RecoverRegion #=-FUNCTION-=#

#small information for stdout
echo -e " ${EndMessage}"

echo " " >> ${GIS_OPT_LOGFILE}
echo "FINISHED" >> ${GIS_OPT_LOGFILE}
echo "********************************************************************" >> ${GIS_OPT_LOGFILE}
echo " " >> ${GIS_OPT_LOGFILE}

#delete the temp directory
rm -rf "$TMPDIR" >> ${GIS_OPT_LOGFILE} 2>&1 

#If one test failed, return 1
if [ ${Status_Sum} -eq 0 ]; then
  return 0
else
  return 1
fi
}


