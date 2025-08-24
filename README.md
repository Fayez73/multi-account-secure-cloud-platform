# Multi-Account Secure Cloud Platform 🚀

This project demonstrates how to build a **production-ready, secure, multi-account AWS cloud platform** using **Terraform** and a **Jenkins CI/CD pipeline** with integrated **security scanning** (Checkov & Tfsec). (Dummy data used)  

It is designed to showcas skills in:  
- **Terraform**  
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
multi-account-secure-cloud-platform/
├─ README.md
├─ jenkins/
│  ├─ Jenkinsfile
│  └─ shared-library/
├─ modules/                     # New top-level folder for reusable modules
│  ├─ bootstrap-state/           # S3 + DynamoDB TF state
│  ├─ org/
│  ├─ scp/
│  ├─ logging/
│  ├─ baseline/
│  ├─ network-core/
│  ├─ tgw/
│  └─ eks/
└─ envs/                        # Environment overlays
   ├─ dev/
   └─ prod/


