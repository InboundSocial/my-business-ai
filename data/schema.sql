-- ============================================================
-- AI Business Operating System — Database Schema
-- ============================================================
-- This database stores bulk business data that doesn't fit in
-- markdown files: customer lists, job history, CRM exports,
-- documents, and anything else your AI needs to search through.
--
-- Created automatically by setup.sh. Don't edit this file
-- unless you know what you're doing.
-- ============================================================

-- Customers: imported from CRM exports, spreadsheets, or manual entry
CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    full_name TEXT,
    phone TEXT,
    email TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    zip TEXT,
    source TEXT,               -- how they found you (google, referral, etc.)
    notes TEXT,
    tags TEXT DEFAULT '[]',    -- JSON array of tags
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now'))
);

-- Jobs: service history imported from CRM or manual entry
CREATE TABLE IF NOT EXISTS jobs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER REFERENCES customers(id),
    title TEXT NOT NULL,        -- e.g., "Water Heater Install"
    category TEXT,              -- e.g., "Installation"
    status TEXT DEFAULT 'completed',  -- scheduled, in_progress, completed, cancelled
    scheduled_date TEXT,
    completed_date TEXT,
    technician TEXT,
    revenue REAL,
    cost REAL,
    profit REAL,
    address TEXT,
    city TEXT,
    zip TEXT,
    notes TEXT,
    source TEXT,                -- lead source
    tags TEXT DEFAULT '[]',
    created_at TEXT DEFAULT (datetime('now'))
);

-- Documents: catch-all for imported files, transcripts, notes, etc.
CREATE TABLE IF NOT EXISTS documents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    source_file TEXT,           -- original filename if imported
    source_type TEXT DEFAULT 'note',  -- csv, pdf, transcript, note, url
    content TEXT NOT NULL,
    summary TEXT,
    category TEXT DEFAULT 'general',
    tags TEXT DEFAULT '[]',
    created_at TEXT DEFAULT (datetime('now'))
);

-- Indexes for fast lookups
CREATE INDEX IF NOT EXISTS idx_customers_zip ON customers(zip);
CREATE INDEX IF NOT EXISTS idx_customers_phone ON customers(phone);
CREATE INDEX IF NOT EXISTS idx_customers_name ON customers(full_name);
CREATE INDEX IF NOT EXISTS idx_jobs_category ON jobs(category);
CREATE INDEX IF NOT EXISTS idx_jobs_zip ON jobs(zip);
CREATE INDEX IF NOT EXISTS idx_jobs_date ON jobs(completed_date DESC);
CREATE INDEX IF NOT EXISTS idx_jobs_customer ON jobs(customer_id);
CREATE INDEX IF NOT EXISTS idx_docs_category ON documents(category);
CREATE INDEX IF NOT EXISTS idx_docs_type ON documents(source_type);
