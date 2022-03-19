## Week 9 Homework
  
#### Mission 1
`nslookup -type=mx starwars.com`
  
starwars.com	mail exchanger = 1 aspmx.l.google.com.  
starwars.com	mail exchanger = 10 aspmx2.googlemail.com.  
starwars.com	mail exchanger = 5 alt1.aspx.l.google.com.  
starwars.com	mail exchanger = 10 aspmx3.googlemail.com.  
starwars.com	mail exchanger = 5 alt2.aspmx.l.google.com.  
  
- DNS record type: `MX`
- Resistance is not receiving emails because the DNS records for the primary and secondary mail servers
are not updated to the new addresses.
  
Corrected DNS record:  

starwars.com    mail exchanger = 1 asltx.l.google.com.  
starwars.com    mail exchanger = 5 asltx.2.google.com.  

####Mission 2
`nslookup -type=txt theforce.net`  
  
spf:  
v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:104.156.250.80 ip4:45.63.15.159 ip4:45.63.4.215  

- DNS record type: `TXT`
- The emails  are being filtered out because the Resistance's DNS records have not been updated
with the new IP address of the mail server for `theforce.net`.
  
Corrected DNS record:  
  
v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:45.23.176.21  
  
#### Mission 3
  
CNAME record of www.theforce.net:  
www.theforce.net	canonical name = theforce.net  
  
- DNS record type: `CNAME`
- `resistance.theforce.net` is not redirecting to `theforce.net` because it does not have a correct
CNAME record.
  
Corrected DNS record:  
  
resistance.theforce.net        canonical name = theforce.net  
  
#### Mission 4
  
- DNS rocord type: `NS`
- I would fix this issue by adding the backup server to the `NS` record.  
  
Corrected DNS record:  
  
princessleia.site	nameserver = ns2.galaxybackup.com.  
  
#### Mission 5
  
Shortest Path from Batuu to Jedha:  
  
Batuu, D, C, E, F, J, I, L, Q, T, V, Jedha  
  
#### Mission 6
  
Discovered IP and MAC addresses:  
172.16.0.1  
172.16.0.1  
00:0f:66:e3:e4:01  
  
#### Mission 7
  

