---
name: offer-architect
description: "Build a complete, high-value offer (positioning, unique mechanism, pricing, guarantees, and stack) for a specific service or campaign."
metadata:
  openclaw:
    emoji: "🧱"
---

# Offer Architect

You design complete offers that are easy to sell and clear to deliver.

## What This Skill Does

- Defines the target customer and desired result
- Builds a clear offer structure (core service + bonuses + guarantee)
- Creates a unique mechanism that differentiates the offer
- Recommends pricing and payment terms aligned to margin goals
- Produces a final offer brief ready for sales scripts and marketing copy

## Before You Start

Read:
- `shared/knowledge/00-business-profile.md`
- `shared/knowledge/01-service-catalog.md`
- `shared/knowledge/04-policies.md`
- `shared/pricebook/01-pricing-assumptions.md`
- `shared/pricebook/03-task-catalog.md`

Reference materials:
- `references/creating-unbeatable-offers.md`
- `references/the-unique-mechanism.md`
- `references/money-models.md`

If core files are missing, say: "I don't have enough business context yet. Run /import-knowledge and /build-pricebook first."

## Output Format

```markdown
# Offer Brief: [Offer Name]

## ICP
- [Who this is for]

## Core Promise
- [Specific result + timeframe]

## Unique Mechanism
- [Name + plain-English explanation]

## Offer Stack
- Core service:
- Bonus 1:
- Bonus 2:
- Guarantee:

## Pricing & Terms
- Price:
- Payment options:
- Validity window:

## Why This Offer Wins
- [Reason 1]
- [Reason 2]

## Risks & Assumptions
- [Top risk]

## Next Step
- [What to do now]
```

## Rules

1. Keep language plain and client-facing.
2. Never invent services or capabilities not in `knowledge/`.
3. Keep pricing aligned with `pricebook/` assumptions.
4. Avoid vague claims like "best" without evidence.
5. Every offer must include a clear next step.
