# secure-aws-landing-zone-devsecops

## Overview

This project establishes a secure, enterprise-grade AWS cloud foundation using a multi-account structure, zero-trust networking, centralized logging, and a fully automated DevSecOps pipeline. It integrates with Azure Entra ID for federated SSO, enforces least privilege and encryption everywhere, and demonstrates automated threat detection, response, and compliance.

**What sets this project apart:**  
It leverages Amazon Bedrock to add AI-powered automation—summarizing security findings, generating incident reports, and enabling natural language Q&A on runbooks and security best practices. This makes the platform not only secure by default, but also intelligent and future-ready.



## Key Features

- **Multi-Account Structure:** Management, Security, and Workloads accounts via AWS Organizations & Control Tower.
- **Federated SSO:** Azure Entra ID integration with IAM Identity Center.
- **Zero Trust Networking:** Private subnets, VPC endpoints, Network Firewall, WAF.
- **Centralized Logging:** Org-wide CloudTrail, AWS Config, S3 with KMS and Object Lock.
- **Security Operations:** Security Hub, GuardDuty, Inspector, Macie, Security Lake, auto-remediation.
- **DevSecOps Pipeline:** Terraform IaC, security scanning, policy as code, automated reporting.
- **Demo Workload:** API Gateway → Lambda → DynamoDB, fully secured.
- **AI Automation (Amazon Bedrock):** Summarize security findings, generate incident reports, and answer natural language queries on runbooks.
- **Compliance & Governance:** SCPs, Config rules, CIS/FSBP mapping, runbooks, and dashboards.

## Evidence (portfolio)
- Architecture diagram: docs/diagrams/architecture.jpg
- ADRs: docs/decisions/
- Runbooks: docs/runbooks/
- Evidence (screenshots/logs): docs/evidence/ (to be added)

## Architecture Diagram

![Architecture](./architecture.jpg)


---
## Project status
✅ Architecture + documentation complete  
🟨 IaC scaffolding in progress  
⬜ Full deployment optional (not required for portfolio review)

*You can now use this as your README intro and architecture description. Next, you can create a visual diagram based on the text above, or I can help you generate a diagram in draw.io or another tool if you want a visual template.*
