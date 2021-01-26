# Guide to accessing the assigned VM

## Key Requirements
1. Internet connection
2. GT account (same as BuzzPort and Passport)

## Download and install the Cisco AnyConnect GT VPN package
Please read  [https://faq.oit.gatech.edu/content/how-do-i-get-started-campus-vpn](https://faq.oit.gatech.edu/content/how-do-i-get-started-campus-vpn) on how to download the VPN and set it up for your OS.

![VPN_start_screen](/access_vm_steps/images/vpn1.PNG "VPN_start_screen")

Some tips:
* Use ```gatech-2fa-Duo``` as the group
* The Username is your GT Username eg: jdoe3
* The Password is your GT Account Password (the same one you use to access Canvas)
* The **Second** Password is your 2FA code (usually given by Duo Mobile)
    * *Note: You can input* **```push```** *as the **second password** and Duo will send you a verification push to **your phone**.* 


![VPN_config_screen](/access_vm_steps/images/vpn2.PNG "VPN_config_screen")

## Download and install the x2go **client** for your operating system
Please access [https://wiki.x2go.org/doku.php/download:start](https://wiki.x2go.org/doku.php/download:start) to get the client for your OS

![x2go](/access_vm_steps/images/x2go_client.PNG "x2go")

**IMP Note for macOS users**: You need to also download XQuartz as it is a required dependency [https://www.xquartz.org/](https://www.xquartz.org/)

**Test out your VPN connection, once established that it’s set up and working you may proceed. From this point on, anytime you are accessing the remote system, you need to be on the GT VPN**

## Create a new connection/session in x2go with the following details
Host : [your assigned host] eg: ```synestia1.cc.gatech.edu```

Login : [your GT username] eg: ```jdoe3```

SSH port : 22

Session Type : **XFCE** 

**Do not select “Experimental”**

All other fields should be left blank

Your configuration should look similar to this:

![x2go_config](/access_vm_steps/images/x2go_config.PNG "x2go config")

After clicking Ok, you can double click on the session icon to start up the session. (see image)

![x2go_connect](/access_vm_steps/images/x2go_connect.PNG "x2go connection")

**Click Yes to trust the host key**

![verification](/access_vm_steps/images/verification_picture.PNG "host verification")

When it asks you for a password enter your GT account password (same as the one you use to login into Canvas)

**If you see a dialogue box asking you for display preference, choose “default”**

![x2go_panel](/access_vm_steps/images/default_config_pic.PNG "x2go default panel")

After a few seconds, a new window should open which gives you your Linux GUI desktop. If you wish to resize, drag the bottom right corner to your desired size. **X2go is slightly laggy when resizing so please don’t make drastic changes**.

![vm_desktop](/access_vm_steps/images/vm_desktop.PNG "vm_desktop")

## Running Vivado 2020.2

**Double click (or right click + execute) on the Vivado desktop icon**.

![vm_dekstop_2](/access_vm_steps/images/vm_desktop_2.PNG "vm_desktop_2")

## Exiting your session

**Under no circumstances whatsoever should you shut-down/reboot the VM. That task is only to be performed by admin. Please remember, these VMs are shared.**

**If the VM is not responding or something else has gone amiss, contact the TAs and make a post on Piazza**

To properly terminate your session, please follow these steps:

**In x2go click on the power icon (it should give a hint that says "Terminate")**

![terminate_1](/access_vm_steps/images/terminate_1_edit.jpg "terminate_1")

**Click Yes**

![terminate_2](/access_vm_steps/images/terminate_2.PNG "terminate_2")

**To re-login, just enter your password again**

![relogin](/access_vm_steps/images/relogin.PNG "relogin")


# FAQ

## I cannot access the VM

**Possibility : Are you using the GT VPN?**

**Explanation : The VMs are not public facing. You cannot access them without either using the VPN or being on campus.**

**Remedy : Please ensure you use the VPN.**

## I cannot access the VM even after using the VPN

**Possibility : Did you try many unsuccessful login attempts? These VMs are hosted by Georgia Tech TSO**.

**Explanation : TSO runs a utility called ```fail2ban``` on their systems where if a user tries too many unsuccessful attempts, then they would be banned by the system for a short amount of time. This is done to protect systems.**

**Remedy : Please wait for some time and try again. If the issue persists, contact TAs for further guidance/steps**

## The VM is really slow/laggy to the point I cannot use it

**Possibility : It could be your RTT/ping to the VM**.

**Explanation : Even though the admin team is trying its best, being physically very far away from the server (eg: other country) or using a low bandwidth connection does lead to some issues.**

**Remedy : Please run ```ping <your assigned VM>``` from your command line and notify the TAs with the output. As an absolute worst case fallback, please install Xilinx WebPack locally on your machine.**