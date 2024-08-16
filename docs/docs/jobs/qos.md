# Quality of servisec (QOS)

We have defined three QOSs (quality of service) for better management: low, normal and high.

|   QOS  |      Max node per user      | Max wall time |
|--------|-----------------------------|---------------|
|   low  | 1 (this is the default QOS) |       7       |
| normal |              2              |       1       |
|  high  |              3              |       1       |

All members of the faculty of science have low, normal and high QOS which means they can use 
1 node for 7 days or 2 or 3 nodes for 1 day. For example in your batch script you can write one of the below options:

```bash
## for 3 nodes
#SBATCH --qos=high
#SBATCH --ntasks=80
#SBATCH -w compute-0-[0,2,3]
#SBATCH --time=1-00:00:00 # maximum time for "high" QOS is 1 day
```
```bash
## for 2 nodes (e.g. compute-0-0 and 0-3)
#SBATCH --qos=normal
#SBATCH --ntasks=56 ## 
#SBATCH -w compute-0-[0,3] 
#SBATCH --time=1-00:00:00 # maximum time for "normal" QOS is 1 day
```
```bash
## for 1 node (e.g. compute-0-1)
#SBATCH --qos=low ## this is default, so you can ignore it
#SBATCH --ntasks=16 ## 
#SBATCH -w compute-0-1
#SBATCH --time=7-00:00:00 # maximum time for "low" QOS is 7 days
```

!!! warning

    Please note that currently compute-0-1 has NOT equipped with 10 G adapter, so for distributed MPI parallel jobs, you can not use it.
