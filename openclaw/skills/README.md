# OpenClaw Skills

These are your AI agent's capabilities — specialized instructions that tell it how to handle specific types of requests.

## Installed Skills

| Skill | What It Does |
|-------|-------------|
| **copywriter** | Write social posts, ads, emails in your brand voice |
| **social-repurposer** | Turn one piece of content into posts for multiple platforms |
| **message-responder** | Draft replies to customer texts and messages |
| **estimate-writer** | Generate professional estimates from your price book |
| **email-triage** | Sort and safely process incoming emails |
| **competitive-landscape** | Research competitors, customer language, and market gaps |
| **offer-architect** | Build stronger offers with positioning, pricing, and guarantees |

## How Skills Work

Each skill is a folder with a `SKILL.md` file — plain text instructions. The AI reads these when it needs to perform that type of task.

Skills automatically use your `knowledge/` and `pricebook/` data. The more complete those are, the better every skill performs.

## Adding Skills

Drop a new folder with a `SKILL.md` file here. Run `setup.sh` to activate it.
