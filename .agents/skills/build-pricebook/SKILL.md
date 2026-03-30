---
name: build-pricebook
description: "Builds a flat-rate price book for trade businesses through guided conversation. Use when asked to build a price book, create pricing, set up flat rates, or price services."
argument-hint: "Your trade (e.g., plumbing, hvac, electrical)"
---

# Flat-Rate Price Book Builder

You are building a professional flat-rate price book for a trade business owner. This is a guided, conversational wizard — you ask questions, they answer, you build structured output files.

**The audience is a trade business owner with zero technical knowledge.** Talk like a business advisor, not a developer. Use dollar amounts and plain language.

## Before You Start

Read the reference files in this skill's `reference/` directory:
- `reference/trade-defaults.md` — starting values for each trade
- `reference/subsystem-examples.md` — how to decompose jobs into subsystems and line items
- `reference/pricing-formulas.md` — margin math, burden calculation, pricing formula

Check if `knowledge/00-business-profile.md` exists. If it does, read it to pre-fill what you can (trade, location, team size, hourly rates). Don't re-ask questions you already have answers to.

## The Wizard Flow

Walk through these phases one at a time. Do NOT dump all questions at once. Ask 2-4 questions per turn, confirm answers, then move on.

### Phase 1: Identify the Trade and Set the Foundation

Start with: **"Let's build your price book. What trade are you in?"**

If the user passed an argument via `$ARGUMENTS`, use that as the trade.

Once you know the trade, load the defaults from `reference/trade-defaults.md` and tell them:

> "Here are the starting numbers I'll use for [trade]. These are industry averages — we'll adjust them to match YOUR business."

Show them a simple table:

| Setting | Starting Value | Your Number |
|---------|---------------|-------------|
| Avg hourly pay (techs) | $XX/hr | ? |
| Labor burden rate | XX% | ? |
| Overhead per job | $XXX | ? |
| Target margin | XX% | ? |

Ask them to confirm or adjust each number. Explain what each means in plain language:
- **Hourly pay**: What you pay your techs per hour (W-2 wage, not what you bill)
- **Burden rate**: The extra cost on top of wages — workers comp, payroll taxes, health insurance, PTO, training. Rule of thumb: 25% to 35% of base pay
- **Overhead per job**: Your monthly fixed costs (rent, insurance, trucks, office, marketing) divided by how many jobs you run per month
- **Target margin**: The percentage of every dollar collected that is profit AFTER all costs. Not markup — margin. Read `reference/pricing-formulas.md` if they confuse the two

### Phase 2: Build the Core Assumptions File

Once they confirm their numbers, create `pricebook/01-pricing-assumptions.md` with this structure:

```markdown
# Pricing Assumptions

> Generated: [date]
> Trade: [trade]
> Last updated: [date]

## Labor Rates

| Role | Base Pay | Burden % | Loaded Rate |
|------|----------|----------|-------------|
| [Role 1] | $XX/hr | XX% | $XX.XX/hr |
| [Role 2] | $XX/hr | XX% | $XX.XX/hr |

## Overhead

| Item | Monthly Cost | Per-Job Cost |
|------|-------------|-------------|
| Total overhead | $X,XXX | $XXX |

Jobs per month: XX

## Pricing Rules

- Target margin: XX%
- Pricing formula: selling_price = total_cost / (1 - target_margin)
- Material markup: XX%
- Callback allowance: X% of job cost
- Permit recovery: pass-through + XX%

## Fully Burdened Labor Calculation

Base wage: $XX/hr
+ Workers comp (X%): $X.XX
+ Payroll taxes (X%): $X.XX
+ Health insurance (allocated): $X.XX
+ PTO/holidays (X%): $X.XX
+ Training (allocated): $X.XX
= Loaded rate: $XX.XX/hr

Effective loaded rate with truck/equipment: $XX-$XX/hr
```

### Phase 3: Define Service Categories

Ask: **"What are the main types of work you do? Most [trade] companies break it down into categories like [suggest 3-4 based on trade]."**

Use trade-specific suggestions from `reference/subsystem-examples.md`.

Create the category structure. Typical examples:
- HVAC: Service & Repair, Installation, Maintenance
- Plumbing: Service Calls, Fixture Install, Repipes, Drain Cleaning
- Electrical: Service Calls, Panel Work, Wiring, Fixture Install

### Phase 4: Build the Task Catalog (This is the Big One)

For EACH category, build out specific tasks using the **Subsystem Decomposition** framework.

Start with their **top 5 most common jobs**. Ask:

> "What are the 5 jobs you do most often? The bread and butter — the ones your guys do every week."

For each job, walk them through decomposition:

1. **Name the task** (e.g., "Water Heater Install - Gas 40gal")
2. **Break it into subsystems** (e.g., Water system, Gas system, Venting system, General)
3. **For each subsystem, list line items** with:
   - What's included (materials, fittings, connectors)
   - Labor time in minutes by role
   - Material cost (what you pay, not what you charge)
4. **Add standard exclusions** (what triggers an adder/upcharge)
5. **Calculate the price** using the formula from Phase 2

Show them the math on the first task so they understand:

```
WATER HEATER INSTALL - GAS 40GAL

Labor:
  Journeyman: 3 hrs × $XX.XX/hr (loaded) = $XXX.XX
  Apprentice: 3 hrs × $XX.XX/hr (loaded) = $XXX.XX
  Total labor: $XXX.XX

Materials:
  40gal gas water heater: $XXX
  Supply lines & fittings: $XX
  Gas connector: $XX
  Vent pipe/fittings: $XX
  Total materials: $XXX
  + XX% markup: $XX.XX
  Materials with markup: $XXX.XX

Other costs:
  Permit: $XX
  Overhead allocation: $XXX
  Callback allowance (X%): $XX

TOTAL COST: $X,XXX.XX
÷ (1 - 0.XX target margin)
= SELLING PRICE: $X,XXX.XX
```

After the first task, they'll understand the pattern. Speed up on subsequent tasks — you can ask for just the key variables (time, materials, any special costs) and calculate the rest.

Write each completed task to `pricebook/03-task-catalog.md` in this format:

```markdown
# Task Catalog

## [Category Name]

### [Task Name]
- **Task ID**: [category]-[sequence] (e.g., PLMB-WH-001)
- **Category**: [category]
- **Typical duration**: X hours
- **Crew**: [roles needed]

#### Subsystem Breakdown

**[Subsystem 1 Name]**
| Line Item | Unit | Qty | Material $ | Labor (min) | Role |
|-----------|------|-----|-----------|-------------|------|
| [item] | each | 1 | $XX | 30 | Journeyman |

**[Subsystem 2 Name]**
| Line Item | Unit | Qty | Material $ | Labor (min) | Role |
|-----------|------|-----|-----------|-------------|------|
| [item] | per ft | 10 | $XX | 45 | Journeyman |

#### Cost Summary
| Component | Cost |
|-----------|------|
| Labor (loaded) | $XXX |
| Materials (with markup) | $XXX |
| Permit | $XX |
| Overhead | $XXX |
| Callback allowance | $XX |
| **Total Cost** | **$X,XXX** |
| **Selling Price (XX% margin)** | **$X,XXX** |

#### Standard Inclusions
- [what's included in this price]

#### Adders / Exclusions
- [thing that triggers upcharge]: +$XXX
- [another]: +$XX/ft

#### Notes
- [any special notes about this task]
```

### Phase 5: Good/Better/Best Options

Once you have 5+ tasks built, ask:

> "Do you want to offer Good/Better/Best options on any of these? For example, a standard water heater install vs. a premium tankless upgrade?"

If yes, create `pricebook/04-service-tiers.md`:

```markdown
# Service Tiers

## [Task Name]

### Good (Standard)
- [description]
- Price: $X,XXX

### Better (Upgraded)
- [description + what's different]
- Price: $X,XXX

### Best (Premium)
- [description + what's different]
- Price: $X,XXX
```

### Phase 6: Summary and Next Steps

Once complete, create `pricebook/00-price-book-summary.md`:

```markdown
# Price Book Summary

> Business: [name]
> Trade: [trade]
> Generated: [date]
> Tasks priced: XX

## Quick Reference

| Task | Selling Price | Margin |
|------|--------------|--------|
| [task 1] | $X,XXX | XX% |
| [task 2] | $X,XXX | XX% |

## Key Assumptions
- Loaded labor rate: $XX.XX/hr
- Target margin: XX%
- Overhead per job: $XXX

## Files in This Price Book
- `01-pricing-assumptions.md` — Labor rates, burden, overhead, margin targets
- `02-categories.md` — Service categories
- `03-task-catalog.md` — Detailed task breakdowns with subsystem decomposition
- `04-service-tiers.md` — Good/Better/Best options (if applicable)
```

Tell them:

> "Your price book is built. Here's what you have: [count] tasks priced across [count] categories. Your AI now knows your exact pricing — when you use /estimate, it will pull from these real numbers instead of guessing."

## Critical Rules

1. **MARGIN, not markup.** selling_price = cost / (1 - margin). NEVER cost × (1 + markup). If they say "I use 50% markup," educate them on why margin matters. Reference `reference/pricing-formulas.md`.

2. **Fully burdened labor.** Never use raw hourly wage. Always add burden (workers comp, payroll taxes, benefits, PTO, training). The rule of thumb is 1.25x to 1.4x base wage.

3. **Subsystem decomposition.** Break every job into subsystems, every subsystem into line items. This is what makes the price book defensible and accurate.

4. **Don't rush.** This is the most valuable thing they'll build at the seminar. Take time on the first 2-3 tasks to teach the framework. Then speed up.

5. **Use their numbers.** The defaults are starting points. Always ask for their real costs. A plumber in San Francisco pays different rates than one in rural Alabama.

6. **Write files as you go.** Don't wait until the end. Create `01-pricing-assumptions.md` after Phase 2, start `03-task-catalog.md` after the first task, etc.

7. **Plain language.** No jargon. Say "what you pay your guys" not "base compensation." Say "the extra costs of having employees" not "labor burden rate."
