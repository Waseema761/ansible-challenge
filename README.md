# ansible-challenge
# DevOps CI Pipeline – Terraform + Ansible + Jenkins

## 📌 Project Overview
This project demonstrates a complete CI pipeline using **Jenkins**, **Terraform**, and **Ansible**.

The pipeline:
- Provisions AWS EC2 instances using Terraform
- Dynamically generates Ansible inventory
- Configures servers using Ansible roles
- Deploys and exposes Netdata monitoring

---

## 🛠️ Tools Used
- Jenkins
- Terraform
- Ansible
- AWS EC2
- GitHub

---

## 📂 Project Structure
.
├── Jenkinsfile
├── terraform
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── inventory.tpl
├── ansible
│ ├── site.yml
│ └── roles
│ ├── common
│ ├── backend
│ └── frontend


---

## 🔁 CI Pipeline Flow
1. Jenkins pulls code from GitHub
2. Terraform initializes and applies infrastructure
3. EC2 instances are created
4. Inventory file is generated automatically
5. Ansible configures servers using roles
6. Netdata is installed and exposed on port `19999`

---

## 📊 Access Netdata


http://<backend_public_ip>:19999


---

## 🔐 Jenkins Credentials Used
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- SSH private key for EC2 access

---

## ✅ Result
- Fully automated infrastructure provisioning
- Configuration management with Ansible
- Real-time monitoring using Netdata
