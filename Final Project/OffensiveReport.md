# Red Team: Summary of Operations

## Table of Contents
- Exposed Services
- Critical Vulnerabilities
- Exploitation

### Exposed Services

Nmap scan results reveal the below services and OS details:

```bash
$ nmap -sV 192.168.1.110
```
port scan img()[]

This scan identifies the services below as potential points of entry:
- Target 1 
  - Port 22 - SSH
  - Port 80 - HTTP
  - Port 111 - PRCbind
  - Port 139 & 445 - Samba

The following vulnerabilities were identified on the target:
- Target 1
  - **Password for SSH/Weak Password Policy** - SSH keys are not utilized. The weak passwords are easily cracked, allowing SSH access to the server.
  - **Vulnerable & Outdated Components** - The services running on the server, including Apache, Wordpress, and Samba are outdated and highly vulnerable.
  - **Security Misconfiguration** - The main config file ‘wp-config.php’ has not been properly secured. Attackers familiar with WordPress will look for the credentials hidden in this file. Also vulnerable to ‘wpscan’.
  - **Broken Access Control** - Python can be run as root using ‘sudo’ by user steven. This allows for privelege escalation.

vuln scan img()[]

### Exploitation

The Red Team was able to penetrate `Target 1` and retrieve the following confidential data:
- Target 1
  - `flag1.txt`: fc3fd58dcdad9ab23faca6e9a36e581c
    - **Exploit Used**
      - Password for SSH/Weak Password Policy
      - Guessed weak password for user michael. After successful SSH authentication, discovered flag in the `/var/www/html directory.`
img()[]
  - `flag2.txt`: b9bbcb33e11b80be759c4e844862482d
    - **Exploit Used**
      - Password for SSH/Weak Password Policy
      - Also found after achieving SSH authentication using the credentials for michael. Located in the `/var/www` directory.
img()[]
  - `flag3.txt`: afc01ab56b50591e7dccf93122770cd2, `flag4.txt`: 715dea6c055b9fe3337544932f2941ce
    - **Exploit Used**
      - Security Misconfiguration
      - Located the main WordPress config file in `/var/www/html/wordpress/wp-config.php` then used `cat` to view the MySQL credentials. Flags 3 and 4 were found within the SQL database.
img()[]