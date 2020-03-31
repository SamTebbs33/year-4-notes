# Wireless networks
With wired networks you know where the wires are (big assumption) and tapping wires requires significant effort and is detectable. "Tempest" attacks (detecting radiation from cabling) is almost impossible due to shielded cables.

With wireless networks, you get none of the protection with wired networks. Unlikely to be limited to your site and certainly not limited if the attacker is using a high-gain antenna. A wire only carries one client's worth of data, whereas a wireless network carries much more so the benefits of interception are much more.

## Problems
* Access control: don't want attackers on the network to be able to send and receive traffic as if they are end-stations (routers?) themselves.
* Integrity: don't want the packets to be modified.
* Confidentiality: don't want traffic contents to be sniffed/read by unauthorised parties.

## WEP (Wired Equivalent Privacy)
Intended to make wireless networks about as secure as wired networks.

Everyone has a shared key (40, then later 104 bits) and a 24 bit init vector is generated, giving 64 (later 128) bits of key material. Used to encrypt packets using the RC4 algorithm. All stations with the key can see the contents of packets.

WEP is broken, attacker can attempt to obtain a key or can attempt to obtain an evolved key stream. Init vectors are hard to generate on embedded devices.

RC4 uses a key and an initialisation vector to generate a evolved keystream of bytes, which are XOR’d with the message to form cipher text. Means that you have two possible attacks: recovering the key, or recovering the evolved keystream.

## WPA
Emergency fix to WEP adding sequence numbers, better key mixing andi integriy checks. Could run on the same hardware as WEP only requiring a firmware/software fix. Still weak.

## WPA2
Works well.

Initial secret (either PSK or result of per-user login) used to generate a transient key used just for one session (~1 hour). Underlying encryption is AES128. Used correctly, can be accredited to IL4 CONFIDENTIAL in old money,  possibly even low end of SECRET under new system (higher would require AES192). Needs new hardware. You probably can’t see other people’s traffic (special extra key for broad/multicast traffic). Attacker who can monitor network long-term can break PSK. Key management complex, risky and difficult to do correctly: using WPA2 for more than access control probably not for the casual user.

**See lecture slides for "wireless" lecture for more WPA2 details**.

## Objectives
* Authentication: Unauthorised people shouldn't be able to use the network. There is no promise of confidentiality or integrity. Cafe networks etc. need this.
