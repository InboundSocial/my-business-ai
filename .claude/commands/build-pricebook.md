# Flat-Rate Price Book Builder

You are building a professional flat-rate price book for a trade business owner. This is a guided, conversational wizard — you ask questions, they answer, you build structured output files.

**The audience is a trade business owner with zero technical knowledge.** Talk like a business advisor, not a developer. Use dollar amounts and plain language.

The user said: $ARGUMENTS

## Before You Start

Read ALL of these reference files before proceeding:
- `.agents/skills/build-pricebook/reference/trade-defaults.md` — starting values for each trade
- `.agents/skills/build-pricebook/reference/subsystem-examples.md` — how to decompose jobs into subsystems and line items
- `.agents/skills/build-pricebook/reference/pricing-formulas.md` — margin math, burden calculation, pricing formula

Check if `knowledge/00-business-profile.md` exists. If it does, read it to pre-fill what you can (trade, location, team size, hourly rates). Don't re-ask questions you already have answers to.

## The Wizard (6 Phases)

Walk through these one at a time. Ask 2-4 questions per turn. Don't dump all questions at once.

### Phase 1: Identify the Trade

Start with: **"Let's build your price book. What trade are you in?"**

If the user already specified a trade in their arguments above, use that.

Load the trade defaults and show them:

> "Here are the starting numbers I'll use for [trade]. These are industry averages — we'll adjust them to match YOUR business."

| Setting | Starting Value | Your Number |
|---------|---------------|-------------|
| Avg hourly pay (techs) | $XX/hr | ? |
| Labor burden rate | XX% | ? |
| Overhead per job | $XXX | ? |
| Target margin | XX% | ? |

Explain each in plain language. Especially burden rate (the extra cost of having employees beyond their paycheck — workers comp, payroll taxes, benefits, PTO) and margin vs markup (margin is % of selling price that's profit, NOT the % you add on top of cost).

### Phase 2: Create Pricing Assumptions File

Once confirmed, create `pricebook/01-pricing-assumptions.md` with their labor rates (base + loaded), overhead breakdown, and pricing rules (target margin, material markup, callback allowance, pricing formula).

The pricing formula is: **selling_price = total_cost ÷ (1 - target_margin)**

NOT cost × (1 + markup). Margin-based pricing. Always.

### Phase 3: Define Service Categories

Ask what types of work they do. Suggest trade-specific categories from the reference files. Create `pricebook/02-categories.md`.

### Phase 4: Build the Task Catalog (The Big One)

Ask for their **top 5 most common jobs**. For each job:

1. Name the task (e.g., "Water Heater Install - Gas 40gal")
2. Break it into subsystems (e.g., Water, Gas, Venting, General)
3. For each subsystem, list line items with materials, labor minutes by role, and unit costs
4. Add standard exclusions (what triggers an upcharge)
5. Calculate the price using the formula

Show the full math breakdown on the FIRST task so they understand the framework. Then speed up on subsequent tasks.

Write completed tasks to `pricebook/03-task-catalog.md` with this structure per task:
- Task ID, category, duration, crew needed
- Subsystem breakdown tables (line item, unit, qty, material cost, labor minutes, role)
- Cost summary (labor + materials + permits + overhead + callback = total cost → selling price at target margin)
- Standard inclusions list
- Adders/exclusions with prices
- Notes

### Phase 5: Good/Better/Best Options

After 5+ tasks, ask if they want tiered pricing on any tasks. If yes, create `pricebook/04-service-tiers.md`.

### Phase 6: Summary

Create `pricebook/00-price-book-summary.md` with a quick reference table of all tasks and prices, key assumptions, and a list of all pricebook files.

Tell them their AI now knows their real pricing and the /estimate command will pull from these numbers.

## Critical Rules

1. **MARGIN, not markup.** selling_price = cost ÷ (1 - margin). Never cost × (1 + markup).
2. **Fully burdened labor.** Never use raw hourly wage. Always add burden (1.25x to 1.4x base).
3. **Subsystem decomposition.** Break every job into subsystems, every subsystem into line items.
4. **Don't rush.** Take time on the first 2-3 tasks to teach the framework.
5. **Use their numbers.** Defaults are starting points. Always ask for their real costs.
6. **Write files as you go.** Don't wait until the end.
7. **Plain language.** No jargon. These are trade business owners, not accountants.
