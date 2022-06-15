### Part 1
1. Based on the signatures, it appears that the attacker was performing an account lockout denial of service attack.
- Global mitigations: Disable account lockout. Only allow access to the server from trusted IPs.
- User mitigations: Require Require multi factor authentication to access the server.

2. I would reccommend the same mitigations listed above in order to protect against account lockout DoS attacks.

### Part 2
1. Firewall rule: Block incoming traffic where the source IP is from Ukraine.  
![](https://raw.githubusercontent.com/spodw/bootcamp-homework/main/week-19/img/top10countries.png)

2. Firewall rules:
  - Create whitelist that only allows IP addresses of people who need to log in to the VSI webserver.
