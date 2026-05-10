# Three-Power Governance

> Three branches that check and balance one another. No single layer holds absolute authority.

Knowledge Gate is governed by three coordinate layers. Each has its own scope, its own seat, and its own veto. Conflict between layers is resolved by the Protocol Layer; conflict over the Protocol Layer itself is resolved by community-wide vote.

---

## Layer 1 — Protocol Layer (`adjudication`)

**Role:** the final arbiter when other layers conflict.

- Composed of a small council of humans **and** AI agents.
- Issues rulings, does not execute them.
- Every ruling is published in `02-decisions/` as an ADR.
- Rulings can be overturned by the council itself when shown to be in error; an apology is published.
- Modifying the protocol requires a supermajority (≥75%) and a public comment period. No single person — including the founder — can amend it unilaterally.

## Layer 2 — Education Equity Layer (`content & reputation`)

**Role:** keeps the gate open and the content trustworthy.

- A rotating committee, gradually opened to wider representation as the project matures.
- Guarantees a baseline of free, accessible content forever.
- Sets term limits to prevent entrenchment.
- May call for a recall vote against the protocol council.

## Layer 3 — Commercial Sustainability Layer (`expansion & funding`)

**Role:** ensures the project can survive and grow.

- Operates revenue streams (paid tiers, sponsorships, grants) within the bounds set by the Protocol Layer.
- Distributes funds to contributors per `incentives.md`.
- Cannot price-gate the baseline content protected by the Equity Layer.
- Cannot redirect contributor compensation without a Protocol Layer ruling.

---

## Checks and balances

| Action | Who proposes | Who approves | Who can veto |
|---|---|---|---|
| Amend the charter | Anyone | Protocol Layer (supermajority) | Equity Layer can call recall |
| Add or remove a gateway | Equity Layer | Protocol Layer | Commercial Layer (only on cost grounds) |
| Set commercial pricing | Commercial Layer | Equity Layer (on accessibility grounds) | Protocol Layer |
| Distribute revenue | Commercial Layer | Equity Layer | Protocol Layer |
| Onboard / remove members | Equity Layer | Protocol Layer | — |

---

## Transition plan

While the project is small (< 5 active contributors), the founder serves as **interim steward** holding all three roles, but commits in advance to:

1. Documenting every decision as an ADR.
2. Stepping out of any role as soon as a candidate exists.
3. Accepting reversal of past decisions by future committees without resistance.

Stewardship transitions to formal committees when:
- ≥ 5 active contributors, **and**
- The project has been live for at least 6 months, **and**
- A public RFC has been open for 30 days without unresolved objections.

---

## When this document does not cover a case

Default to the principles in `organization.md` §"Things we believe". When even those are silent, default to **the gate stays open** and document the gap so a future ADR can close it.
