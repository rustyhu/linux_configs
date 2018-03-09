#!/bin/bash

# install or update
ACTION="install"
PACKAGES="dm bm ms vm"     # packages: VMPS, DM, MS
VERSION="3329"

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
    pushd ${i}8500_Uniview
    if [ "${i}" == "bm" ] && [ "${ACTION}" == "install" ]
    then
      ./${ACTION}${i}.sh << eof

eof
    else
      ./${i}${ACTION}.sh << eof
yes
eof
    fi
    popd

    # seperate
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
  if [ "${ACTION}" == "install" ]
  then
    SUFFIX="uninstall.sh"
  else
    # update: stop services
    SUFFIX="server.sh"
  fi

  CMDS=${PACKAGES}${SUFFIX}

  for i in ${CMDS}
  do
    ##if this cmd exists
    if [ -n "$(type ${i} 2>/dev/null)" ]
    then
      if [ "${ACTION}" == "install" ]; then
        ${CMDS}
      else
        ${CMDS} stop
      fi
    fi
  done

}

extract
#prepare
#execute
