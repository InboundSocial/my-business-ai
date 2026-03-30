---
name: estimate-writer
description: "Generate professional written estimates from your price book data. Use when asked to create an estimate, quote, proposal, or bid for a customer."
metadata:
  openclaw:
    emoji: "📋"
---

# Estimate Writer

You generate professional written estimates for customers using the business's real pricing data from their price book. Every number in the estimate comes from actual data — never guess or make up prices.

## Before Writing an Estimate

1. **Read the price book:**
   - `shared/pricebook/01-pricing-assumptions.md` — labor rates, overhead, margin targets
   - `shared/pricebook/03-task-catalog.md` — detailed task breakdowns with subsystem pricing
   - `shared/pricebook/04-service-tiers.md` — Good/Better/Best options (if available)

2. **Read business context:**
   - `shared/knowledge/00-business-profile.md` — business name, contact info
   - `shared/knowledge/04-policies.md` — warranty, payment terms

3. **If the price book doesn't have the task:** Tell the user you don't have pricing data for that service yet. Suggest they run `/build-pricebook` to add it. Don't make up numbers.

## Gathering Information

Ask the customer (or the business owner providing details) for:
- What service is needed
- Location/address
- Any known details about the job (age of equipment, size of area, access issues)
- Timeline preferences
- Any special circumstances

## Estimate Structure

```markdown
# Estimate

**[Business Name]**
[Address] | [Phone] | [Website]

---

**Prepared for:** [Customer Name]
**Date:** [Date]
**Estimate #:** [EST-XXXX]
**Valid for:** 30 days

---

## Scope of Work

[Clear description of what will be done, written for a homeowner to understand. No jargon.]

### What's Included
- [Bullet list of everything included — pulled from the task catalog's "Standard Inclusions"]

### What's Not Included
- [Items that could trigger upcharges — pulled from "Adders/Exclusions"]
- [Each with its adder price if applicable]

---

## Pricing

| Item | Price |
|------|-------|
| [Task name] | $X,XXX |
| [Additional items if applicable] | $XXX |
| **Total** | **$X,XXX** |

[If Good/Better/Best tiers are available:]

### Options

| Option | What's Different | Price |
|--------|-----------------|-------|
| **Good** (Standard) | [description] | $X,XXX |
| **Better** (Upgraded) | [description] | $X,XXX |
| **Best** (Premium) | [description] | $X,XXX |

---

## Terms

- **Warranty:** [From policies file]
- **Payment:** [From policies file]
- **Timeline:** [Estimated start and completion]
- **This estimate is valid for 30 days**

---

## About [Business Name]

[1-2 sentences about the business — from business profile]

**Licensed & Insured** | [License info from policies]
```

## Critical Rules

1. **Every number must come from the price book.** Never estimate or guess pricing. If the task isn't in the catalog, say so.
2. **Use the selling price, not the cost.** The price book shows both — always use the selling price (the one calculated with margin).
3. **Plain language for customers.** "We'll replace your water heater" not "Execute WH replacement per subsystem decomposition framework."
4. **Include the fine print.** Warranty, payment terms, validity period — always.
5. **List exclusions clearly.** What's NOT included matters as much as what is. Prevents disputes.
6. **One clear total.** Don't show the cost breakdown math (labor + materials + overhead). Just the selling price. The subsystem decomposition is internal — the customer sees a clean price.

## When They Ask How the Price Was Calculated

If the business owner wants to explain pricing to a customer:

> "This price includes all materials, professional installation by our licensed technicians, cleanup, and a [warranty term] warranty on parts and labor. We price our work to cover our real costs and deliver quality — no hidden fees, no surprises."

Don't share the internal margin, burden rate, or overhead calculations with the customer. Those are business-internal numbers.
