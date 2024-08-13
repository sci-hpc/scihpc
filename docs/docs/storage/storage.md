# Storage


Available file system
---------------------

Scicluster currently has four special storage file systems:

* Network shared (NFS) home area:            ``/home``        (RAID 1, ~ 620 GB, NAS aware SATA3 disks)
* Network shared (NFS) work8 area:           ``/work8`` (8 TB SATA3 data center special disk)
* Network shared (NFS) fortitude8 area:      ``/fortitude8`` (8 TB SATA3 data center special disk)
* Network shared (NFS) gratitude8 area:      ``/gratitude8`` (8 TB SATA3 data center special disk)
* Local scratch area on each node:           ``/state/partition1``  (soft linked to ``/scratch1``) (1.2 TB SAS disks)

Home area
---------

This file system is for user home directories on Scicluster. It is not on a seperate hard disk, so please do not use it for big files at all. ``/home/username`` is accessible from both the frontend and all the compute
nodes. If you need more space, consider using ``/work8`` (see below).

The home area is for *permanent* storage only, so please **do not** use it for
temporary storage during production runs at all. Your quota space is ~ 4.5 GB. Your quota file number is 12000 files. All jobs using the home area for output while running, may be killed without any warning.

/Work8 area
------------------

This file system could be used for writing the output of MPI parallel jobs that run on more than one node.
It could also be used for saving your date that are written on local scratch (see below) spaces in each node.
The current quotas for each user on ``/work8`` are: 375 GB soft limit and 380 GB hard limit. The quota file number is 45000 files.

/fortitude8 area
------------------
Same as the ``work8`` disk but you need to contact us for assigning quota.

/gratitude8 area
------------------
Same as the /fortitude8.

Scratch areas
------------------

* In addition, each compute node has a scratch area of 1.2 TB, only locally accessible on each node. This is the area which should be used for serial jobs or parallel jobs that run on just one node. The space is currently accessible as
  ``/state/partition1`` or ``/scratch1`` on each compute node. Scratch spaces are **high speed** and consist of SAS 10k and 15k disks. Please note that there is no quota limit but all data will be **removed** automatically after **two weeks**.

Quota
--------------

Your quota is shown below the welcome message each one you login to the frontend. You can also see your quota amount by running:

```bash
quota -vs
```

As it is mentioned above, the current quota in Scicluster is:

| File System         | Quota  | File limit  |
|---------------------|--------|-------------|
| /home               | 4.5 GB | 12000       |
| /work8 (/dev/sdc1)  | 450 GB | 45000       |
| /fortitude8 (/dev/sdd1)  | contact us | -       |
| /gratitude8 (/dev/sde1)  | contact us | -       |

