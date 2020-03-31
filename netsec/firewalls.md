# Firewalls

## Where
* On routers
* On dedicated firewall routers with a bigger software load
* On computers acting as routers
* On computers looking after themselves
* On computers acting dedicated as firewalls

## What
* Keep unwanted and unusual packets away from the OS and apps
* Limit which machines can send packets

What they can't do
* Detect malware and malicious packets
* Detect misuse of legitimate protocols
* Stop attackers from crafting packets themselves (?)
* Anything an OS can't

## Why
* Take some decisions out of a computer's hands and enforce policy
* Rate limiting
* They use OSs with smaller attack surfaces

## How
* Looks at packet headers, especially the destination and source IP
* Optionally update some state
* Reject or pass the packet
* Connection tracking allow a firewall to count the number of outstanding connection requests that have not been acknowledged to help prevent DOS attacks. This can also help prevent attacks where an attacker forges the source address to make the victim destination server send TCP packets to another victim. See lecture notes and/or video for 03/02/20 for background on this.
