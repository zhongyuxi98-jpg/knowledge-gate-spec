# Knowledge Gate — Architecture Overview

> Status: Draft v0.1 · Authoritative diagram of how layers, gateways, plugins, and data flow.
> Source of truth: this document. Lovable projects render from these contracts.

---

## 1. Three-Layer Power Structure

Knowledge Gate is governed by three independent layers. No layer can unilaterally override the others; changes that touch more than one layer require an ADR.

```mermaid
flowchart TB
  subgraph PROTOCOL["Protocol Layer — Adjudication"]
    P1["Charter & ADRs"]
    P2["Governance Council"]
    P3["Dispute Resolution"]
  end

  subgraph EQUITY["Education Equity Layer — Content & Reputation"]
    E1["Lesson Plans"]
    E2["Contributor Reputation"]
    E3["Quality Review"]
  end

  subgraph COMMERCE["Commercial Sustainability Layer — Expansion & Funding"]
    C1["Partnerships"]
    C2["Grants & Sponsorship"]
    C3["Founder's Personal Businesses (separate)"]
  end

  PROTOCOL --"sets rules"--> EQUITY
  PROTOCOL --"sets rules"--> COMMERCE
  EQUITY --"reports outcomes"--> PROTOCOL
  COMMERCE --"reports funding"--> PROTOCOL
  COMMERCE -. "arms-length" .-> EQUITY
```

See `/00-charter/governance.md` for the formal definitions.

---

## 2. Runtime Topology (Gateways + Plugins + Data)

The ecosystem is organized as a small set of **Gateways** (Lovable web apps the public sees) and a shared **Plugin/Service** layer. Everything reads from one canonical data store.

```mermaid
flowchart LR
  USER(["User / Contributor / Visitor"])

  subgraph GATEWAYS["Gateways (Lovable apps)"]
    G1["History Gateway"]
    G2["Builder's Gateway"]
    G3["Other Subject Gateways"]
  end

  subgraph PLUGINS["Plugins / Shared Services"]
    PL1["Lesson Plan Plugin"]
    PL2["Reputation Plugin"]
    PL3["Auth & Identity"]
  end

  subgraph DATA["Data Layer (Supabase)"]
    D1[("Public tables")]
    D2[("Contributor tables")]
    D3[("Owner / Admin tables")]
  end

  SPEC[["knowledge-gate-spec (this repo)"]]

  USER --> G1
  USER --> G2
  USER --> G3

  G1 --> PL1
  G2 --> PL1
  G3 --> PL1
  G1 --> PL2
  G2 --> PL2
  G1 --> PL3
  G2 --> PL3
  G3 --> PL3

  PL1 --> D1
  PL1 --> D2
  PL2 --> D2
  PL3 --> D2
  PL3 --> D3

  SPEC -. "contracts & schemas" .-> GATEWAYS
  SPEC -. "contracts & schemas" .-> PLUGINS
  SPEC -. "visibility rules" .-> DATA
```

---

## 3. Visibility & Trust Boundaries

Four visibility tiers, defined in `/00-charter/data-charter.md`:

| Tier        | Who can read                | Examples                                  |
|-------------|-----------------------------|-------------------------------------------|
| Public      | Everyone                    | Charter, ADRs, published lesson plans     |
| Contributor | Verified contributors       | Drafts, peer reviews, reputation history  |
| Owner       | Resource owner only         | Personal notes attached to a lesson       |
| Admin       | Governance Council          | Audit logs, dispute records               |

---

## 4. Source of Truth

- **This repository** is the canonical spec (see ADR-001).
- **Lovable projects** render the spec; they do not define it.
- **Supabase** stores runtime data under the visibility rules above.
- **Founder's personal businesses** are explicitly outside this diagram.

---

## 5. Change Process

1. Open an issue describing the proposed change.
2. If it touches ≥2 layers, write an ADR in `/02-decisions/`.
3. Update this overview and any affected charter docs in the same PR.
4. Merge to `main` only after Council review.

---

_Last updated: 2026-05-10_
