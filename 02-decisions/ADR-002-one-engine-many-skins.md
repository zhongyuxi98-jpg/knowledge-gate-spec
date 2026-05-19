# ADR-002: One engine, many skins

- Status: Accepted
- Date: 2026-05-19
- Deciders: Alicia (founding steward)
- Relates to: Charter principle "Lovable projects render the spec; they do not
  define it." Sets requirements for 03-data/schema.sql and
  05-templates/atom.schema.json.

## Context

Knowledge Gate currently reinvents the wheel. For every new subject, exam
syllabus, or individual student, a new Lovable project has been created as the
carrier of content. History alone has ~7–8 projects; 50+ exist in total. The
spec already states the correct principle — Lovable projects render the spec,
they do not define it — but practice has violated it: the projects define
content instead of rendering shared data.

This is a category error: "content" (a knowledge unit) and "carrier" (a
website) were bound together, so producing content meant building a carrier.
The result is wasted compute (the same knowledge regenerated per student),
content that cannot be reused, and a system that cannot scale to many subjects
or many learners.

## Decision

1. There is exactly one rendering engine. It contains no subject content.
   It renders from data at runtime.
2. A subject is data, not a project. Adding a subject = adding a skin
   (theme tokens + layout slots) plus any subject-specific rendering fields,
   contributed as a pull request to the engine repository. It is never a new
   website / Lovable project.
3. An exam syllabus (高考 / IB / 竞赛 / 兴趣) is rows in syllabi /
   syllabus_nodes pointing to a subset of atoms. Switching syllabus =
   switching a set of atom pointers, never a new page.
4. Personalization is a row, not a project. A learner is one row in
   learners (+ learner_mastery, learner_events). The engine renders
   per-learner from that row. A new student never produces a new project or a
   hand-built page.
5. Knowledge is stored as atoms with multiple renderings (explainer,
   story, game, flashcards, common-mistakes, OPVL, dialogue, drill) — the same
   atom, several JSON fields, generated once and reused.
6. **No generated content enters the store unless it passes the atom
   contract.** 05-templates/atom.schema.json is a machine-checkable contract;
   any atom or rendering that fails it (anchor quote not found verbatim in the
   source, missing page locator, banned exam-loss phrasing, a causal-chain item
   without exactly one most-plausible distractor, etc.) is automatically
   rejected and is not written. This gate is mandatory and non-optional.

## Consequences

Positive: knowledge is generated once and reused across all future learners;
the bulk of work is served from inventory, the rest is incremental and flows
back into inventory; the system can take new subjects and learners without new
carriers; content is contributable by others under the protocol; consistent
with the CC0 commons posture (atoms public, learner data private).

Constraints this imposes (the bleed-stop clause):

- MUST NOT create a new Lovable / website project for a new subject, syllabus,
  or student. The only artifact ever newly created for a new subject is a skin
  package, via PR.
- MUST NOT hand-build a per-student page or path. Per-student state lives in
  learners.
- Lovable is demoted to skin / visual prototyping only (a Figma replacement).
  It is never the engine and never the source of truth.
- Any content that does not pass atom.schema.json MUST NOT be stored. The
  contract gate has no exceptions.

## Dependent specs (required, delivered separately)

- 03-data/schema.sql MUST define: atoms, atom_renderings, learners,
  learner_mastery, learner_events, syllabi, syllabus_nodes.
- 05-templates/atom.schema.json MUST define the atom field standard, the
  rendering shapes, and the hard constraints enforced by Decision §6.
