# Isolation Capabilities in Linux

Let's explore the following isolation capabilities available to us in linux one by one.

## CHROOT

Download the attached rootfs file system:

```
cd /vagrant
wget https://github.com/faraazkhan/icf-docker/releases/download/0.1/rootfs.tar.gz
```

Untar the archive

```
sudo tar -zxf rootfs.tar.gz
ls rootfs
```

Now create a chroot

```
sudo chroot rootfs /bin/bash
ls /
which python
```

Mount /proc

```
mount -t proc proc /proc
```

Notice you have root access to any process running outside the chroot

## Namespaces with unshare

Let's create our chroot inside of a PID namespace created using unshare

```
sudo unshare -p -f --mount-proc=$PWD/rootfs/proc \
    chroot rootfs /bin/bash
ps aux
```

Namespaces are composable (run below command outside the namespace)

```
ps aux | grep /bin/bash | grep root
```

Notice the pid of the bash process, if 24682, we can join this namespace using:

```
cd /vagrant
sudo nsenter --pid=/proc/24682/ns/pid unshare -f --mount-proc=$PWD/rootfs/proc chroot rootfs /bin/bash
```
