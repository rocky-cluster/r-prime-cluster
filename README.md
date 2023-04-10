# r-prime-cluster
R Example Scripts for Cluster Submission


## Running the Prime Number example 
### Uploading the code
The simple way to see this code is to clone the github repository:

```
[[ -e ~/git ]]  || mkdir ~/git  # Auto-create git subdirectory
cd ~/git                        # switch to git subdirectory
[[ -e r-prime-cluster ]] || git clone git@github.com:rocky-cluster/r-prime-cluster.git
cd r-prime-cluster
```

Sanity check:
```
cat BLAH
```

### Submitting the script
```
sbatch R-prime.srun
```

### Looking at the results
Check the job queue, wait for job completion

```
squeue
```

Check log file:
```
ls -l R_prime_*.out

# just look at the latest output log
cat $( ls -t R_prime_*.out | head -n 1)
```

Check results file:
```
# Quick hash check verifying prime number sets are identical
md5sum $( ls -t R_prime_*.txt | head -n 3)
```
