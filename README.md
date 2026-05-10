# Knowledge Gate · Spec

> The single source of truth for the **Knowledge Gate** ecosystem.
> Governance protocol, architecture, decisions, and registries — all in one place.

---

## What is this repo?

`knowledge-gate-spec` is the central documentation hub for an open-source, protocol-based learning organization called **Knowledge Gate** (知识之门). It contains:

- 📜 **Charter & governance** — organizational principles, three-power structure, incentives
- 🏛️ **Architecture** — how all gateways and plugins fit together
- 🧭 **Decision records (ADRs)** — every important decision and why it was made
- 🗂️ **Registries** — list of all gateways, plugins, and lessons
- 🛣️ **Roadmap** — what we are building next

All Lovable projects, all Supabase data, all human contributors, and all AI agents read from this repository as the **single source of truth**.

---

## Quick navigation

| Folder | What's inside |
|---|---|
| `00-charter/` | Organizational principles, governance, incentives, data charter |
| `01-architecture/` | System overview, gateway registry, plugin registry, tech stack |
| `02-decisions/` | ADRs (Architecture Decision Records) |
| `03-gateways/` | One file per gateway (History, English, Economic, ...) |
| `04-plugins/` | One file per plugin |
| `05-templates/` | Lesson templates, prompts, AI agent instructions |
| `06-roadmap/` | Roadmap & status dashboard |
| `99-archive/` | Deprecated drafts kept for history |

---

## Current status (manually updated)

- **Total gateways:** 30+
- **Live gateways:** 1 (History Gateway, in beta)
- **Founder / steward:** @zhongyuxi98-jpg
- **Last update:** 2026-05-10

---

## How to use this repo

### As a contributor
1. Read `00-charter/organization.md` first.
2. Find a relevant ADR or open an issue before making major changes.
3. Submit a PR. All changes to charter / governance require review.

### As an AI agent (Claude / Lovable / etc.)
When working on any Knowledge Gate project, fetch the latest version of this repo and treat it as authoritative. In particular:

- Treat `00-charter/data-charter.md` as the binding contract for what data is public vs. private.
- Use `01-architecture/gateways-registry.md` as the canonical gateway list.

### As a reader / future self
Start with `README.md` (this file), then `00-charter/`, then `01-architecture/overview.md`.

---

## License

All documents in this repo are released under CC0 1.0 Universal — public domain. Use them, fork them, build on them, with or without attribution.

## Principle

> *"Knowledge does not belong to anyone. It belongs to everyone who needs it."*
> — Knowledge Gate Charter, §1
