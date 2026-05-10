# Changelog

All notable changes to the Knowledge Gate ecosystem are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Dates are in ISO 8601 (YYYY-MM-DD).

---

## [Unreleased]

### Added
- Initial `knowledge-gate-spec` repository as the central source of truth.
- README with repo overview, navigation, and usage instructions for humans + AI agents.
- CC0 1.0 license to release all docs into the public domain.
- Folder skeleton: `00-charter/`, `01-architecture/`, `02-decisions/`, `03-gateways/`, `04-plugins/`, `05-templates/`, `06-roadmap/`, `99-archive/`.
- ADR-001: chose this repository as the binding source of truth (over Lovable / Notion).
- Charter: organization principles, three-power governance, contributor incentives.
- Data charter v0.1 mapping public / contributor / admin visibility for every data type.
- Gateway registry seeded with current 30+ Lovable projects.

### Changed
- Renamed brand from "知识之门" pinyin (`zhishimen`) to English (`knowledge-gate`) for international consistency.

### Decisions in flight
- Whether Mission Control becomes a separate Lovable project or a sub-route of Builder's Gateway.
- Whether to migrate the user account to a GitHub Organization (`knowledge-gate`).

---

## How to update this file

When you commit a meaningful change, add an entry under `[Unreleased]` in the right category:

- **Added** — new docs, new gateways, new plugins
- **Changed** — naming, schema, structure
- **Deprecated** — soon-to-be-removed
- **Removed** — taken out
- **Fixed** — corrections to docs or schema
- **Security** — anything privacy / RLS related

When a milestone ships, move `[Unreleased]` entries under a new dated heading, e.g. `## [0.1.0] - 2026-06-01`.
