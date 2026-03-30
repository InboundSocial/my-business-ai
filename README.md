# Your AI Business Operating System

**Your personal AI workspace.** This is where your business knowledge lives — your services, pricing, FAQ, and more. The AI reads YOUR data to give answers specific to YOUR business.

---

## Quick Start

1. **Clone this repo** — Your instructor will walk you through this
2. **Run `setup.sh`** — This sets everything up for you
3. **Start your first conversation** — Ask the AI anything about your business

---

## What's Inside

| Folder | What It Is |
|--------|-----------|
| `knowledge/` | Your business facts — services you offer, FAQ, policies, call scripts. The AI reads these to answer questions about YOUR business. |
| `pricebook/` | Your pricing data. Built by the `/build-pricebook` command. The AI uses this to give estimates and quotes. |
| `data/` | Your business database — customer lists, job history, CRM exports. Imported via `/import-data`. |
| `openclaw/` | Your AI agent configuration — its skills, personality, and workspace. |
| `.agents/skills/` | Slash commands for VS Code (Amp Code). Things like `/build-pricebook` and `/import-knowledge`. |
| `.claude/commands/` | Same slash commands but for Claude Code. |

---

## Getting Started Commands

Type these in your AI chat to get started:

| Command | What It Does |
|---------|-------------|
| `/import-knowledge` | Import your business knowledge — services, FAQ, policies, call scripts |
| `/build-pricebook` | Build your flat-rate price book with real pricing math |
| `/import-data` | Import bulk data — customer lists, job history, CRM exports |

---

## Two Kinds of Memory

Your AI has two ways to store information:

1. **Files you can read and edit** (`knowledge/` and `pricebook/`) — Your business profile, FAQ, scripts, pricing. Open these in VS Code anytime.
2. **A searchable database** (`data/business.db`) — For big data like customer lists and job history. The AI manages this — you just ask questions.

Both are created by `setup.sh`. Both are used by every skill and command.

---

## How It Works

The AI reads your `knowledge/` and `pricebook/` files to answer questions with YOUR data.

Generic ChatGPT gives generic answers. **YOUR AI gives answers specific to your business.**

---

*Built for the AI Operating System Seminar*
