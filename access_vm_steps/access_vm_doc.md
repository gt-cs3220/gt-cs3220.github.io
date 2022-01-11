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

      ![Screen Shot 2022-01-10 at 10 40 39 PM](https://user-images.githubusercontent.com/57438552/148877498-efa0b4a4-402d-42ce-9dd1-578f863f293f.png)

      ![Screen Shot 2022-01-10 at 10 41 23 PM](https://user-images.githubusercontent.com/57438552/148877545-d677722a-eeda-4467-aaa7-62983daa2707.png)


6. Once you've entered the password, the GUI screen should start up. Note this may take a minute on your first connection. This is normal!
      ![Screen Shot 2022-01-10 at 10 45 45 PM](https://user-images.githubusercontent.com/57438552/148877897-10237578-88aa-4959-abb9-a031a4b979ee.png)


7. You might need to change the resolution for your VNC session to be higher or lower depending on how fast your connection is. You can do this by going to the middle tab at the top and click on properties. Then go to the "Options" tab and change the Picture Quality to **High** (better picture, slower) or **Low** (worse picture, faster)

      ![Screen Shot 2022-01-10 at 10 46 20 PM](https://user-images.githubusercontent.com/57438552/148877950-fcf90bb7-0800-4df5-bff6-7d420ce5d83c.png)
      ![Screen Shot 2022-01-10 at 10 47 00 PM](https://user-images.githubusercontent.com/57438552/148877990-88a318c6-b155-42ca-8a6b-9bdd4c6a9ef7.png)


8. Once you have gotten to the desktop, you can then clock on the icon to open the Vivado or Vitis tool. 
      ![Screen Shot 2022-01-10 at 10 47 34 PM](https://user-images.githubusercontent.com/57438552/148878051-e3cd9b7a-a9de-4769-8709-f58475bee33d.png)


9. When you are finished with your session, you can close the VNC window. As long as your  job is running the VNC session will stay running in the background. Once you are done, go back to your terminal and close the SSH port forwarding using `Ctrl+C`

      ```
      [gburdell@login-coc-ice-1 ~]$
      ssh> -L 5901:atl1-1-02-003-19-l:5901
      Forwarding port.
      #Use CTRL+C to exit the port forwarding
      ^C
      ```


