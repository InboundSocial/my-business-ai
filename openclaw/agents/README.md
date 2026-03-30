# Agent Templates

Each subdirectory here is an agent — a persona with specific skills, knowledge access, and personality.

## Current Agents

| Agent | Role | Skills |
|-------|------|--------|
| **main** | General business assistant | copywriter, message-responder, estimate-writer, social-repurposer, email-triage |

## Adding Agents

Create a new directory with:
- `agent.yaml` — manifest declaring role, skills, knowledge scope
- `workspace/` — SOUL.md (personality), AGENTS.md (routing), USER.md, IDENTITY.md

Run `setup.sh` to activate.
