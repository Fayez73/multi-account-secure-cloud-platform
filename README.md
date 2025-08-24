# Multi-Account Secure Cloud Platform 🚀

This project demonstrates how to build a **production-ready, secure, multi-account AWS cloud platform** using **Terraform** and a **Jenkins CI/CD pipeline** with integrated **security scanning** (Checkov & Tfsec).  

It is designed to showcase skills in:  
- Infrastructure as Code (IaC) with **Terraform**  
- **Multi-account AWS architecture** (Networking, Security, Compute, Observability)  
- **Enterprise-grade CI/CD pipelines** with Jenkins Shared Libraries  
- **Security-first automation** using **Checkov** and **Tfsec**  
- Cloud governance, compliance, and developer enablement  

---

## ✨ Features
- **Multi-Account AWS Setup**
  - Centralized logging & monitoring
  - Shared networking (Transit Gateway)
  - Secure VPC per account
  - Guardrails with IAM, CloudTrail, Config
- **Kubernetes (EKS) Platform**
  - Secure workloads
  - GitOps-ready foundation
- **Observability**
  - CloudWatch, GuardDuty, Prometheus/Grafana (optional add-ons)
- **Security & Governance**
  - Enforced tagging
  - Encrypted storage, secrets, logs
  - Compliance via **Checkov + Tfsec**
- **CI/CD via Jenkins**
  - Terraform init/validate/plan/apply
  - Security scanning before changes
  - Manual approval before `apply`
  - Slack/MS Teams notifications (optional)

---

## 🛠️ Tech Stack
- **AWS** → Multi-Account Landing Zone, VPC, TGW, EKS, CloudTrail, IAM  
- **Terraform** → IaC for reproducible, auditable infra  
- **Jenkins** → CI/CD orchestrator with Shared Libraries  
- **Checkov** → Policy-as-Code security & compliance scanning  
- **Tfsec** → Lightweight Terraform security checks  
- **GitOps-ready** → Modular design for scaling  

---

## 📂 Project Structure
```bash
multi-account-secure-cloud/
├── Jenkinsfile
├── shared-libraries/         # Jenkins shared libraries
│   └── vars/
│       ├── terraform.groovy
│       └── notifySlack.groovy
├── infra/
│   ├── backend.hcl           # Remote state backend config
│   ├── main.tf               # Root Terraform
│   ├── variables.tf
│   ├── outputs.tf
│   ├── accounts/
│   │   ├── networking.tf
│   │   ├── security.tf
│   │   ├── compute.tf
│   │   └── monitoring.tf
│   └── modules/
│       ├── vpc/
│       ├── eks/
│       ├── transit-gateway/
│       └── cloudtrail/
└── README.md
