# Using Slurm and Open OnDemand

The Synestia virtual machine (VM) and Pynq board cluster currently contains the following nodes:

- 16 VMs with GUI and command-line access to Vivado tools
  - Each VM should have 4 vCPUs and 12 GB of DRAM
  - If you need more RAM, ICE may be a better option for larger simulations
  - Slurm scheduled
- 64 Pynq Z2 FPGA boards
  - Each board has 2 CPU cores, an FPGA, and 8 GB of DRAM
  - Slurm scheduled

We use the [Slurm scheduler](https://slurm.schedmd.com/overview.html) to provide access to the VMs and Pynq boards, and we have recently added [Open OnDemand](https://openondemand.org/), which provides web support for running Slurm jobs, terminal access, and Jupyter notebooks.


## Using Open OnDemand (OOD)

With Open OnDemand, you can request a command-line terminal, a VNC GUI session, or a notebook running on the VM or on the Pynq boards.

### Logging in to OOD

You need to first be connected to the [Georgia Tech VPN using GlobalProtect](https://docs.pace.gatech.edu/gettingStarted/vpn/) and then open a web browser and go to `synestia-ood.cc.gatech.edu`. You will need to use your GT username and password to log in, and you will be asked to use Duo 2FA if you have that enabled for your account.

Once you have logged in, you should see this screen with options for both the Pynq board cluster and for the Synestia VMs `(Synth and Emu)`.


<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/figures/pynq_cluster_synestia_ood.png"  width="600" height="400">

### VNC GUI Session with OOD

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/figures/synestia_ood_vnc_desktop.png"  width="600" height="400">

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/figures/synestia_ood_vnc_desktop_2.png"  width="600" height="400">

### Jupyter Notebook with OOD

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/figures/synestia_ood_nb_1.png"  width="600" height="400">

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/figures/synestia_ood_nb_2.png"  width="400" height="300">

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/figures/synestia_ood_nb3.png"  width="600" height="400">




## To access a command-line terminal on Synestia VMs with Slurm

You need to first be connected to the [Georgia Tech VPN using GlobalProtect](https://docs.pace.gatech.edu/gettingStarted/vpn/), and then open a terminal or VSCode session. 

1) SSH to the main login node `synestia2.cc.gatech.edu` with your GT username and password.
     - NOTE: Do not run any Vivado commands on this node! Admins will have the power to kill any jobs that are not scheduling jobs.
3) Request a new interactive job on a specific node using `salloc`. Note that you shouldn't need to use other commands like srun.

```
## Get a node allocation for one node, with two CPU cores, for one hour
$ salloc -p synestia  --nodes=1 --ntasks-per-node=2 --time=01:00:00
salloc: Granted job allocation 4063
gburdell@synestia1:~$

## Use squeue to see your job and how long it has run
gburdell@synestia2:~$ squeue
        JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
        4063  synestia interact  gburdell  R       0:08      1 synestia1
```

When you are finished, you can type `exit` which will relinquish your job:

```
gburdell@synestia1:~$ exit      
exit
salloc: Relinquishing job allocation 4063
salloc: Job allocation 4063 has been revoked.
```

Alternatively, if you job does not finish correctly, you may need to cancel your job allocation. You can do this by using `squeue` to get your jobID and `scancel` to cancel your allocation.

```
//Print out information about your job state
gburdell@synestia2:~$ squeue
PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)                                                                                       
              4150  synestia interact  gburdell  R       1:32      1 synestia4
//Cancel your job once done
gburdell@synestia2:~$ scancel 4150
salloc: Job allocation 4150 has been revoked.
```


## To access Pynq boards with slurm 





[step 1] Allocate pynq board resources through [slurm workload manager](https://slurm.schedmd.com/quickstart.html). Make sure you're connected to Georgia Tech network or through the GT VPN.
```
[local]$ ssh [your GT account username]@synestia2.cc.gatech.edu
[synestia2]$ . /net/cs3220_share/student_scripts/init_student_vivado_env.sh
[synestia2]$ run-jupyter-pynq.sh
```
Running the scripts will allocate a 1-hour job on one of the available pynq boards. When prompted for password please enter the password for your GT account. 


[step 2] If the job launch was successful, you should see instructions like this:
```
Submitting job via sbatch lab1.sbatch...
Submitted batch job 1386

Job successfully submitted!
Waiting for job to start...

The authenticity of host 'pynq-z2-35 (130.207.113.112)' can't be established.
ECDSA key fingerprint is SHA256:KQwfmg8xjzp90Ro9Owk/nE4LaAJ4zIvn9+sd28k9Ydg.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'pynq-z2-35,130.207.113.112' (ECDSA) to the list of known hosts.
jtong45@pynq-z2-35's password: 
Starting jupyter notebook...

Connect to your jupyter notebook via the following steps:
   1) Press SHIFT + ~ then SHIFT + C to open an SSH console (The prompt 'ssh>' should appear on the next line)
      ***Note: '~' MUST be the first character on the line to be recognized as the escape character, in which case it will not appear on your terminal.***
      ***If you see the '~' character when you start typing, delete it, hit 'ENTER' and type 'SHIFT' + '~' + 'C' again.***
   2) Type -L :pynq-z2-35: and then ENTER
   3) Connect your browser to http://localhost:/
```


The above message shows the ip address of the PYNQ board, which is '130.207.113.112', then copy '130.207.113.112' into the URL in the browser and open PYNQ notebook, the notebook password is ```xilinx```.

You could also follow the prompted instructions and start your jupyter notebook. The SSH console commands may not work for VS Code terminals. The notebook password is ```xilinx```.

Other useful instructions:
- ```sinfo``` checks the status of pynq board resources and show whether they are down, allocated or idle(available)
- ```squeue``` shows information about current submitted jobs
- ```scancel [job id]``` terminate a current job. Get your job id by ```squeue```
- ```slurm-jupyter-notebook -p pynq-cluster -N 1 --job-name lab2 --time=[Required time, e.g. 90:00]``` allow you to specify a longer job time
- adding ```-w [board name, e.g. pynq-z2-30]``` to the above command allow you to specify the board you want to access. When using this option please first make sure the board is shown ```idle``` with ```sinfo```

Common platform issues (WIP):
- When running ```run-jupyter-pynq.sh``` terminal prints ```ssh: Could not resolve hostname ps aux | awk "match(\\$0,/jupyter.*port=([0-9]*)/,a) {print a[1]; exit}": Device or resource busy``` and doesn't assign board; root cause unclear, could be racing condition when multiple users trying to access resource. Increase sleep time or rebooting might help. Temporal solution: try again or specify another pynq board with the ```-w``` option.
- When loading overlay in the first notebook block it prints TimeoutError ```[Errno 110] Connection timed out```; boards that give timeout need rebooting. Resolving the issue with test script improvement (WIP). Temporal solution: try again or specify another pynq board with the ```-w``` option.
### References:

* [CRNCH references for using Slurm on other Rogues Gallery resources](https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm-examples.html)
* [PACE's guide to using Slurm on the Phoenix cluster (available on ICE in Fall 2023)](https://docs.pace.gatech.edu/training/img/Phoenix%20Slurm%20Orientation%20v5.pdf)
* [PACE's documentation for using Open OnDemand (available on ICE in Fall 2023)](https://docs.pace.gatech.edu/ood/guide/)

#### Deeper Dive

This is more for your information and not a requirement!
* [YouTube - Introduction to Slurm (Part 3)](https://youtu.be/MI9jHavOt5o) - short videos from the official Slurm playlist if you'd like to dig deeper on how to use Slurm. 
* [YouTube - Introduction to Slurm (Part 4)](https://youtu.be/aljhVYwyAoM) - short videos from the official Slurm playlist if you'd like to dig deeper on how to use Slurm.  

### Q&A
If the ODD doesn't work for you, you could also try 
```
ssh -Y <gtid>@synestia2.cc.gatech.edu
vitis_hls
```
Then the GUI could also show up, (tested on Ubuntu OS).
