# Logging
Log everything! Even the stuff that may seem uninteresting at the moment. It could help with investigations later on. Storage is cheap so that's no reason not to log.

# Patching
Vulnerabilities are found all the time so regular patching of machines is essential. If company policies make this process hard then fix the policies.

Code can rely on bugs and could break when patches are applied. Patch often to spot what causes breakage.

# Service minisation
Minimise the number of services each machines runs. Limits the attack surface.

In this context, services are pieces of software accessible (accepting bytes, either authenticated or not) to a use not logged in.

Every services has known or unknown vulnerabilities.

## Options in order of preference
1. Don't install the services.
2. Don't run the services.
3. Run the service but only available locally.
4. Run but protect from the network.
	* Place firewall in front of the service.
5. Run available to the world.

## Finding services
`nmap` is a port mapper, but only recognises services that respond with some known protocol, so it won't map syslog as syslog doesn't send a response when recceiving a packet.

`netstat -a` is a "what's listening" tool.

`lsof` and `psfiles` shows what ports a process is listening on.

`
## Isolation
Processes runnong on a machine can "see" each other, so an attacker who compromises one service can attempt to gain control of other services. Eventually they may be able to escalate to root via a chain of progessively more powerful vulnerabilities.

An option is to only have one service running on a "machine" (OS instance), then an attacker who controls one service just controls that service and there's nothing else of value on the machine. The attack isn't prevented but mitigates its consequences and avoids escalation.

### Virtualisation
Covers a wide range of techniques for running guest OSs or things that look like OSs, inside a host OS. Unprivileged instructions run on bare metal and privileged instructions are trapped and emulated.

#### Type 1 hypervisors
Host runs a hypervisor which does nothing but manage guest operating systems. You can't run anything in the host and it's normally protected from the outside world. The guest OS is a normal OS image and unmodified, and think they are running on the hardware. Offers facilities for redundancy, load balancing migration etc.

With minot exceptions, the guest does its own networking with virtualised networking hardware.

#### Type 2 hypervisors
Full-fat OS on the host, which then supports a hypervisor that runs guest OSs. The guests can appear in a GUI window. Guest OS networking goes through the host OS.

Attractive target for attackers as compromising the host can lead to compromisation of all guests.

#### "Real" virtualisation
Guest and host are completely disjoint. A common scenario is running Windows as a guest on a Linux host. Resource allocation and scheduling can be complex.

Doesn't require modified OSs, ideal for running legacy OSs on modern hardware, it's probably the only realistic choice for running Windows on multi-tenant platforms. Some configurations allow you to hide legacy networking code behind the modern stack but security properties of this are hard to evaluate.

Usually has extensive support for relocation of OS installations.

#### Paravirtualisation
OS is slightly modified so that it uses tailored drivers which exist only as stubs in the guest OS. There is a lot of reliance on the host's memory subsystem. More efficient but requires OS-vendor support. The hypervisor has more visibility of the guest.

#### Containers
See notes for lecture 4

#### chroot
See notes for lecture 4


