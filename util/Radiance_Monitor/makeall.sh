#! /bin/ksh

#------------------------------------------------------------------
#  makeall
#
#  This scripts makes all of the executables in the nwprod, 
#  data_extract and image_gen subdirectories and places the 
#  executables into the proper exec directories.
#
#  An optional argument to this script is "clean".  Use this if 
#  you wish to remove *.o, *.mod, and *.x files in the various src 
#  directories.  If "clean" is not used, "all" is assumed.
#------------------------------------------------------------------
set -ax

mode=${1:-}
top_level=${PWD}
echo "top_level = ${top_level}"

machine=`./get_hostname.pl`
echo "machine = $machine"

#------------------------------
#  source RadMon_config
#------------------------------
#. ${top_level}/parm/radmon.ver
. ${top_level}/parm/RadMon_config


if [[ ${machine} = "theia" || ${machine} = "wcoss" ]]; then
   echo Building executables on ${machine}
   echo

   #------------------------------------------------------------------
   #  make data extract executables
   #------------------------------------------------------------------

   if [[ ${machine} = "wcoss" ]]; then
      echo loading RadMonBuild module for wcoss
#      . /usrx/local/Modules/default/init/ksh

      module use -a ${HOMEradmon}/modulefiles/wcoss
      module load RadMonBuild

   fi

   executables="angle bcoef bcor time"
   echo "Making executables in nwprod/radmon_shared.v${radmon_shared_ver}/sorc:"
   for var in ${executables}; do
      if [[ $var = "angle" ]]; then
         cd ${top_level}/nwprod/radmon_shared.v${radmon_shared_ver}/sorc/verf_radang.fd
      else
         cd ${top_level}/nwprod/radmon_shared.v${radmon_shared_ver}/sorc/verf_rad${var}.fd
      fi

      make ${mode}
      if [[ $mode = "" ]]; then 
         make install
      fi

      echo

   done

   cd ${top_level}/data_extract/sorc/make_base.fd
   make ${mode}  
   if [[ $mode = "" ]]; then 
      make install
   fi

   cd ${top_level}/data_extract/sorc/validate_time.fd
   make ${mode}  
   if [[ $mode = "" ]]; then 
      make install
   fi


   #------------------------------------------------------------------
   #  make image generation executables
   #------------------------------------------------------------------
   executables="horiz summary time bcoef angle"

   cd ${top_level}/image_gen/src
   echo "Making image_gen/src:"
   for var in ${executables}; do

      make -f makefile.${var} ${mode}
      if [[ $mode = "" ]]; then 
         make -f makefile.${var} install
      fi
      echo
   done

   if [[ ${machine} = "wcoss" ]]; then
      module unload RadMonBuild
   fi

else
   echo ${machine} is not supported 
fi

exit

