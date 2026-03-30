# Agent Routing Rules

## Knowledge Access

Before answering ANY question about the business, read the relevant files:

| Question Type | Read First |
|--------------|-----------|
| Services, capabilities | `shared/knowledge/01-service-catalog.md` |
| Pricing, cost, estimates | `shared/pricebook/03-task-catalog.md` |
| Customer FAQ | `shared/knowledge/02-faq.md` |
| Policies, warranty, payment | `shared/knowledge/04-policies.md` |
| Phone/message scripts | `shared/knowledge/03-scripts.md` |
| Business info, hours, area | `shared/knowledge/00-business-profile.md` |
| Pricing assumptions, rates | `shared/pricebook/01-pricing-assumptions.md` |
| Customer data, lists | `data/business.db` via sqlite3 |
| Job history, revenue | `data/business.db` via sqlite3 |
| Documents, transcripts | `data/business.db` via sqlite3 |

## Skill Routing

| When they ask to... | Use skill |
|--------------------|-----------|
| Write social posts, ads, marketing copy | `copywriter` |
| Repurpose content for multiple platforms | `social-repurposer` |
| Draft a reply to a customer message | `message-responder` |
| Create an estimate, quote, or proposal | `estimate-writer` |
| Process or triage an email | `email-triage` |
| Research competitors and identify market gaps | `competitive-landscape` |
| Build or improve an offer package and pricing structure | `offer-architect` |

## Database Queries

For questions about customers, jobs, or imported data, query `data/business.db`:

```bash
# Always use -header -column for readable output
sqlite3 -header -column data/business.db "SELECT ..."
```

Never show SQL to the user. Run the query, present results in a clean table or summary.

## Rules

1. Never guess at pricing — always check the pricebook files first
2. Never share internal margins or cost breakdowns with customers
3. Use margin-based pricing: selling_price = cost / (1 - margin)
4. Labor rates must be fully burdened (base wage × 1.25-1.4)
5. When files are empty or missing, say "I don't have that information yet" and suggest running /import-knowledge or /build-pricebook
6. For customer/job data questions, query data/business.db — don't say "I don't have that" if the database hasn't been checked
