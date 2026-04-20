# 1000x Growth System - Onboarding Playbook

Step-by-step guide for onboarding a new client onto the 1000x Growth System. This is an operator's working document - follow it top to bottom for every new client.

---

## Phase 1: Setup (Day 1)

- [ ] Create client in Supabase `clients` table, record the `client_id`
- [ ] Clone the `my-business-ai` template for this client
- [ ] Set up their `.env` with Supabase credentials scoped to their `client_id`

---

## Phase 2: Capture Knowledge (Days 1-3)

### Run `/import-knowledge` to walk them through:

- [ ] **Business profile** - name, trade, location, team size, differentiators
- [ ] **Service catalog** - every service they offer
- [ ] **FAQ** - common customer questions with their answers
- [ ] **Scripts** - phone greeting, pricing questions, objection handling
- [ ] **Policies** - warranty, payment, cancellation, guarantees

### Build pricing and import data:

- [ ] Run `/build-pricebook` if they're a trade business (plumbing, HVAC, electrical, etc.)
- [ ] Import any existing data (customer lists, job history) with `/import-data`
- [ ] Sync knowledge to Supabase:
  ```
  node scripts/sync-knowledge-to-supabase.js --client-id CLIENT_ID --knowledge-dir ./knowledge
  ```

---

## Phase 3: Build Systems (Days 3-10)

All 10 systems plus the agent layer. Check each off as it goes live.

- [ ] **1. Lead Generation** - ad accounts, attribution tracking, lead capture forms/pages
- [ ] **2. Speed-to-Lead** - sub-60-second response automation in GHL
- [ ] **3. AI Receptionist** - agent definition in Supabase, VAPI phone number, voice config, knowledge injection
- [ ] **4. Quoting & Estimates** - templates built from pricebook, proposal delivery method
- [ ] **5. Follow-up & Nurture** - estimate follow-up sequences in GHL
- [ ] **6. Booking & Scheduling** - calendar setup, confirmation and reminder sequences
- [ ] **7. Job Management** - status tracking, completion checklists
- [ ] **8. Billing & Payments** - invoice automation, payment follow-up
- [ ] **9. Reviews & Reputation** - post-job review requests, AI review responses
- [ ] **10. Client Retention** - maintenance plans, seasonal campaigns, reactivation sequences
- [ ] **Agent Layer** - queryable agent scoped to `client_id`, dashboard metrics wired up

---

## Phase 4: Test (Days 10-12)

End-to-end test of every system:

- [ ] Call the AI receptionist, verify it answers correctly
- [ ] Submit a lead, verify speed-to-lead fires
- [ ] Request a quote, verify estimate goes out
- [ ] Book a job, verify confirmation and reminders
- [ ] Complete a job, verify review request sends
- [ ] Test billing and payment flow
- [ ] Test follow-up and nurture sequences
- [ ] Test retention and reactivation campaigns
- [ ] Verify agent dashboard shows correct metrics
- [ ] Walk client through everything, get sign-off

---

## Phase 5: Go Live (Days 12-14)

- [ ] Port or activate the client's phone number
- [ ] Switch all systems from test mode to live
- [ ] Monitor the first 48 hours closely
- [ ] Daily check-in with the client for the first week

---

## Phase 6: Ongoing (Office OS only)

- Monitor daily, review weekly, optimize monthly
- Monthly performance report to the client
- Continuously improve based on real data - call recordings, response times, conversion rates

---

## What We Need From the Client

Send this checklist to the client before onboarding starts:

1. [ ] **Business basics** - business name, address, service area, team size, years in business
2. [ ] **Services list** - everything they offer, even if it's just a rough list
3. [ ] **Pricing info** - current rates, material costs, labor rates, or however they price today
4. [ ] **Phone answering preferences** - how they want calls answered, tone, greeting
5. [ ] **FAQ and answers** - the questions customers ask most, and how they answer them
6. [ ] **Policies** - warranty terms, payment terms, cancellation policy, guarantees
7. [ ] **Tool access** - logins or invites to their CRM, booking tool, invoicing system
8. [ ] **Ad accounts** - access to Google Ads, Facebook Ads, LSA if applicable
9. [ ] **Customer data exports** - any CSV or spreadsheet of past customers, job history

> If they don't have this organized, that's fine. The guided onboarding wizard (`/import-knowledge`) walks them through it conversationally and builds the files for them.

---

## Access Control

- **Client's agents** query data with `WHERE client_id = 'their_id'` - they only see their own stuff
- **Mike / 1000x operator** queries without a filter and can see everything across all clients
