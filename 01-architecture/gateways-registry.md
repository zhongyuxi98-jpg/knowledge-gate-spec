# Gateways Registry

> Canonical list of every gateway in the Knowledge Gate ecosystem.
> This file is the human-readable mirror of the Supabase `gateways` table; both must stay in sync.

When you add, remove, or change a gateway, update this file in the same PR that changes the Supabase row.

---

## Status legend

- 🌱 **Seed** — idea only, no real pages yet
- 🚧 **Draft** — pages exist, no backend
- 🧪 **Beta** — connected to Supabase, has at least one real user flow
- ✅ **Live** — published, used regularly
- 🏛️ **Mature** — has feedback loop, iterated 3+ times

---

## L0 — Hub

| Slug | Name | Status | URL | Notes |
|---|---|---|---|---|
| `builder` | Builder's Gateway · 治理协议 | 🚧 Draft | (Lovable: builder-gate-guide) | Public charter & onboarding for contributors |
| `hub` | Knowledge Gate · Hub (planned) | 🌱 Seed | TBD | Master entry point linking all gateways |
| `mission-control` | Mission Control (planned, internal) | 🌱 Seed | TBD | Admin-only operations dashboard |

## L1 — Subject gateways

| Slug | Name | Status | Owner | Notes |
|---|---|---|---|---|
| `history` | History Gateway · 历史之门 | 🧪 Beta | @zhongyuxi98-jpg | Most active; OPVL highlighter, lesson briefings |
| `english` | English Gateway · 英语之门 | 🚧 Draft | @zhongyuxi98-jpg | |
| `economic` | Economic Gateway Hub · 经济之门 | 🚧 Draft | @zhongyuxi98-jpg | |
| `buddhist` | Buddhist Wisdom Path · 佛学之门 | 🚧 Draft | @zhongyuxi98-jpg | Plus Inner Science Explorer (immersive variant) |
| `love` | Gateway of Love · 爱之门 | 🌱 Seed | @zhongyuxi98-jpg | Relationships / emotional theme |
| `culinary` | Culinary Alchemy Lab · 厨艺之门 | 🌱 Seed | @zhongyuxi98-jpg | |
| `failure` | Expressive Flow · 失败之门 | 🌱 Seed | @zhongyuxi98-jpg | Failure & emotional expression |

## L2 — Learning tools

| Slug | Name | Status | Notes |
|---|---|---|---|
| `eduflow` | EduFlow Companion | 🚧 Draft | General-purpose study companion |
| `learn-companion` | Learn Companion | 🚧 Draft | |
| `bright-minds` | Bright Minds Hub | 🚧 Draft | |
| `history-builder-kit` | History Builder Kit | 🚧 Draft | History-specific authoring |
| `stats` | Stats Success Guide · 线性代数-统计 | 🚧 Draft | |
| `law` | Law Study Buddy | 🚧 Draft | |
| `exam-sprint` | Exam Sprint Master | 🚧 Draft | |
| `bilingual` | Bilingual Breakdown | 🚧 Draft | Bilingual study tool |
| `john-inquiry` | John's Inquiry Path · 竞赛路径 | 🚧 Draft | Competition prep |

## L3 — Personal growth & navigation

| Slug | Name | Status | Notes |
|---|---|---|---|
| `insight-flow` | Insight Flow | 🚧 Draft | |
| `learn-flow` | Learn Flow | 🚧 Draft | |
| `flow-learn` | Flow Learn | 🚧 Draft | |
| `mind-spark` | Mind Spark | 🚧 Draft | |
| `focus-flow` | My Focus Flow | 🚧 Draft | |
| `academic-compass` | Academic Compass | 🚧 Draft | |
| `great-work-compass` | Great Work Compass | 🚧 Draft | Mission discovery |
| `pathfinder` | Pathfinder AI | 🚧 Draft | |
| `unichoice` | UniChoice Helper · 选校辅助器 | 🚧 Draft | |
| `cognitive-doors` | Cognitive Doors | 🚧 Draft | |

## L4 — Exploration & culture

| Slug | Name | Status | Notes |
|---|---|---|---|
| `cosmic` | Cosmic Dialogues | 🚧 Draft | Cosmology / philosophy |
| `echoes` | Echoes of Wisdom | 🌱 Seed | Quote / wisdom collection |
| `shanghai` | Shanghai Explorer | 🌱 Seed | Real-city exploration |
| `creative-world` | My Creative World | 🌱 Seed | Personal creative space |
| `polari` | Polari Dreams | 🌱 Seed | |
| `visual-launchpad` | Visual Launchpad · 行动启动器 | 🌱 Seed | |

---

## Plugins (cross-gateway)

These are listed in detail in `04-plugins/`; here is a quick index:

- `knowledge-check` — Knowledge Check Master
- `progress-tracker` — Progress Tracker
- `ip-creator` — IP Creator Hub (marketing)
- `project-recall` — Project Recall

---

## Last updated

2026-05-10 by @zhongyuxi98-jpg.

When updating: add/remove rows here, update `completion` and `status` in the Supabase `gateways` table, then bump the date and commit.
