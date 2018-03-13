#!/bin/bash

######################################################################
# WARNING:
# This auto script install or update VM and surrounding servers with
# ALL DEFAULT INSTALL OPTIONS! You only need to do manual configures
# when install VM.
#
# by h02929
######################################################################

# install or update
ACTION="install"
PACKAGES="vm dm bm ms"    # packages: VMPS, DM, MS, TMS
VERSION="3329"
DICT_NAME="8500_Uniview"  # 8500, 9500

extract()
{
  BASE=""
  for i in ${PACKAGES}
  do
    case "$i" in
      "vm" ) BASE="VMPS";;
      "dm" ) BASE="DM";;
      "bm" ) BASE="DM";;
      "ms" ) BASE="MS";;
      "tms" ) BASE="TMS";;
      * )
        echo "Invalid package name!"
        exit 1
        ;;
    esac

    # start debug
    #echo ${BASE}*3328.tar.gz
    # end debug

    # if DM package was already extracted, omit it
    [ "$BASE" == "DM" ] && [ -d "./dm8500_Uniview" ] && continue

    echo "Extract ${BASE} package. It may cost some time and please wait..."
    tar -xf ${BASE}*${VERSION}.tar.gz
    echo "Finish extracting ${BASE} package."
  done
}

execute()
{
  # vm,bm,dm,ms update
  for i in ${PACKAGES}
  do
    if [ "${ACTION}" == "install" ] && [ "${i}" == "bm" ]; then
      CMD=${ACTION}${i}.sh
    else
      CMD=${i}${ACTION}.sh
    fi

    pushd ${i}${DICT_NAME}
    if [ "${ACTION}" == "install" ] && [ "${i}" == "vm" ]; then
      # vminstall need to do manual config
      ./${CMD}
    else
      # update, at each prompts input enter to use default
      ./${CMD} << eof

eof
    fi
    popd

    # show status message
    for j in {1..10}
    do
      echo
    done
    echo "${i} ${ACTION} finished!" 

  done
}

prepare()
{
  # uninstall or such things
  for i in ${PACKAGES}
  do
    if [ "${ACTION}" == "install" ]
    then
      SUFFIX="uninstall.sh"
    else
      # update: stop services
      SUFFIX="server.sh"
    fi

    CMD=${i}${SUFFIX}
    ##if this cmd exists
    if [ -n "$(type ${CMD} 2>/dev/null)" ]
    then
      if [ "${ACTION}" == "install" ]; then
        # uninstall
        ${CMD} << eof
yes
eof
      else
        ${CMD} stop
      fi
    fi
  done
}

#prepare
extract
execute
