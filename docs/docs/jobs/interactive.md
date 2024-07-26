# Interactive job

## Starting an interacitve job

You can run an interactive job like this:

```bash
srun -p short --nodes=1 --ntasks-per-node=1 --time=01:00:00 --pty bash -i
```

Here we ask for a single core on one interactive node for one hour with the
default amount of memory in the short partition. The command prompt will appear as soon as
the job starts. You can add other options same as when you prepare a bath script like ``--mem``, ``-p``, ``-w`` and etc.

Exit the bash shell to end the job. If you exceed the time or memory
limits the job will also abort.

Interactive jobs have the same policies as normal batch jobs, there
are no extra restrictions. You should be aware that you might be
sharing the node with other users, so play nice.

## Keeping interactive jobs alive

Interactive jobs die when you disconnect from the frontend node either by choice or by
internet connection problems.

To ease running an interacitve job, we define a command wich you can find its help as ``interacitve -h``.
As an example do:

```bash
interactive -c1 -w compute-0-0 -p short
```

## X11 enabled interactive job

As our current slurm ``srun`` command does not forward X11 automatically, you can use ``srun.x11`` command for those interactive jobs which need to forward X11. For example:

```bash
srun.x11 -p short --nodes=1 --ntasks-per-node=1 --time=01:00:00 --mem=1GB
```

To test run the simple ``xclock`` program in the terminal session provided to you.

Like the ``sun`` command, you can use slurm option according to your needs. Please note for proper forwarding of X11 to your local computer, you had to log in to the login node with ``-Y -X`` arguments. See [login](../login.md) for more info.