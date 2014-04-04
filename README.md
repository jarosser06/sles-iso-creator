SLES Custom ISO Builder
=======================

Builds a custom iso for vmware template building b/c I am super lazy :).


Download the SLES CDROM and rename it to sles.iso then:

```bash
vagrant ssh
sudo su
./iso/build_iso.sh
```

Vagrant
-------

Why does this require vagrant to work?  Using Vagrant to build the iso
ensures a consistent environment to run the appropriate steps.  Also I
run Fedora as my primary desktop sooo there is that too.
