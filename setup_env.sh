#!/bin/bash

ISO_ALTNAME=sles.iso

if [ -z $ISO_URL ]; then
  echo "You must set the iso url env variable"
  return 1
fi

if [ -z $ISO_NAME ]; then
  ISO_NAME=SLES-11-SP3-DVD-x86_64-GM-DVD1.iso
fi

if [ -z $ISO_MD5SUM ]; then
  ISO_MD5SUM=480b70d50cbb538382dc2b9325221e1b
fi

if [ ! -f ${ISO_NAME} ]
then
  echo "Image not found beginning download"
  wget ${ISO_URL}/${ISO_NAME}
  DL_MD5SUM=`md5sum $ISO_NAME | awk '{print $1}'`
  if [ $DL_MD5SUM != $ISO_MD5SUM ]
  then
    echo "Bad checksum"
    return 1
  fi
  ln -s $ISO_NAME $ISO_ALTNAME
fi

vagrant up
