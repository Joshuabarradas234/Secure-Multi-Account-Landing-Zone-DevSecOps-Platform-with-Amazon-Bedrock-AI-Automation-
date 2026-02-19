# Decision-making process (ADRs) + tool selection rationale

This repo uses **Architecture Decision Records (ADRs)** to document *why* key architecture choices were made.
Each ADR answers three recruiter-friendly questions:

1. **Which alternatives were considered?**
2. **Why was this choice selected?** (security / operability / cost / delivery speed)
3. **How were trade-offs balanced?** (performance vs cost vs security)

---
md
## 1) Decision workflow used (repeatable method)

```mermaid
flowchart TD
A["Define goal & scope"] --> B["Capture constraints"]
B --> C["Generate 2-3 viable options"]
C --> D["Score options against criteria"]
D --> E["Select option & record trade-offs"]
E --> F["Implement smallest working slice"]
F --> G["Collect evidence (screenshots and logs)"]
G --> H["Document as ADR and link evidence"]

```md
## 2) Decision criteria used (what “good” looked like)

For each major decision, options were scored against these criteria:

- **Security:** least privilege, strong defaults, auditability, encryption, policy-as-code support
- **Operability:** centralized visibility, alerting, easy incident triage, low manual work
- **Cost:** predictable pricing, ability to start small, avoid “always-on” components where possible
- **Delivery speed:** can be implemented quickly with IaC + managed services
- **Scalability:** multi-account readiness, handles growth without redesign
- **Compliance/Audit:** evidence generation (logs/findings), traceability from decision → control → proof

## 3) Tool selection rationale (why these AWS services)

### Landing zone + account structure
**Chosen:** AWS Organizations + a multi-account landing zone approach
**Why:** separation of duties, blast-radius reduction, consistent guardrails, scalable governance
**Alternatives considered:** single-account design, ad-hoc multiple accounts without standard guardrails
**Trade-offs:** higher setup complexity, but much better security and scale.

### Central logging and audit
**Chosen:** centralized CloudTrail / CloudWatch Logs approach (plus security services feeding findings)
**Why:** single place to investigate incidents, long-term retention, audit-ready
**Alternatives considered:** per-account logs only, manual export
**Trade-offs:** more upfront wiring, but investigations become faster and repeatable.

### Threat detection and posture management
**Chosen:** Security Hub + GuardDuty as the core “detect + aggregate” layer
**Why:** managed detections, standardized findings, cross-account visibility
**Alternatives considered:** custom detection only, log-only monitoring without findings
**Trade-offs:** tuning required to reduce noise; payoff is faster triage and clearer reporting.

### AI automation layer (Bedrock)
**Chosen:** Amazon Bedrock for controlled “assistant-style” automation
**Why:** managed foundation models, ability to keep responses grounded to runbooks/policy, scalable integration
**Alternatives considered:** building a custom LLM stack, ungoverned chatbot approach
**Trade-offs:** must design prompts/guardrails carefully; benefit is speed + consistency.

## 4) Evidence plan (what screenshots prove the build)

Each major capability should have 1 screenshot to prove it exists and is configured correctly:

1. **Multi-account governance:** AWS Organizations / account list (redact IDs)
2. **Central logging:** CloudTrail or log group showing delivery/retention (redact)
3. **Security posture:** Security Hub summary dashboard
4. **Threat detection:** GuardDuty findings page (example finding)
5. **Access governance:** IAM Identity Center (users/groups or permission set list)
6. **Automation:** Bedrock / automation entry point (or repo workflow that triggers analysis)
7. **CI/CD proof:** GitHub Actions run (success + artifacts/logs)
8. **IaC proof:** Terraform plan/apply output (redacted)

> Store screenshots under: `docs/evidence/`
> Naming convention: `evidence-<area>-<yyyymmdd>.png`
