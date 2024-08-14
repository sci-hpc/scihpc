# Partitions (queues)

We use partitions in SLURM to manage resources in the cluster.

We have the following partitions:

| Partition | MaxTime | DefaultTime | DefMemPerCPU | Max number of  Nodes |
|-|-|-|-|-|
| short     | 1 day   | 30 min      | 512 MB       | 1                    |
| long      | 1 week  | 30 min      | 512 MB       | 1                    |
| PARA      | 1 week  | 30 min      | 512 MB       | 4                    |

To display a straight-forward summary: available partitions, their job size, status, timelimit and node information with A/I/O/T (allocated, idle, other, and total):

```
sinfo -o "%.10P %.15s %.10a %.10l %.15F"
```

Numbers represent field length and should be used to properly accommodate the data.

See [About Scicluster](../../about-scicluster) chapter of the documentation if you need more information on the system architecture.
