# Guide for accessing VM on ICE cluster

## Key Requirements
1. Internet connection
2. GT account (same as BuzzPort and Passport)

## Download and install GlobalProtect Clientless VPN
**Please Note!!!** Cisco AnyConnect is being officially sunseted by Georgia Tech. You may still be able to use it for a while, but we strongly encourage everyone to move to GlobalProtect since that removes one variable when trying to debug infrastructure issues as well as enables us to ask for technical support from OIT in case we face issues. 

Please follow instructions given at [https://gatech.service-now.com/home?id=kb_article_view&sysparm_article=KB0026837](https://gatech.service-now.com/home?id=kb_article_view&sysparm_article=KB0026837) to set up GlobalProtect. Individual instructions for different OS can be found here: 

1. [Windows](https://gatech.service-now.com/home?id=kb_article_view&sysparm_article=KB0026742)
2. [MacOS](https://gatech.service-now.com/home?id=kb_article_view&sysparm_article=KB0026743)
3. [MacOS](https://gatech.service-now.com/home?id=kb_article_view&sysparm_article=KB0028027)

## Set up VNC and Environment on ICE Cluster

Before attempting the following steps, please ensure you are connected to campus VPN using GlobalProtect.

1. Log onto the COC ICE cluster. You can do so by using `ssh -X <your_gt_username>@coc-ice.pace.gatech.edu`

example: 
```
#Make sure you are connected to the VPN first!!

<yourlocalmachine>:~$ ssh gburdell@coc-ice.pace.gatech.edu

Warning: Permanently added the ECDSA host key for IP address '128.61.254.40' tothe list of known hosts.
gburdell@coc-ice.pace.gatech.edu's password:

This computer system is the property of Georgia Institute ofTechnology. Any user of this system must comply with all Instituteand Board of Regents policies, including the Acceptable UsePolicy (AUP), Data Privacy Policy (DPP) and Cyber SecurityPolicy (CSP), see http://b.gatech.edu/it-policies.  Users shouldhave no expectation of privacy, as any and all files on this systemmay be intercepted, monitored, copied, inspected, and/or disclosed toauthorized personnel in order to meet institute obligations.

By using this system, I acknowledge and consent to these terms.

############################################################# 
Welcome to GT College of Computing Instructional Cluster
#############################################################

If you require assistance with this system, please contact yourcourse instructor or teaching assistant (TA).
```

2. Set up your desktop environment by running this script. It will create links to the tools you need to use in the next few steps. 
```
[gburdell@login-coc-ice-1 ~]$/storage/home/hcocice1/shared-classes/materials/cs3220/class_scripts/setup_xilinx_ice_env.sh
```

3. Request a VNC job - this will launch a compute job on a node in the COC-ICE cluster and will give you a few cores and memory to run Vivado and other tools in a GUI session. Again, youmay want to refer to the ICE documents to understand how the scheduler is requesting and allocating resources for your job.

```
#This command requests a VNC job using the "long-running" queue and asks for onenode, 4 CPU cores, 30 GB of memory, and a runtime of 4 hours.
[gburdell@login-coc-ice-1 ~]$ pace-vnc-job -q coc-ice-long -lnodes=1:ppn=4,mem=30GB:walltime=4:00:00

Submitting job via qsub pace-vnc-job.pbs...
242776.sched-coc-ice.pace.gatech.edu

Job successfully submitted!
Waiting for job to start...

Starting vncserver...

Connect to your VNC server via the following steps:
   1) Press SHIFT + ~ then SHIFT + C to open an SSH console (The prompt 'ssh>'should appear on the next line)      
      ***Note: '~' MUST be the first character on the line to be recognized asthe escape character, in which case it will not appear on your terminal.***      
      ***If you see the '~' character when you start typing, delete it, hit'ENTER' and type 'SHIFT' + '~' + 'C' again.***   
   2) Type -L 5901:atl1-1-02-003-19-l:5901 and then ENTER   
   3) Connect your VNC Viewer client to localhost:1
```
*Note: You may find it useful to set up an alias for frequently used pace-vnc-job command in your .bashrc file since you will use this command a lot to start a vncserver*

4. The last few lines give you instructions to set up "SSH port forwarding". Briefly, this meansthat you are using SSH to forward the GUI connection from the remote cluster back to yourlocal machine. To do this, follow the instructions as shown:
```
#Enter SHIFT+~ then SHIFT+C on this empty command-line. If you've done thisright, you should get the ssh> line below
[gburdell@login-coc-ice-1 ~]$
ssh> -L 5901:atl1-1-02-003-19-l:5901
Forwarding port.
```
Keep this process running i.e. don't Ctrl+C out of it. 

5. Once the port is forwarded, you can use a VNC viewer to connect to the remote GUI desktop. We suggest using [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/) however you can use a VNC client of your choice if you're more comfortable with it. On your first connection, you will need to enter a 6 character password to be used on all future sessions. Don't forget to write this down!

P.S. Even if you do forget, you can quickly change the password by using `vncpasswd` command on the COC ICE terminal.

