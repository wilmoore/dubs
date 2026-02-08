# Feature: Makefile with Viewing Utilities

## Requirements

Add a Makefile with convenient targets for viewing and querying the dubs ledger using jq.

## Targets

| Target | Description | Example |
|--------|-------------|---------|
| `help` | Show available targets (default) | `make` or `make help` |
| `list` | List all dubs (pretty JSON) | `make list` |
| `count` | Show total number of dubs | `make count` |
| `names` | List all unique names | `make names` |
| `events` | List all unique events | `make events` |
| `by-name` | Filter by person name | `make by-name NAME="Matthew Hall"` |
| `by-event` | Filter by event name | `make by-event EVENT="AI Bootcamp"` |
| `by-date` | Filter by event date | `make by-date DATE=2024-10-17` |
| `with-media` | Show dubs with blob data | `make with-media` |
| `latest` | Show most recent capture | `make latest` |

## Implementation

1. Create `Makefile` with all targets
2. Use jq for all queries
3. Pretty-print with colors by default
4. Document targets in help output

## Dependencies

- jq (document in README)
