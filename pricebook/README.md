# Price Book

This folder contains your flat-rate price book — built by the `/build-pricebook` command.

## Files

| File | What It Contains |
|------|-----------------|
| `00-price-book-summary.md` | Quick reference: all tasks, prices, key assumptions |
| `01-pricing-assumptions.md` | Labor rates (base + loaded), overhead, margin targets, pricing formula |
| `02-categories.md` | Your service categories (e.g., Service & Repair, Installation, Maintenance) |
| `03-task-catalog.md` | Detailed task breakdowns with subsystem decomposition and pricing |
| `04-service-tiers.md` | Good/Better/Best options (if you set them up) |

## How Pricing Works

Every task is priced using this formula:

```
selling_price = total_cost ÷ (1 - target_margin)
```

Where total cost includes:
- **Loaded labor** (hourly pay + workers comp + payroll taxes + benefits + PTO)
- **Materials with markup** (what you pay + 15-30% for sourcing and handling)
- **Overhead allocation** (your monthly fixed costs ÷ jobs per month)
- **Callback allowance** (2-5% buffer for warranty work)
- **Permits** (if applicable)

This is **margin-based pricing**, not markup. A 40% margin means 40% of every dollar collected is gross profit. That's different from a 40% markup, which only gives you 28.6% margin.

## Adding More Tasks

Run `/build-pricebook` again to add more tasks, or manually add entries to `03-task-catalog.md` following the same format.

## How Other Commands Use This

- `/estimate` reads your task catalog to generate accurate quotes from real data
- Your AI knowledge base references these files for pricing questions
