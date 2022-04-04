## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/spodw/bootcamp-homework/blob/main/week-13/Images/project-1-diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, select portions of the `filebeat-playbook.yml` and `metricbeat-playbook.yml` files may be used to install only certain pieces of them, such as Filebeat.

  
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network. A load balancer helps ensure the availability of services and prevents servers from being exposed directly to the internet.

Using a jump box allows administrators to configure and manage multiple machines in the network at once. It serves as the single access point to the servers within the network. This keeps them isolated from the internet, and allows only individuals with access to the jump box to send them commands.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.
Filebeat collects system logs. Metricbeat collects system metrics. Kibana creates visual representations of the collected data to make it easier to understand.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
|JumpBoxProvisioner|Gateway|10.0.0.4|Ubuntu Server    |
| Web-01   |Web Server| 10.0.0.5   | Ubuntu Server    |
| Web-02   |Web Server| 10.0.0.6   | Ubuntu Server    |
| Web-03   |Web Server| 10.0.0.5   | Ubuntu Server    |
|ELK-server|Network Monitoring|10.3.0.4|Ubuntu Server |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
199.48.94.99

Machines within the network can only be accessed by the Jump Box.


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
|JumpBoxProvisioner| Yes          |   199.48.94.99       |
| Web-01   | No                  |   10.0.0.4           |
| Web-02   | No                  |   10.0.0.4           |
| Web-03   | No                  |   10.0.0.4           |
|ELK-server| Yes                  |10.0.0.4 199.48.94.99|
|RedTeamLB | Yes                  |   199.48.94.99       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves time and ensures that everything is configured consitently time after time.

The playbook implements the following tasks:
- Download and install Docker
- Download and install pip
- Download and install Docker python module
- Deploy and start ELK container, and configure to start on boot.
- Enable Docker to start on boot.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps](https://github.com/spodw/bootcamp-homework/blob/main/week-13/Images/ELK_docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name   |IP Address|
|--------|----------|
| Web-01 | 10.0.0.5 |
| Web-02 | 10.0.0.6 |
| Web-03 | 10.0.0.7 |


Filebeat and Metricbeat have been installed on these machines.
These Beats allow us to collect the following information from each machine:
- Filebeat collects and ships system logs. This information is used to monitor user activity and search for anomalies.
- Metricbeat collects and ships system metrics. This information is used to monitor system performance and processes.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the `ELK-playbook` file to `/etc/ansible`.
- Update the `hosts` file to include:
```bash
[elk]
10.3.0.4 ansible_python_interpreter=/usr/bin/python3
```
- Run the playbook, and navigate to http://[ELK-server-public-IP]/app/kibana in your workstation web browser to check that the installation worked as expected.
