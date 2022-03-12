Week 8 Homework

Phase 1
- Ran `fping -g <CIDR block>` on each of the IP ranges on the server list.
- Discovered that 167.172.144.11 is alive. No other IPs at the Hollywood office are accepting connections
- This is a vulnerability because RockStar does not want any servers responding to requests.
- Reccomend disabling ping (ICMP echo request) on server at 167.172.144.11.
- This information is found at Layer 3, the Network Layer.

Phase 2
- Ran `sudo nmap -sS 167.172.144.11`
- Results:

Not shown: 989 filtered ports  
PORT     STATE  SERVICE  
22/tcp   open   ssh  
25/tcp   closed smtp  
80/tcp   closed http  
110/tcp  closed pop3  
256/tcp  closed fw1-secureremote  
554/tcp  closed rtsp  
1025/tcp closed NFS-or-IIS  
1723/tcp closed pptp  
3306/tcp closed mysql  
3389/tcp closed ms-wbt-server  
8080/tcp closed http-proxy  

- Discovered Port 22 is open.
- This is a vulnerability because with port 22 (SSH) open, anoyone can attempt to make a connection which creates an attack vector.
- Recommend configuring firewall to filter port 22 so that untrusted connections cannot be established.
- Information is found at Layer 4, the Transport Layer.

Phase 3

- Since port 22 was discovered to be open, and that port is associated with SSH, I attempted to start an SSH session
to the IP that responded in phase 1 using RockStar's default credentials. The login was succesful.
- Checked the `/etct/hosts` file, and found that the domain name 'rollingstone.com' is configured to point to the IP address 98.137.246.8
- Performed `nslookup` on this IP using another machine to find out the non-spoofed domain name and discovered that 98.137.246.8 = unknown.yahoo.com
- This is suspicious and shows that a hacker probably used DNS spoofing to send users who attempt to make a connection to 'rollingstone.com'
to a malicious website.
- Recommend removing the entry for 'rollingstone.com'
- Information was found in Layer 3, the Network Layer.

Phase 4

- On the RockStar server, I located the file `/etc/packetcaptureinfo.txt` which pointed me to a google drive link to a packet capture file.
- I analyzed the file `secretlogs.pcapng` with Wireshark, and found that there was some suspicious activity.
- First, there is evidence of ARP Poisoning, since two separate MAC Adresses were provided in response to a single ARP request.
- Second, I found an HTML form submission in an HTTP packet from what appears to be a hacker who claims to be an insider at RockStar Corp
comminicating to Blues Corp that port 22 was left open on the RockStar network.
- I recommend using access lists on routers to allow only specific MAC addresses to connect to the network,
as well enabling Dynamic ARP Inspection to prevent MITM attacks.
- The evidence for ARP poisoning was discovered in layer 2, the Data Link Layer. The hacker sent communications using the HTTP protocol,
and that evidence was found at Layer 7, the Application layer. The packet capture was done at Layer 3, Network Layer.
