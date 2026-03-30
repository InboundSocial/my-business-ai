#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# AI Business Operating System — Setup Script
# ============================================================
# This script sets up your local OpenClaw runtime from the repo.
# Initializes the business database and links the agent workspace.
# Run once after cloning. Run again anytime you add skills.
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$SCRIPT_DIR"
OPENCLAW_DIR="$HOME/.openclaw"
AGENT_DIR="$REPO_ROOT/openclaw/agents/main"
AGENT_YAML="$AGENT_DIR/agent.yaml"

echo ""
echo "🔧 AI Business Operating System — Setup"
echo "========================================="
echo ""

# ----------------------------------------------------------
# Step 1: Check prerequisites
# ----------------------------------------------------------
echo "📋 Checking prerequisites..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 20+ first."
    echo "   Mac: brew install nvm && nvm install 20"
    echo "   Windows: choco install nvm && nvm install 20"
    exit 1
fi

NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version is too old ($(node -v)). Please install Node.js 20+."
    exit 1
fi

echo "✅ Node.js $(node -v)"

if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

echo "✅ Git $(git --version | awk '{print $3}')"

# ----------------------------------------------------------
# Step 2: Check agent manifest exists
# ----------------------------------------------------------
if [ ! -f "$AGENT_YAML" ]; then
    echo "❌ Agent manifest not found at $AGENT_YAML"
    echo "   Make sure you're running this from the repo root."
    exit 1
fi

echo "✅ Agent manifest found"

# ----------------------------------------------------------
# Step 3: Initialize business database
# ----------------------------------------------------------
DATA_DIR="$REPO_ROOT/data"
DB_FILE="$DATA_DIR/business.db"
SCHEMA_FILE="$DATA_DIR/schema.sql"

if [ -f "$DB_FILE" ]; then
    echo ""
    echo "📊 Checking business database..."
    if command -v sqlite3 &> /dev/null; then
        CUST_COUNT=$(sqlite3 "$DB_FILE" "SELECT COUNT(*) FROM customers;" 2>/dev/null || echo "0")
        JOBS_COUNT=$(sqlite3 "$DB_FILE" "SELECT COUNT(*) FROM jobs;" 2>/dev/null || echo "0")
        DOCS_COUNT=$(sqlite3 "$DB_FILE" "SELECT COUNT(*) FROM documents;" 2>/dev/null || echo "0")
        echo "✅ Database exists ($CUST_COUNT customers, $JOBS_COUNT jobs, $DOCS_COUNT documents)"
    else
        echo "✅ Database exists at $DB_FILE"
    fi
else
    echo ""
    echo "📊 Setting up business database..."
    mkdir -p "$DATA_DIR"
    if [ ! -f "$SCHEMA_FILE" ]; then
        echo "⚠️  Schema file not found at $SCHEMA_FILE — skipping database setup"
    elif command -v sqlite3 &> /dev/null; then
        sqlite3 "$DB_FILE" < "$SCHEMA_FILE"
        echo "✅ Database created at $DB_FILE"
        echo "   Tables: customers, jobs, documents"
    else
        echo "⚠️  sqlite3 not found — skipping database setup"
        echo "   Install sqlite3 and re-run setup to create the database."
    fi
fi

# ----------------------------------------------------------
# Step 4: Create OpenClaw runtime directory
# ----------------------------------------------------------
echo ""
echo "📁 Setting up OpenClaw runtime at $OPENCLAW_DIR..."

mkdir -p "$OPENCLAW_DIR"
mkdir -p "$OPENCLAW_DIR/skills"

# ----------------------------------------------------------
# Step 5: Symlink agent workspace
# ----------------------------------------------------------
WORKSPACE_SRC="$AGENT_DIR/workspace"
WORKSPACE_DST="$OPENCLAW_DIR/workspace"

if [ -L "$WORKSPACE_DST" ]; then
    rm "$WORKSPACE_DST"
elif [ -d "$WORKSPACE_DST" ]; then
    echo "⚠️  Existing workspace directory found at $WORKSPACE_DST"
    echo "   Backing up to ${WORKSPACE_DST}.backup.$(date +%Y%m%d%H%M%S)"
    mv "$WORKSPACE_DST" "${WORKSPACE_DST}.backup.$(date +%Y%m%d%H%M%S)"
fi

ln -sf "$WORKSPACE_SRC" "$WORKSPACE_DST"
echo "✅ Workspace linked: $WORKSPACE_DST → $WORKSPACE_SRC"

# ----------------------------------------------------------
# Step 6: Create shared/ symlinks for knowledge and pricebook
# ----------------------------------------------------------
SHARED_DIR="$WORKSPACE_SRC/shared"
mkdir -p "$SHARED_DIR"

# Knowledge symlink
if [ -L "$SHARED_DIR/knowledge" ]; then
    rm "$SHARED_DIR/knowledge"
fi
ln -sf "$REPO_ROOT/knowledge" "$SHARED_DIR/knowledge"
echo "✅ Knowledge linked: shared/knowledge/ → knowledge/"

# Pricebook symlink
if [ -L "$SHARED_DIR/pricebook" ]; then
    rm "$SHARED_DIR/pricebook"
fi
ln -sf "$REPO_ROOT/pricebook" "$SHARED_DIR/pricebook"
echo "✅ Pricebook linked: shared/pricebook/ → pricebook/"

# ----------------------------------------------------------
# Step 7: Symlink skills from agent manifest
# ----------------------------------------------------------
echo ""
echo "🧩 Linking skills from agent manifest..."

# Parse skills from agent.yaml (simple grep — no yq dependency needed)
SKILLS=$(grep -A 100 '^skills:' "$AGENT_YAML" | grep '^\s*-\s*' | sed 's/^\s*-\s*//' | head -20)

SKILL_COUNT=0
while IFS= read -r skill; do
    skill=$(echo "$skill" | tr -d '[:space:]')
    [ -z "$skill" ] && continue

    SKILL_SRC="$REPO_ROOT/openclaw/skills/$skill"
    SKILL_DST="$OPENCLAW_DIR/skills/$skill"

    if [ ! -d "$SKILL_SRC" ]; then
        echo "⚠️  Skill '$skill' listed in manifest but not found at $SKILL_SRC — skipping"
        continue
    fi

    if [ -L "$SKILL_DST" ]; then
        rm "$SKILL_DST"
    fi

    ln -sf "$SKILL_SRC" "$SKILL_DST"
    echo "  ✅ $skill"
    SKILL_COUNT=$((SKILL_COUNT + 1))
done <<< "$SKILLS"

echo "✅ $SKILL_COUNT skills linked"

# ----------------------------------------------------------
# Step 8: Create runtime artifacts (gitignored)
# ----------------------------------------------------------
echo ""
echo "📝 Creating runtime files..."

# Memory directory
mkdir -p "$WORKSPACE_SRC/memory"

# MEMORY.md (runtime only — not committed)
if [ ! -f "$WORKSPACE_SRC/MEMORY.md" ]; then
    cat > "$WORKSPACE_SRC/MEMORY.md" << 'EOF'
# Memory

Runtime memory for the AI agent. This file is generated and gitignored.
EOF
    echo "✅ MEMORY.md created"
else
    echo "✅ MEMORY.md already exists"
fi

# ----------------------------------------------------------
# Done
# ----------------------------------------------------------
echo ""
echo "========================================="
echo "✅ Setup complete!"
echo "========================================="
echo ""
echo "Your AI workspace is ready. Here's what was set up:"
echo ""
echo "  📁 ~/.openclaw/workspace/  → Your agent's workspace"
echo "  📁 ~/.openclaw/skills/     → $SKILL_COUNT active skills"
echo "  📁 shared/knowledge/       → Your business knowledge"
echo "  📁 shared/pricebook/       → Your pricing data"
echo "  📊 data/business.db        → Your business database"
echo ""
echo "Next steps:"
echo "  1. Open this folder in VS Code"
echo "  2. Run /import-knowledge to add your business info"
echo "  3. Run /build-pricebook to set up your pricing"
echo "  4. Run /import-data to load your customer and job data"
echo ""
