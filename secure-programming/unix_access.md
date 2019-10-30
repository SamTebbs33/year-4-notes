# Access control

## Directories
Permission bits: listing files, adding/removing/renaming files and accessing files. Sticky bit set prevents renaming and removal of files.

## Symlinks
Symlinks can be created for any file, even if the user doesn't have permission to r/w/x that file. Permissions are evaluated when the OS resolves the symlink.

## Setuid
A file can be executed with the permissions of the owner rather than the executor. Facilitated by the real and effective use r IDs. Real ID is the ID of the user executing the process and the effective ID is the ID of the owener of the file.

When setuid == 0, real = effective. When setuid == 1, real = ID of user executing it and effective = ID of owner.

The saved ID is used for temporarily changing the ID used for operations. Stores the effective ID in saved ID, sets effective ID to real ID then changes effective ID to saved ID.

This is an extra attack surface and can make buggy code more dangerous.

The `setuid` function will permanently change the real, effective and saved ID to the executors ID. `seteuid` will set the  effective ID to the executor's ID.

## umask
Every process has umask attributes. Syscalls for file creation take a mode that defines the r/w/x perms. A umask can be set to forcefully prevent certain permission values. If umask == 022 and creation permissions == 777 the resulting permissions are 755.
