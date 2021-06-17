# Elk Stack Deployment


# A Description of The Deployment

The diagram depict how the virtual machines are connected into the Elk server within the ansible container after the Elk server is being deployed. The diagram shown below:  
![Project1_Diagram](https://user-images.githubusercontent.com/77870466/122309043-92bdbd00-cedb-11eb-96ee-e81d9eee9202.jpg)

These files have been tested and deploy the Elk server through Linux and Azure. Some portions of the playbook file may be used to install only certain pieces, such as Filebeat. The files are provided in the Ansible folder. 

Playbook1: pentest.yml: this configure the web VM(s) with docker. 
* Installs Docker 
* Installs Python 
* Installs Docker's Python Module 
* Downloads and Launches the DVWA Docker container 
* Enables the Docker service. 

Playbook2: install-elk.yml: This is self-expanatory which install the Elk server with docker. 
* Installs Docker 
* Installs Python 
* Installs Docker's Python Module 
* Downlloads and lacunhes the DVWA docker container 
* Enalbes the Docker service 

Playbook3: filebeat-playbook.yml: installing and launching filebeat. This yml file can deploy Filebeat on each of the web servers so they can be monitored centrally using ELK services running on HolyElk-VM. 
* Downloads and installs Filebeat 
* Enables and configures the system module 
* Configures and launches Filebeat 

After successfully configuring the ELK instances, it will show on the "docker ps" list: 

![fast_n_furious](https://user-images.githubusercontent.com/77870466/122321810-7a0cd180-cef2-11eb-862a-293700d74d83.jpg)


# Tables specifying access policies and network addresses

Integrating an Elk server allows users to easily monitor vulnerable VMs for changes to the configuration and system files. 
* Filebeat is used to monitor logs/files. 
* Metricbeat is used to collect operating system and service statistics from VMs.

| Name    | Function   | IP Address | Operating System 
| ------------- |:-------------:| :-------:| :-------: | 
| Jump-Box-Prov| Gateway | 10.0.0.4| Linux 
| Web-1      | DVWA      | 10.0.0.5| Linux 
| Web-2 | DVWA      | 10.0.0.6 |Linux
| HolyElk-VM |ELK| 10.1.0.4| Linux

## Access Policies 

The machines on the network are not exposed to the public. Only the Jump Box machine can accept the SSH connection from the Internet. Accessible through the following IP addresses: 
* 52.226.66.105

Any machines are accesible through Jump Box, including Elk VM called HolyElk-VM. Jump Boc can access the HolyElk-VM using SSH (Jump box's internal/private IP is 10.0.0.4). 

Summary of Access Policies: 

| Name    | Publicly Accessible | Allowed IP Addresses | Allowed Ports
| ------------- |:-------------:| :-------:| :-------: | 
| Jump-Box-Prov| Yes (SSH)| 52.226.66.105| 22 
| Web-1      | Yes (HTTP) | 52.226.66.105| 80 
| Web-2 | Yes (HTTP)| 52.226.66.105| 80
| HolyElk-VM | Yes (HTTP)| 52.226.66.105 |5601


# Usage Instruction 

## Filebeat/Metricbeat 
Filebeat allow us to collect and ships logs from VMs running the filebeat. Metricbeat collects and ships system metrics from the operating system and services of VMS running the metric beat. The targeted machines are Web-1 and Web-2. 

## How to use Playbooks 
In order to use the playbook, you need to have Ansible container to be configured. First copy the playbook files to Ansible Docker Container and then update the ansible hosts file /etc/ansible/hosts to include: 

[webservers]
#alpha.example.org
#beta.example.org
#192.168.1.100
#192.168.1.110
10.0.0.5 ansible_python_interpreter=/usr/bin/python3
10.0.0.6 ansible_python_interpreter=/usr/bin/python3

[elk]
# List the IP address of your ELK server
# There should only be one IP address
10.1.0.4 ansible_python_interpreter=/usr/bin/python3

Make sure to update the Ansible config file /etc/ansible/ansible.cfg and set the remote_user parameter to webservers's admin user. 


## Running the Playbooks: After the creating the playbooks, you may acces to Kibana. 
1. Start an ssh session with the Jump Box ~$ ssh sysadmin@<Jump Box Public IP>
2. Start the Ansible Docker container ~$ sudo docker start <Ansible Container>
3. Attach a shell to the Ansible Docker container with the command ~$ sudo docker attach <Ansible Container Name>
4. Run the playbooks with the following commands:
* ansible-playbook /etc/ansible/pentest.yml
* ansible-playbook /etc/ansible/install-elk.yml
* ansible-playbook /etc/ansible/roles/filebeat-playbook.yml
 
Note that the Playbook 2 - install_elk.yml configures only the server(s) listed as [elkservers] in /etc/ansible/hosts.

Similarly Playbook 3 - filebeat-playbook.yml configures the servers listed as [webservers] in /etc/ansible/hosts

After running the playbooks and observing no errors in the output, navigate to Kibana to check that the installation worked as expected by viewing Filebeat and Metricbeat data and reports in the Kibana Dashboard. fi

Kibana can be accessed at http://<elk-server-ip>:5601/app/kibana

