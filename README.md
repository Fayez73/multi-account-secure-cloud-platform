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


## 🛠️ Get Started

```bash
git clone https://github.com/Fayez73/multi-account-secure-cloud-platform.git
cd multi-account-secure-cloud-platform

Jenkins Setup & Pipeline

## Jenkins Setup & Pipeline

This project includes **Jenkins pipelines** to automate Terraform deployments with security and compliance checks.

---

### Step 1: Install Jenkins
- Follow the official guide: [Jenkins Installation](https://www.jenkins.io/doc/book/installing/)  
- Ensure Jenkins has the **Pipeline plugin** installed  

---

### Step 2: Configure Global Shared Library
1. Navigate to: **Manage Jenkins → Configure System → Global Pipeline Libraries**  
2. Add a new library with the following settings:  
   - **Name:** `shared-library`  
   - **Default version:** branch or tag (e.g., `main`)  
   - **Retrieval method:** Modern SCM  
   - **SCM:** Git → Repository URL of `jenkins/shared-library`  

---

### Step 3: Create a New Pipeline Job
1. Create a **Pipeline Job** in Jenkins  
2. Set the **Pipeline Definition** to: `Pipeline script from SCM`  
3. Configure SCM: Git → repository URL of your repo  
4. Set **Script Path:** `jenkins/Jenkinsfile`  

---

### Step 4: Environment Variables (Optional)
- Configure AWS credentials via **Jenkins Credentials**  
- Reference them in your pipeline like this:

```groovy
withAWS(role: 'arn:aws:iam::<account-id>:role/terraform', credentials: 'aws-jenkins-creds') {
    terraformPipeline(env: 'dev')
}
