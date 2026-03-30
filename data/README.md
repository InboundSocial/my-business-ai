# Business Database

This folder contains your AI's database — where bulk business data lives.

## What Goes Here

| Data Type | Example | How to Import |
|-----------|---------|--------------|
| Customer lists | CRM export, spreadsheet | `/import-data customers myfile.csv` |
| Job history | Past jobs from CRM | `/import-data jobs myfile.csv` |
| Documents | Contracts, transcripts, notes | `/import-data document myfile.txt` |

## How It Works

Your AI has two kinds of memory:

1. **Files you can read** (`knowledge/` and `pricebook/`) — your business profile, FAQ, scripts, pricing. You edit these directly.
2. **A database** (`data/business.db`) — for big data like customer lists and job history. The AI manages this for you.

You never need to touch the database directly. Just run `/import-data` and the AI handles the rest.

## Database File

- `business.db` — Your business database (created by `setup.sh`, not committed to git)
- `schema.sql` — The database structure (committed, versioned)

## Querying

Ask your AI natural-language questions:
- "How many customers do I have in zip code 85281?"
- "What was my most profitable service last quarter?"
- "Show me all customers who haven't had service in 6 months"
- "What's my average job revenue by category?"

The AI translates your question into a database query and gives you the answer.
