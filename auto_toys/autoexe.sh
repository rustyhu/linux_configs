#!/bin/bash

# install or update
ACTION="install"
PACKAGES="bm"

extract()
{
  # packages: VMPS, VM(patch), DM, MS
  BASE="DM MS VMPS"
  VERSION="3329"
  for i in ${BASE}
  do
    # start debug
    #echo ${i}*3328.tar.gz
    # end debug
  
    tar -xvf ${i}*${VERSION}.tar.gz
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

prepare
#extract
execute
