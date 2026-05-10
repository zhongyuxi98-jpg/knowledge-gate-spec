# Data Charter v0.1

> The binding contract for what data is public, what is contributor-only, and what is private.
> Every Knowledge Gate project — Lovable apps, Supabase tables, AI agents — must enforce this charter.

This document is the human-readable version. The machine-enforceable version lives in Supabase Row-Level Security (RLS) policies; the two must remain in sync, with this document as the authoritative source.

---

## Visibility levels

| Level | Who can read | Who can write |
|---|---|---|
| 🌍 **Public** | Anyone, no login required | Admin only |
| 👥 **Contributor** | Logged-in contributors | Admin only |
| 🔒 **Owner** | The owning user only | The owning user only |
| ⚙️ **Admin** | Governance committee | Governance committee |

---

## Data type → visibility mapping

### Gateway / structural metadata
- Gateway list (slug, name, parent) — 🌍 Public
- Gateway status & completion % — 🌍 Public
- Gateway URL & color — 🌍 Public
- Gateway internal config (Supabase keys, secrets) — ⚙️ Admin

### Plugin metadata
- Plugin registry (slug, name, type, description) — 🌍 Public
- Plugin → gateway mapping — 🌍 Public
- Plugin internal config (per gateway) — 👥 Contributor

### Lessons / content
- Lesson title, tags, gateway, source — 🌍 Public
- Lesson body (`content_md`) — 🌍 Public **by default**, may be 👥 Contributor if the lesson is marked `draft` or `internal`
- Lesson author + last editor — 🌍 Public

### Contributors
- Contributor list (handle, role, join date) — 🌍 Public
- Contribution points & total earned — 🌍 Public
- Real name / contact info — 🔒 Owner (each contributor controls visibility)
- Stipend amount — 🌍 Public (per the incentive charter)

### Governance artifacts
- ADRs — 🌍 Public
- Protocol Layer rulings — 🌍 Public
- Charter amendments — 🌍 Public
- Open / closed application records — 🌍 Public **summary statistics only**; raw applications are 🔒 Owner

### User learning data
- A user's progress on a lesson — 🔒 Owner
- A user's notes, highlights, answers — 🔒 Owner
- Aggregated, anonymized stats — 🌍 Public
- A user's email or auth tokens — 🔒 Owner; never readable by Knowledge Gate code at all

### Operational data
- Internal drafts before publish — 👥 Contributor
- Bug reports & telemetry — 👥 Contributor (anonymized) or ⚙️ Admin (full)
- Financial records (revenue, expenses) — 🌍 Public summary, ⚙️ Admin detail

---

## Hard prohibitions

These rules cannot be relaxed by ADR; changing them requires a charter amendment under `organization.md`.

1. **Never expose user email, auth tokens, or learning data to other users**, even contributors.
2. **Never use a user's data to train a model** without explicit, separately-granted consent for that specific use.
3. **Never let URL parameters carry personally identifiable data** — use POST + auth, not query strings.
4. **Never read or write data in a Lovable project that bypasses the visibility level above** — even temporarily, even "just for testing."
5. **Never let a free-tier-blocked decision happen in private** — pricing decisions affecting the Equity Layer's baseline are 🌍 Public.

---

## Enforcement

Each Lovable project that touches Knowledge Gate's Supabase **must**:

- Pass an RLS audit before being added to the gateway registry.
- Re-audit after any schema migration.
- Reference this charter version in its README.

The Protocol Layer can ban a project from the registry if it fails an audit or violates a hard prohibition.

---

*Status: v0.1 — initial draft. Will be revised when the first audit produces findings.*
