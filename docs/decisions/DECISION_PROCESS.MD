# Decision-making process (ADRs) + tool selection rationale

This project uses **Architecture Decision Records (ADRs)** to document *why* key choices were made.
Each ADR answers three recruiter-relevant questions:

1) **Which alternatives were considered?**  
2) **Why this choice was selected?** (security / operability / cost / delivery speed)  
3) **How trade-offs were balanced?** (performance vs cost vs security)

---

## 1) Decision workflow used (repeatable method)

```mermaid
flowchart TD
  A[Define goal + scope] --> B[Capture constraints]
  B --> C[Generate 2–3 viable options]
  C --> D[Score against criteria]
  D --> E[Select option + record trade-offs]
  E --> F[Implement smallest working slice]
  F --> G[Collect evidence (screenshots/logs)]
  G --> H[Document as ADR + link evidence]
