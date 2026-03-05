#!/bin/bash
# 1. Update and prevent interactive prompts
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y

# 2. Install Java (Jenkins requirement)
sudo apt-get install -y openjdk-11-jdk-headless

# 3. Add Jenkins Repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# 4. Install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 5. Install Terraform (AMD64 version)
sudo apt-get install -y unzip
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_amd64.zip
unzip 'terraform*.zip'
sudo mv terraform /usr/local/bin/
rm terraform*.zip # Cleanup