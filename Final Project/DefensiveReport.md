# Blue Team: Summary of Operations

## Table of Contents
- Network Topology
- Description of Targets
- Monitoring the Targets
- Patterns of Traffic & Behavior
- Suggestions for Going Further

### Network Topology

The following machines were identified on the network:
- Kali
  - **OS:** Kali Linux
  - **Purpose:** Penetration testing
  - **IP Address:** 192.168.1.90
- ELK
  - **OS:** Linux
  - **Purpose:** Monitoring logs and creating alerts
  - **IP Address:** 192.168.1.100
- Capstone
  - **OS:** Linux
  - **Purpose:** Testing logging and alerts
  - **IP Address:** 192.168.1.105
- Target 1
  - **OS:** Linux
  - **Purpose:** Apache web server
  - **IP Address:** 192.168.1.110

### Description of Targets

The target of this attack was: `Target 1` 192.168.1.110

Target 1 is an Apache web server and has SSH enabled, so ports 80 and 22 are possible ports of entry for attackers. As such, the following alerts have been implemented:

### Monitoring the Targets

Traffic to these services should be carefully monitored. To this end, we have implemented the alerts below:

#### Excessive HTTP Errors
Alert 1 is implemented as follows:
  - **Metric:**: Top 5 HTTP response codes
  - **Threshold:**: Above 400 for last 5 minutes
  - **Vulnerability Mitigated:**:Brute force
  - **Reliability:**: Medium. Good for detecting brute force attacks, but may cause false positives.

#### HTTP Request Size Monitor
Alert 2 is implemented as follows:
  - **Metric:** Total HTTP request bytes per minute
  - **Threshold:** 3500 bytes in 1 minute.
  - **Vulnerability Mitigated:** Denial of Service, Scanning
  - **Reliability:** Low Reliability. This alert has too low of a threshold, resulting in many false positives.

#### CPU Usage Monitor
Alert 3 is implemented as follows:
  - **Metric:** Average CPU percent used 
  - **Threshold:** Above 50% average CPU for last 5 minutes.
  - **Vulnerability Mitigated:** Malware, Denial of Service
  - **Reliability:** Medium. May cause false positives or not detect malware that is not using significant resources.
