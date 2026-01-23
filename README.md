# dubs

A proof ledger. Nothing more.

`dubs` stores immutable, first-order facts about testimonials, praise, or public statements. It is an append-only record of truth with provenance.

## What dubs is NOT

- Not a marketing tool
- Not a funnel system
- Not a testimonial gallery
- Not a CRM
- Not a rendering engine
- Not a permissions system

## Philosophy

**Store facts, never interpretation.**

The ledger captures exactly what was said, who said it, where it came from, and when it was captured. That's it.

Anything derived from these facts—summaries, claims, permissions, views, audiences, formats, marketing usage—lives OUTSIDE the core data. The schema is the immutable core.

## The Ledger

`dubs.json` is append-only. Past entries are never edited. If a correction is needed, add a new entry.

```json
{
  "version": 1,
  "dubs": [ ... ]
}
```

Each `Dub` record contains:
- `id` — UUID
- `who` — The person (name, social profile, url)
- `original` — The statement (text, source url, optional media blob)
- `event` — Context (name, date, url)
- `captured_at` — When this fact was recorded

See `schema.json` for the exact shape.

## Querying with jq

Filter by person:
```bash
jq '.dubs[] | select(.who.name == "Matthew Hall")' dubs.json
```

Filter by event:
```bash
jq '.dubs[] | select(.event.name == "AI Bootcamp")' dubs.json
```

Filter by date range:
```bash
jq '.dubs[] | select(.event.date >= "2024-01-01" and .event.date <= "2024-12-31")' dubs.json
```

Find entries with media:
```bash
jq '.dubs[] | select(.original.blob != null)' dubs.json
```

Count all entries:
```bash
jq '.dubs | length' dubs.json
```

## Future Migration

The ledger will eventually move to a database (e.g., Supabase) for better querying and scale. The schema will remain identical. `dubs.json` serves as the canonical source until migration.

## Contributing

**Do not mutate historical entries.**

If you find an error in an existing record, do not edit it. Add a new entry with the correction. The ledger is append-only by design.
