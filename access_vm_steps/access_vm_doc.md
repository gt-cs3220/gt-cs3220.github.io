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
