## Part 0 : Open jupyter notebook on pynq board cluster

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
Submitted batch job 82

Job successfully submitted!
Waiting for job to start...

Starting jupyter notebook...

Connect to your jupyter notebook via the following steps:
   1) Press SHIFT + ~ then SHIFT + C to open an SSH console (The prompt 'ssh>' should appear on the next line)
      ***Note: '~' MUST be the first character on the line to be recognized as the escape character, in which case it will not appear on your terminal.***
      ***If you see the '~' character when you start typing, delete it, hit 'ENTER' and type 'SHIFT' + '~' + 'C' again.***
   2) Type -L 51001:pynq-z2-1:51001 and then ENTER
   3) Connect your browser to http://localhost:51001/?token=8dc6a1794a5f3d36d7ac733caab6f7d91a9d9c1137f9cbd2
```
Follow the prompted instructions and start your jupyter notebook. The SSH console commands may not work for VS Code terminals. The notebook password is ```xilinx```.

Other useful instructions:
- ```sinfo``` checks the status of pynq board resources and show whether they are down, allocated or idle(available)
- ```squeue``` shows information about current submitted jobs
- ```scancel [job id]``` terminate a current job. Get your job id by ```squeue```
- ```slurm-jupyter-notebook -p pynq-cluster -N 1 --job-name lab2 --time=[Required time, e.g. 90:00]``` allow you to specify a longer job time
- adding ```-w [board name, e.g. pynq-z2-30]``` to the above command allow you to specify the board you want to access. When using this option please first make sure the board is shown ```idle``` with ```sinfo```

Common platform issues (WIP):
- When running ```run-jupyter-pynq.sh``` terminal prints ```ssh: Could not resolve hostname ps aux | awk "match(\\$0,/jupyter.*port=([0-9]*)/,a) {print a[1]; exit}": Device or resource busy``` and doesn't assign board; root cause unclear, could be racing condition when multiple users trying to access resource. Increase sleep time or rebooting might help. Temporal solution: try again or specify another pynq board with the ```-w``` option.
- When loading overlay in the first notebook block it prints TimeoutError ```[Errno 110] Connection timed out```; boards that give timeout need rebooting. Resolving the issue with test script improvement (WIP). Temporal solution: try again or specify another pynq board with the ```-w``` option.



Useful github links: 

PYNQ repo : https://github.com/Xilinx/PYNQ


