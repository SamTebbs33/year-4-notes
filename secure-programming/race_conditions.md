# Race conditions
Anomolous behaviour due to the unexpected critical depedence on the relative timing of events.

Can occur through malicious behaviour or unfortunate timing.


## Time of check to time of use
There may be some time in between checking for access to something and using that something. This is the "time of check to time of use" (TOCTOU). If accessing files, the file checked could be modified or have its permissions changed in between the check and use, giving a process access to a file it should't have acces to.

Victim code
```c
if (!access("filename", WRITE)) exit(1);
int fd = open("filename", WRITE);
write(fd, buff, sizeof(buff));
```

Malicious code
```
symlink("/etc/passwd", "filename");
```

If the malicious code is scheduled in between the victim code's access check and open, then /etc/passwd will be written to.

This kind of attack is difficult as timings can't be controlled or guaranteed. It can be made more likely by slowing the CPU down with heavy processes and running many copies of the malicious code at once.

### Mitigations

* Accidentally writing to files that you shouldn't be able to can be mitigated by checking access, opening, then checking for access again.
* Using unpredictable file names is a good idea, although this is less effective if the attacker sees the source code or is good at reverse engineering.
* Using atomic operations is a good mitigation, i.e don't check access and open separately, do both with the open syscall.

## Locks
Locks are cool.
