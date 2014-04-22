SLES Custom ISO Builder
=======================

Builds a custom iso for vmware template building b/c I am super lazy :).

To use the setup_env.sh script you must have the environment variable ISO_URL set:

```bash
export ISO_URL=http://sles.mycompany.com/sles
./setup_env.sh
```

The setup_env script will attempt to run vagrant up as well so be sure you have vagrant
installed.

Download the SLES CDROM and rename it to sles.iso then:

```bash
vagrant ssh
sudo su
./iso/build_iso.sh
```

Vagrant
-------

Why does this require vagrant to work?  Using Vagrant to build the iso
ensures a consistent environment to run the appropriate steps.
