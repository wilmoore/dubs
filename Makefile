.PHONY: help list count names events by-name by-event by-date with-media latest

LEDGER := dubs.json

help: ## Show available targets
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'
	@echo ""
	@echo "Examples:"
	@echo "  make by-name NAME=\"Matthew Hall\""
	@echo "  make by-event EVENT=\"AI Bootcamp\""
	@echo "  make by-date DATE=2024-10-17"

list: ## List all dubs
	@jq '.dubs[]' $(LEDGER)

count: ## Show total number of dubs
	@jq '.dubs | length' $(LEDGER)

names: ## List all unique names
	@jq -r '[.dubs[].who.name] | unique | .[]' $(LEDGER)

events: ## List all unique events
	@jq -r '[.dubs[].event.name] | unique | .[]' $(LEDGER)

by-name: ## Filter by name (NAME=x)
	@jq '.dubs[] | select(.who.name | test("$(NAME)"; "i"))' $(LEDGER)

by-event: ## Filter by event (EVENT=x)
	@jq '.dubs[] | select(.event.name | test("$(EVENT)"; "i"))' $(LEDGER)

by-date: ## Filter by date (DATE=YYYY-MM-DD)
	@jq '.dubs[] | select(.event.date == "$(DATE)")' $(LEDGER)

with-media: ## Show dubs with blob data
	@jq '.dubs[] | select(.original.blob != null)' $(LEDGER)

latest: ## Show most recently captured dub
	@jq '.dubs | sort_by(.captured_at) | last' $(LEDGER)
