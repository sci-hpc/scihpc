# BHAC

[BHAC](https://bhac.science/) (the Black Hole Accretion Code) is a multidimensional general relativistic magnetohydrodynamics code based on the [MPI-AMRVAC](https://amrvac.org/) framework. BHAC solves the equations of ideal general relativistic magnetohydrodynamics in one, two or three dimensions on arbitrary stationary space-times, using an efficient block based approach.

## Installation

```bash
mkdir codes
cd codes
git clone https://gitlab.itp.uni-frankfurt.de/BHAC-release/bhac.git

echo 'export BHAC_DIR=$HOME/codes/bhac' >> ~/.bashrc
echo 'PATH="$BHAC_DIR:$BHAC_DIR/tools:./:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Making the code

```bash
mkdir /work8/$USER/bhac_runs
cd /work8/$USER/bhac_runs
cp -r $BHAC_DIR/tests/rmhd/shockTube ./
cd shockTube
ml OpenMPI/4.1.2-GCC-11.2.0
$BHAC_DIR/setup.pl -d=13 -phi=3 -z=2 -g=12 -p=rmhd -eos=gamma -nf=0 -arch=gfortran10 -coord=cart
make
```


## Run a quick test

```bash
salloc -p para -n 4 --ntasks-per-core=1 -w compute-0-0 --time=01:00:00
cd /work8/$USER/bhac_runs/
cd shockTube
mkdir output
ml OpenMPI/4.1.2-GCC-11.2.0
mpirun -n 4 ./bhac -i amrvac1D.par >output/out
```
