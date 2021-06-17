# Elk Stack Deployment
Before you read this file, I made a typo on the name of this repository. It should be cybersecurity not "cybcersecurity." Alright, that's all I have to say. 

# A description of the deployment

The diagram depict how the virtual machines are connected into the Elk server within the ansible container after the Elk server is being deployed. The diagram shown below:  
![Project1_Diagram](https://user-images.githubusercontent.com/77870466/122309043-92bdbd00-cedb-11eb-96ee-e81d9eee9202.jpg)

These files have been tested and deploy the Elk server through Linux and Azure. Some portions of the playbook file may be used to install only certain pieces, such as Filebeat. The files are provided in the Ansible folder. 

Playbook1: pentest.yml: this configure the web VM(s) with docker. 

Playbook2: install-elk.yml: This is self-expanatory which install the Elk server with docker. 

Playbook3: filebeat-playbook.yml: installing and launching filebeat 

# Usage Instructions. 
