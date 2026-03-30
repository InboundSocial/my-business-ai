# Pricing Formulas

## The #1 Mistake: Confusing Markup and Margin

**Markup** is the percentage you add ON TOP of your cost.
**Margin** is the percentage of the SELLING PRICE that is profit.

They are NOT the same number. Ever.

### Example

Your job costs $1,000.

| Method | Math | Selling Price | Profit | Actual Margin |
|--------|------|--------------|--------|---------------|
| 40% markup | $1,000 × 1.40 | $1,400 | $400 | 28.6% |
| 40% margin | $1,000 ÷ 0.60 | $1,667 | $667 | 40.0% |

The difference: **$267 per job.** On 10 jobs a month, that's $2,670/month or $32,000/year.

### The Formula

**Markup**: selling_price = cost × (1 + markup%)
**Margin**: selling_price = cost ÷ (1 - margin%)

**We use MARGIN. Always.**

### Why Margin Matters

- Your accountant uses margin
- PE firms evaluate businesses on margin
- Your overhead is a percentage of revenue (selling price), not cost
- Margin tells you how much of every dollar collected is profit
- Markup tells you how much you added — which isn't useful for financial planning

### Conversion Table

| Markup | = Margin |
|--------|----------|
| 25% | 20.0% |
| 30% | 23.1% |
| 35% | 25.9% |
| 40% | 28.6% |
| 45% | 31.0% |
| 50% | 33.3% |
| 55% | 35.5% |
| 60% | 37.5% |
| 75% | 42.9% |
| 100% | 50.0% |

Notice: you need 100% markup just to hit 50% margin. Most contractors who think they're at 50% margin are actually at 33%.

---

## Fully Burdened Labor Rate

**Never price labor using the raw hourly wage.** The true cost of an employee is much higher.

### What's Included in Burden

| Cost | Typical % of Base Wage |
|------|------------------------|
| Workers compensation insurance | 5-15% (varies by trade/state) |
| Payroll taxes (FICA, FUTA, SUTA) | 7.65-10% |
| Health insurance (employer share) | 5-12% (if offered) |
| PTO / paid holidays / sick time | 4-8% |
| Training and certification | 1-3% |
| Uniforms and safety equipment | 1-2% |
| **Total burden** | **25-40%** |

### Example Calculation

Tech base pay: $30.00/hr

| Component | Cost |
|-----------|------|
| Base wage | $30.00 |
| Workers comp (8%) | $2.40 |
| Payroll taxes (7.65%) | $2.30 |
| Health insurance (allocated $400/mo ÷ 173 hrs) | $2.31 |
| PTO + holidays (6%) | $1.80 |
| Training (2%) | $0.60 |
| Uniforms/safety (1%) | $0.30 |
| **Loaded hourly rate** | **$39.71** |

**Burden multiplier: 1.32x** (32% burden)

### Rule of Thumb

- Low benefits package: 1.25x base wage
- Standard benefits: 1.30-1.35x base wage
- Full benefits (health, retirement, PTO): 1.35-1.40x base wage

### True Effective Rate (Including Truck + Equipment)

Some companies go further and include truck cost and equipment depreciation in the hourly rate:

| Add-on | Typical Cost |
|--------|-------------|
| Truck payment + insurance + fuel | $800-1,500/mo → $5-9/hr |
| Tool/equipment depreciation | $200-500/mo → $1-3/hr |
| Phone/tablet | $100-150/mo → $0.60-0.90/hr |

A $30/hr tech can have a true effective rate of $45-$55/hr when you include everything.

---

## The Pricing Formula

```
task_cost = loaded_labor + materials_with_markup + equipment + permits + overhead_allocation + callback_allowance

selling_price = task_cost ÷ (1 - target_margin)
```

### Component Breakdown

**Loaded Labor**
= (hours × loaded_hourly_rate) for each role on the job
Include: billable hours + travel time + setup time

**Materials with Markup**
= material_cost × (1 + material_markup%)
Material markup covers: sourcing, storage, transport to job, warranty on parts
Standard material markup: 15-30% depending on trade

**Equipment**
= rental or depreciation allocation for specialized equipment
Only include if the job requires equipment beyond the standard truck loadout

**Permits**
= actual permit cost + coordination time
Pass through at cost + $25-75 for your time pulling/scheduling

**Overhead Allocation**
= total_monthly_overhead ÷ jobs_per_month
This spreads your fixed costs across jobs

**Callback Allowance**
= 2-5% of job cost
This accounts for warranty callbacks and re-work. If your callback rate is above 5%, you have a quality problem, not a pricing problem.

### Worked Example: Plumbing Faucet Replacement

```
Labor:
  Journeyman: 1.5 hrs × $34.16/hr (loaded) = $51.24
  Travel: 0.5 hrs × $34.16/hr = $17.08
  Total labor: $68.32

Materials:
  Faucet (customer supplies) or markup on unit: $0
  Supply lines: $12
  Shutoff valves (if replacing): $20
  Misc (teflon, putty, caulk): $5
  Subtotal: $37
  + 25% markup: $9.25
  Materials total: $46.25

Other:
  Overhead allocation: $100
  Callback allowance (3%): $6.44

TOTAL COST: $221.01

At 45% margin:
  $221.01 ÷ (1 - 0.45) = $221.01 ÷ 0.55 = $401.84

SELLING PRICE: $402 (rounded)
PROFIT: $181
```

---

## Target Margins by Trade and Job Type

| Trade | Service/Repair | Install/Replace | Maintenance |
|-------|---------------|----------------|-------------|
| HVAC | 45-55% | 35-40% | 50-60% |
| Plumbing | 45-55% | 35-45% | 50-60% |
| Electrical | 35-45% | 35-40% | 40-50% |
| Roofing | 35-45% | 28-35% | — |
| Painting | 35-45% | 35-45% | 40-50% |
| General Contracting | 25-35% | 20-30% | — |
| Pest Control | 40-50% | 50-60% | 50-60% |
| Cleaning | 40-50% | 35-45% | 40-50% |
| Landscaping | 35-45% | 30-40% | 40-50% |

**General rule**: Service work has the highest margins (urgency + low materials). Installs have lower margins but higher ticket. Maintenance/recurring has great margins because it's predictable and has zero acquisition cost after the first sale.

---

## Explaining Pricing to Customers

When a customer asks "why does this cost that much?", subsystem decomposition lets you answer:

> "Here's what's included in your price: [list subsystems]. The materials are [list major items]. Our technician is a licensed [trade] professional with [X] years of experience. The price includes a warranty on both parts and labor."

You're not justifying your margin. You're showing them the value and scope. The subsystem breakdown makes the price feel earned and transparent.

If a customer says a competitor is cheaper, the response is:

> "They might be. Here's what to ask them: Does the price include [specific line item]? Are their technicians W-2 employees with insurance, or 1099 subs? Do they pull permits? What's their warranty?"

The business with the price book always wins this conversation because they know exactly what's in their number.
