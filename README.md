# 🚀 CI/CD Infrastructure with Jenkins, Nexus, and SonarQube (ARM-Optimized)

[![Vagrant](https://img.shields.io/badge/Vagrant-1563FF?style=flat&logo=vagrant&logoColor=white)](https://www.vagrantup.com/)  
[![VMware](https://img.shields.io/badge/VMware-607078?style=flat&logo=vmware&logoColor=white)](https://www.vmware.com/)  
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)](https://www.docker.com/)  
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=jenkins&logoColor=white)](https://www.jenkins.io/)  
[![SonarQube](https://img.shields.io/badge/SonarQube-4E9BCD?style=flat&logo=sonarqube&logoColor=white)](https://www.sonarsource.com/products/sonarqube/)  
[![Nexus](https://img.shields.io/badge/Nexus_Repository-000000?style=flat&logo=sonatype&logoColor=white)](https://www.sonatype.com/)  

---

## 🎯 Project Overview

This project provisions a **complete CI/CD infrastructure** using **Vagrant** and **VMware Desktop**, tailored for **ARM64 architecture** (Apple Silicon / ARM servers).  
It showcases how to set up a professional DevOps environment with **Jenkins** for automation, **Nexus OSS** for artifact management, and **SonarQube** for code quality analysis.

---

## 🏗️ Architecture Overview

The infrastructure consists of **three virtual machines**, each provisioned via Vagrant:

1. **Jenkins VM (Ubuntu 20.04)**  
   - Provides CI/CD pipelines.  
   - Automates builds, testing, and deployments.  
   - Accessible via web UI on the Jenkins VM private network.

2. **Nexus VM (CentOS Stream 9 + Docker)**  
   - Hosts **Sonatype Nexus OSS** for artifact and dependency management.  
   - Runs inside Docker to ensure **multi-architecture compatibility** (ARM64).  
   - Data is persisted in `/opt/sonatype-work`.  

3. **SonarQube VM (Ubuntu 20.04)**  
   - Provides static code analysis and quality gate integration.  
   - Complements Jenkins pipelines with quality reporting.  


