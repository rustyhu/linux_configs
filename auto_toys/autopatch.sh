#!/bin/bash

## example
#pushd vm
#./patchinstall.sh
#<< eof
#yes
#eof
#popd

# fulfill list of patch names such as "B3326H03"
PLIST="B3326H03 B3326H26"

BASE='vm'
for i in ${PLIST} 
do
  # start debug
  #echo ${PNAME}.tar.gz
  # end debug
  PNAME=${BASE}${i}

  tar -xvf ${PNAME}.tar.gz
  pushd ${PNAME}
  ./patchinstall.sh
  popd
done


