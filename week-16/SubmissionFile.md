## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- **Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:**  
Karl Fitzgerald
- **How can this information be helpful to an attacker:**  
Identifying the CEO can be useful to an attacker for searching for more information on them to design a social engineering
attack, or linking them to other people or organizations that may serve as an entrypoint.

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  **1. Where is the company located:**  
Sunnyvale, CA  
  **2. What is the NetRange IP address:**  
65.61.137.64/26  
  **3. What is the company they use to store their infrastructure:**  
Rackspace Backbone Engineering  
  **4. What is the IP address of the DNS server:**  
23.211.61.64  

#### Step 3: Shodan

- **What open ports and running services did Shodan find:**
**Open Ports:** 53  
**Services:** TCP and UDP  

#### Step 4: Recon-ng 

- Install the Recon module `xssed`.
- Set the source to `demo.testfire.net`.
- Run the module.

Is Altoro Mutual vulnerable to XSS:  
Yes, Altoro Mutual is vulnerable to XSS.

### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:

- **Command for Zenmap to run a service scan against the Metasploitable machine:**  
nmap -A 192.168.0.10
- **Bonus command to output results into a new text file named `zenmapscan.txt`:**  
nmap -A -oN zenmapscan.txt 192.168.0.10
- **Zenmap vulnerability script command:**  
nmap --script ftp-vsftpd-backdoor 192.168.0.10
- **Once you have identified this vulnerability, answer the following questions for your client:**  
  **1. What is the vulnerability:**  
The vulnerability is a backdoor in vsftpd that was added to the download file by a malicious actor. It allows an attacker to open a remote shell with root priveleges on port 6200. I also found that an outdated, vulnerable version of samba (3.0.20) is running on ports 139/445 which leaves the system potentially open to other exploits that allow remote command execution.  
  **2. Why is it dangerous:**  
It is dangerous because it allows remote code execution as root.  
  **3. What mitigation strategies can you recommendations for the client to protect their server:**  
The recommended mitigation strategy is to upgrade to a newer, patched version of vsftpd and samba.  
---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
