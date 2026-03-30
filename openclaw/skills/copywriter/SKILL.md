---
name: copywriter
description: "Canonical copy skill for all written output. Direct response copywriting based on Schwartz, Halbert, Hopkins, and Sugarman — the craft of persuasive writing that converts."
---

# Copywriter

The master writing skill for all persuasive copy. Two layers working together:

**Layer 1 — Attention (Engagement Psychology):** Based on the masters of engagement — LadBible, Unilad, TMZ, Daily Mail, and Sabri Suby's Hyperdopamine Ad framework ($200M+ ad spend, 1000+ niches). Curiosity gaps, pattern interrupts, tabloid psychology, content-native principles. This is what makes copy impossible to ignore.

**Layer 2 — Conversion (Direct Response):** Based on Schwartz (market awareness), Halbert (salesmanship in print), Hopkins (scientific advertising), and Sugarman (the slippery slide). This is what makes copy impossible to resist.

This skill is the **canonical authority** on copy quality. All other skills that produce written copy defer to this skill for writing craft.

## What It Covers

- **Engagement psychology** — hyperdopamine formula, curiosity engineering, tabloid language, content-native principle
- **The 5-zone ad brief** — slippery lead-in, image concept, headline, link description, CTA
- **21 creative formats** — 7 core (Raw Native, Breaking News, Native Highlight, Native Social Post, Secret Info, SMS/Notification, Social Proof Screenshot) + 14 expanded (Receipt/Invoice, Before/After Split, Leaked Document, Meme, Data Visualization, Poll/Survey, DM/Chat, Caught on Camera, Side-by-Side Comparison, Handwritten Note, Magazine Cover, App/UI Screenshot, Unboxing/Reveal, Countdown/Timer) — each with psychological rationale and use-case guidance
- **14 headline patterns** — Third-Person Story, Discovery/Exposure, Contrarian, Reaction, Secret/Insider, Breaking/News Hijack, Listicle Hook, Quiz/Challenge, Confession, Ranking/Superlative, Prediction, Versus, Direct Address, "Just Released" — drawn from tabloid and engagement publisher traditions
- **Leads** — matched to awareness level (offer, promise, mechanism, problem, story)
- **8 body copy modes** — Story, Contrarian Rant, Insider Reveal, Data Exposé, Rapid-Fire List, Confession/First-Person, Question Chain, Comparison/Versus — each with opening templates, tone guidance, use cases, and common traps
- **Bullets & fascinations** — curiosity, benefit, fear, objection-killer, proof patterns
- **Mechanisms** — name it, explain it, differentiate it
- **Offer stacks** — value stacking that makes the price feel like a steal
- **Guarantees** — risk reversal from standard to aggressive
- **CTAs** — one clear action, real urgency only
- **Anti-patterns** — AI slop phrases, feature-first copy, weak verbs, vague language
- **AI detection evasion** — Mandatory human-voice patterns that pass GPTZero, Originality.ai, Reddit filters

## Full Framework

See [`copywriter.universal.yaml`](./copywriter.universal.yaml) for the complete system context, instructions, constraints, output format, and examples.

## Reference Materials

- [`references/bullet-frameworks.md`](./references/bullet-frameworks.md) — 20-pattern bullet framework with templates
- [`references/formulas.md`](./references/formulas.md) — Copywriting formulas
- [`references/anti-patterns.md`](./references/anti-patterns.md) — What to avoid
- [`references/swipe-file.md`](./references/swipe-file.md) — Annotated catalog of high-performing ads with technique breakdowns
- [`references/swipe-images/`](./references/swipe-images/) — Visual reference library (LOOK at images when crafting ad copy)

## Social Media Copy

This skill is the **single authority** for all social media writing. Platform API skills (`x-engagement`, `linkedin-publisher`) handle posting mechanics only — this skill handles what to write.

### Organic Post Character Limits

| Platform | Max Length | Optimal | Notes |
|----------|-----------|---------|-------|
| X/Twitter | **280 chars** | 240-270 | If over 280, REWRITE — never truncate. Use threading for longer content. |
| LinkedIn | 3,000 chars | 900-1,600 | Hook must grab in first 210 chars (truncation point). Short paragraphs. |
| Reddit | 40,000 chars | 300-800 | No markdown headers. Sound human, not polished. Personal angle required. |
| Email subject | 50 chars | 30-45 | Mobile-first. |
| Instagram | 2,200 chars | 150-300 | Visual-first, caption supports image. |

### Paid Ad Copy Character Limits (Critical — Truncation Kills Curiosity Gaps)

| Platform | Headline | Primary/Lead-in | Description |
|----------|----------|-----------------|-------------|
| **Meta Feed** | **≤27 chars** (hard cut mobile) | ≤125 before "See more" | ≤25 chars |
| Meta Carousel | ≤45 chars | ≤80 chars | ≤18 chars |
| **TikTok** | N/A (no headline field) | ≤100 caption | N/A |
| **LinkedIn** | **≤60 chars** (cut at ~70) | ≤150 chars (clicks cost CPC!) | ≤70 chars |
| **X/Twitter** | ≤50 card headline | ≤270 tweet | Hidden on mobile |
| **Email** | N/A | N/A | N/A |
| Email subject | **≤45 chars** | Preview text ≤90 | N/A |

See `copywriter.universal.yaml` → "Platform Ad Copy Character Limits" for full details, platform-specific rules, and the practical zone mapping.

### Social Copy Structure

**Hook → Value → CTA:**
- **Hook:** First 1-2 lines must stop the scroll. Use the headline principles above.
- **Value:** Deliver one specific insight. No fluff. Specificity beats generality.
- **CTA:** One action (if applicable). On X, often no CTA — pure value performs better.

### Threading (X)
- Each tweet in a thread must stand alone AND flow as a sequence
- Number tweets (1/7) for threads >3 tweets
- Each tweet costs API credits — budget 5-7 tweets max per thread

## Relationship to Other Skills

| Skill | Role | Relationship |
|-------|------|--------------|
| `social-repurposer` | Transforms long-form content to social formats | Uses **this skill** for writing quality |
| `cold-outreach` | Outreach-specific messaging and sequences | Follows **this skill's** persuasion principles |
| `ad-creative` | Ad visual execution (graphic designer) | Receives the 5-zone ad brief from **this skill** and produces the image |
| `seo-content-creation` | SEO articles and content | Follows **this skill** for writing quality |
| `x-engagement` | X/Twitter API operations only | No copy (API only) |
| `linkedin-publisher` | LinkedIn API operations only | No copy (API only) |

## Brand Context

For brand-specific tone, follow the active brand context loaded via agent context. This skill provides the universal craft of persuasive writing — brand voice is layered on top, not baked in.
