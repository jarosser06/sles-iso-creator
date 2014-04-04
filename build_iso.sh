#!/bin/bash

VAGRANT_HOME=/home/vagrant
NEW_ISO_NAME=SLES11-SP3-custom-x86_64-`date +%F`.iso
BOOT_FILES="isolinux.cfg message"

apt-get update
apt-get install -y mkisofs

echo "Mounting iso"
mkdir -p /mnt/iso
mount -o loop /home/vagrant/iso/sles.iso /mnt/iso

echo "Copying original iso"
mkdir -p /opt/serveriso
cp -rT /mnt/iso /opt/serveriso
#chmod -R 777 /opt/serveriso/

echo "Modifying original"
pushd /opt/serveriso

# Add automation files
cp ${VAGRANT_HOME}/iso/iso_files/autoinst.xml /opt/serveriso/
for file in $BOOT_FILES; do
  cp ${VAGRANT_HOME}/iso/iso_files/${file} /opt/serveriso/boot/x86_64/loader/${file}
done

mkisofs -R -o ${VAGRANT_HOME}/iso/${NEW_ISO_NAME} -b boot/x86_64/loader/isolinux.bin \
-c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table .
echo "New iso ${NEW_ISO_NAME} created"

echo "Cleaning up"
rm -rf /opt/serveriso
umount /mnt/iso
