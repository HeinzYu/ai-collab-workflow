---
name: ai-collab-workflow
description: Initialize any project (Apple App / Web / Backend / Game) with a structured documentation framework for human-AI collaborative development. Creates AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, all module placeholders, and supplementary chapters automatically. Invoke when user describes a new project or wants to adopt the workflow into an existing codebase.
---

# AI Collaborative Development Workflow

> A structured documentation framework for human + AI collaborative development using TRAE.
> Supports Apple App, Web, Backend, Game, and any software project type.
> Designed for both human developers and TRAE Agent.
> **Version:** 1.2 | **Last Updated:** 2026-06-28

---

## When to Use

Invoke this skill when:
- Starting a **new project** of any type (Apple App, Web, Backend, CLI tool, Game, etc.)
- The user mentions "initialize", "new project", "template", or describes features they want to build
- The user wants to **adopt the workflow into an existing project** (e.g., "帮我给这个项目加上协同工作流")
- You need a structured way to organize project documentation across multiple TRAE sessions

---

## Quick Start: Trigger Phrases

| User says | Mode |
|-----------|------|
| "这是一个完整的 Apple App 项目，包含登录、首页等功能" | **Full** |
| "这是一个 Web 项目，包含用户系统、商品管理等功能" | **Full** (with project type detection) |
| "这是一个简单的工具 App，只需要登录和首页功能" | **Small** |
| "这是一个原型验证，只需要一个页面" | **MVP** |
| "帮我给这个项目加上协同工作流" | **Merge into existing** |
| "为这个项目初始化协作开发模板" | **Merge into existing** |

---

## Directory Structure After Initialization

```
Project/
├── AGENTS.md                    ★ Core TRAE interaction rules (always detailed)
├── PROJECT_CONTEXT.md           ★ Project goals, features, health dashboard
├── MODEL_CONFIG.md              ★ Local model config + switching decision tree
├── REFERENCES.md                ★ Large file index (doc/PDF/Figma)
├── TEMPLATE_GUIDE.md            ★ Template usage guide
├── STRUCTURE.md                 ◉ Directory structure overview

# Expand-on-demand modules (placeholders initially):
├── PRD/                         ○ Feature requirement documents
├── ARCHITECTURE/                ○ Tech stack, dependencies, build config
├── TESTING/                     ○ Test strategy, scripts, coverage
├── DEPLOYMENT/                  ○ Release process, App Store, CI/CD
├── DEVLOG/                      ○ Daily development logs (auto-generated)
├── CONTINUE/                    ○ Module summaries + decision logs
├── SUPPLEMENTARY/               ○ Deep-dive supplementary chapters
└── ARCHIVE/                     ◉ Monthly/quarterly summaries (created on first maintenance)
```

---

## Project Initialization: Three Modes

### 1. Full Commercial Project (Default)

**Trigger:** "这是一个完整的 Apple App 项目，包含 [features]...等功能"

**Actions:**
1. Generate complete directory structure
2. Initialize all core files (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, REFERENCES.md, TEMPLATE_GUIDE.md, STRUCTURE.md)
3. Initialize all module placeholders (PRD/, ARCHITECTURE/, TESTING/, DEPLOYMENT/, DEVLOG/, CONTINUE/)
4. Initialize all SUPPLEMENTARY/ chapters (S01-S07)
5. Create CONTINUE/decision-log/ template
6. Record source documents in REFERENCES.md (if any)

### 2. Small Tool Project

**Trigger:** "这是一个简单的工具 App，只需要 [feature1] 和 [feature2]"

**Actions:**
1. Generate core files + selected module placeholders
2. Skip TESTING/, DEPLOYMENT/
3. Mark `scope` as `"small"` in PROJECT_CONTEXT.md

### 3. MVP (Minimum Viable Product)

**Trigger:** "这是一个原型验证，只需要 [one feature]"

**Actions:**
1. Generate core files + only the corresponding PRD placeholder
2. Skip all other modules, mark `scope` as `"mvp"`

---

## ⚠️ Existing Project Detection & Merge Strategy (CRITICAL — Read First)

**BEFORE initializing any files, TRAE MUST check whether the target directory is an existing project.**

### Detection: Is this an existing project?

Check for the following signals in the working directory:
- Any source code files (`.swift`, `.ts`, `.js`, `.py`, `.go`, `.rs`, `.java`, `.kt`, etc.)
- Any `package.json`, `Cargo.toml`, `go.mod`, `Podfile`, `requirements.txt`, etc.
- Any `.git/` directory
- Any existing `AGENTS.md`, `PROJECT_CONTEXT.md`, or `TEMPLATE_GUIDE.md`

**If ANY of these exist → treat as existing project. Do NOT blindly overwrite.**

### Merge Mode: Adding workflow to an existing project

When the user says things like "帮我给这个项目加上协同工作流" or "为这个项目初始化协作开发模板", TRAE MUST:

1. **Inventory existing files** — list all files already in the directory
2. **Present a plan** before writing anything:
   ```
   检测到这是一个已有项目。我建议以下操作：
   - 保留现有源码文件（不修改）
   - 新增以下框架文件：AGENTS.md, PROJECT_CONTEXT.md, ...
   - 以下文件已存在，建议：[跳过 / 合并 / 备份]
   - 请问如何继续？
   ```
3. **Never overwrite** — existing files are only merged with explicit user consent
4. **Fill PROJECT_CONTEXT.md from context** — auto-detect tech stack from existing files (e.g., `package.json` → "Node.js project")
5. **Create DEVLOG/ and CONTINUE/** — but do NOT create PRD/ placeholders for already-implemented features

### Per-file merge rules

| If this file already exists | TRAE action |
|------------------------------|-------------|
| `AGENTS.md` | Ask: keep existing, replace, or merge? |
| `PROJECT_CONTEXT.md` | Auto-fill from existing codebase analysis; ask about conflicting fields |
| `MODEL_CONFIG.md` | Add if missing; skip if exists |
| `REFERENCES.md` | Add if missing; skip if exists |
| Any source code | **NEVER touch** — only read for context |
| `PRD/*.md` | Skip if module already implemented |
| `DEVLOG/` | Always safe to create (new log files only) |

---

## Non-Apple App Project Adaptation

This workflow was originally designed for Apple App (SwiftUI) projects but is **fully adaptable** to any project type. TRAE must auto-detect and adapt.

### Project Type Detection

| Signal in directory | Detected Type | Adaptations |
|---------------------|---------------|-------------|
| `.swift` files, `Package.swift`, `.xcodeproj` | **Apple App (SwiftUI)** | Default — use "iOS / Swift / SwiftUI" in tech stack |
| `package.json` + `next.config.*` / `vite.config.*` | **Web Frontend** | Tech stack → "React/Next.js/Vue + TypeScript"; rename `app-store-guide.md` → `deploy-guide.md` |
| `package.json` + `express` / `fastify` in deps | **Node.js Backend** | Tech stack → "Node.js + Express/Fastify"; skip `app-store-guide.md` |
| `requirements.txt` / `pyproject.toml` | **Python Project** | Tech stack → "Python + FastAPI/Django/etc."; adjust architecture docs |
| `Cargo.toml` | **Rust Project** | Tech stack → "Rust + [framework]"; adjust docs |
| `go.mod` | **Go Project** | Tech stack → "Go + [framework]"; adjust docs |
| `Podfile` / `.xcworkspace` | **iOS (UIKit/SwiftUI)** | Keep Apple path |
| Unity/Unreal project files | **Game Project** | Tech stack → "Unity/C# or Unreal/C++"; rename module structure to fit game dev |

### Non-Apple adaptations checklist

When the project is NOT an Apple App, TRAE MUST:

1. **Rename DEPLOYMENT/app-store-guide.md** → `DEPLOYMENT/deploy-guide.md` (web/server deploy instead of App Store)
2. **Update ARCHITECTURE/tech-stack.md** placeholder content to match detected tech stack
3. **Adjust AGENTS.md trigger phrases** — change "Apple App" references to match the detected project type
4. **Update PROJECT_CONTEXT.md** tech stack section:
   - "平台：iOS（SwiftUI）" → detected platform
   - "语言：Swift / SwiftUI" → detected language
   - "设计工具：Figma" → keep (universal)
5. **Skip Apple-specific modules** if not applicable (e.g., no App Store for web projects)

### Example: Web project initialization

User says: "这是一个 Web 项目，包含用户登录、商品管理功能"

TRAE detects: empty directory → new project

TRAE output:
```
检测到新 Web 项目。使用 ai-collab-workflow 初始化。

目录结构：
├── AGENTS.md           ★ 协同规则（已适配 Web 项目）
├── PROJECT_CONTEXT.md   ★ 项目信息（web/React）
├── MODEL_CONFIG.md     ...
├── PRD/                ○ login.md, product-management.md
├── ARCHITECTURE/       ○ tech-stack.md (→ "React / Next.js / TypeScript")
├── DEPLOYMENT/         ○ deploy-guide.md (instead of app-store-guide.md)
...

准备好了。需要我先展开哪个模块的详细文档？
```

---

## Core Files (Always Detailed — Never Skip)

| File | Purpose | Maintained By |
|------|---------|---------------|
| `AGENTS.md` | TRAE interaction rules, context lifecycle layers (§11), maintenance checklists (§12), conversation strategy (§13), decision log management (§14), daily checklist (§15) | TRAE |
| `PROJECT_CONTEXT.md` | Project goals, feature list, tech overview, memory decay strategy (§9), health dashboard (§10), maintenance tracking | Human + TRAE |
| `MODEL_CONFIG.md` | Local model config (oMLX/Gemma/Qwen), model switching decision tree, dialogue management strategy | TRAE |
| `REFERENCES.md` | Large file index and summaries (doc/PDF/Figma) | TRAE |
| `TEMPLATE_GUIDE.md` | Template usage guide with FAQ and quick reference | TRAE |
| `STRUCTURE.md` | Directory structure overview and file relationship diagram | TRAE |

---

## Module Expansion Guide

When the user requests a detailed document for a module:

| User Command | Target File |
|-------------|-------------|
| "生成 [模块名] 功能的详细 PRD" | `PRD/<module>.md` → detailed document |
| "完善技术架构" | `ARCHITECTURE/tech-stack.md` → detailed |
| "完善依赖管理" | `ARCHITECTURE/dependencies.md` → detailed |
| "完善构建配置" | `ARCHITECTURE/build-config.md` → detailed |
| "完善测试策略" | `TESTING/test-strategy.md` → detailed |
| "完善自动化脚本" | `TESTING/automation-scripts.md` → detailed |
| "完善覆盖率要求" | `TESTING/coverage-requirements.md` → detailed |
| "完善发布流程" | `DEPLOYMENT/release-process.md` → detailed |
| "完善 App Store 提交指南" | `DEPLOYMENT/app-store-guide.md` → detailed |
| "完善 CI/CD 配置" | `DEPLOYMENT/cicd-config.md` → detailed |

**On expansion:**
1. Replace placeholder file with complete chapter structure
2. Each expanded file includes: goal description, chapter list, filling guide
3. Record the expansion in `CONTINUE/module-expanded-<name>.md`

---

## SUPPLEMENTARY/ Chapters (Deep-Dive Reference)

These 7 chapters are initialized as detailed documents during project creation. They are read on-demand — not loaded into context automatically.

| ID | File | Content |
|----|------|---------|
| S01 | `S01-prompt-engineering.md` | Recommended/forbidden prompt templates, full prompt library for feature, refactor, review, and design tasks |
| S02 | `S02-trae-best-practices.md` | Deep guide: Rules, Memory, Workspace, Worktree, Context, Tool Call, Conversation |
| S03 | `S03-model-switching-decision-tree.md` | Complete decision tree: when to use Gemma vs Qwen vs cloud models; context window constraint checks; network state adaptation |
| S04 | `S04-long-term-project-strategy.md` | 3-month/6-month/1-year strategies: how AI continuously understands projects, cross-session recovery protocol, knowledge decay curve management |
| S05 | `S05-omlx-best-practices.md` | Context, Memory, SSD Cache, Profile, Benchmark, Runtime, Memory Guard complete guide |
| S06 | `S06-agent-task-granularity.md` | Task granularity decision guide: what not to do / what to do; Apple App complete decomposition example (analysis→modeling→UI→network→animation→accessibility→testing→review) |
| S07 | `S07-appendices.md` | Directory templates, prompt templates, continue templates, decision templates, devlog templates, Apple Native Project templates, Game Project templates |

**Quick jump index for reference:**

| Scenario | Primary Doc Section | Supplementary Chapter |
|----------|-------------------|-----------------------|
| "What prompt to use?" | AGENTS.md §10 | S01-prompt-engineering.md |
| "How to configure TRAE?" | AGENTS.md §6, §7 | S02-trae-best-practices.md |
| "Which model to use?" | AGENTS.md §6, MODEL_CONFIG.md | S03-model-switching-decision-tree.md |
| "Project over 1 month?" | PROJECT_CONTEXT.md §9 | S04-long-term-project-strategy.md |
| "Local model performance tuning" | MODEL_CONFIG.md | S05-omlx-best-practices.md |
| "How to split tasks?" | AGENTS.md §7 | S06-agent-task-granularity.md |
| "Need template files?" | STRUCTURE.md | S07-appendices.md |

---

## Module Summary Mechanism (CONTINUE/)

After completing a feature module:

**Trigger:** User completes a feature OR manually requests a summary.

**Actions:**
1. Read `PRD/<module>.md` for requirements
2. Read `DEVLOG/` logs during the module's development period
3. Generate `CONTINUE/<module>-summary.md` containing:
   - Feature overview (2-3 sentences)
   - Key technical decisions
   - Known issues and todos
   - Related file path index

---

## Decision Log Management (CONTINUE/decision-log/)

Record important technical decisions for cross-session context recovery.

**When to record:**
- Tech stack or framework version selection
- Architecture pattern choice (MVVM, Clean Architecture, etc.)
- Data persistence strategy selection
- UI/UX design decisions (layout, interaction method)
- Requirement changes (add/remove/modify features)
- Performance optimization strategy selection
- Third-party library or API selection

**File naming:** `CONTINUE/decision-log/YYYY-MM-DD-[module]-[short-title].md`

**Decision log format:**
```markdown
## Decision Log: [Brief title]
- **Date:** YYYY-MM-DD
- **Module:** [Related module name]
- **Decision Type:** Architecture / Tech Selection / Requirement Change / UI Design / Performance / Other
- **Background:** Why this decision was needed
- **Option A:** [Description] — Pros / Cons
- **Option B:** [Description] — Pros / Cons
- **Final Decision:** Which option and why
- **Impact Scope:** Affected files and modules
- **Review Date:** YYYY-MM-DD (recommended 30 days later)
```

---

## Development Log Mechanism (DEVLOG/)

Daily activity recording:

**Trigger:** New TRAE conversation OR manual log entry.

**Actions:**
1. Check if `DEVLOG/YYYY-MM-DD.md` exists for today
2. If not, create new file with: date, session summary, task list
3. If yes, append new log entry

**Periodic maintenance logs:**
- Weekly: `DEVLOG/weekly-YYYY-WXX.md` (moved to ARCHIVE/ during monthly maintenance)
- After maintenance: Update maintenance tracking dates in PROJECT_CONTEXT.md

---

## Archive Mechanism (ARCHIVE/)

Created automatically on first maintenance execution:

| File | Content | Created By |
|------|---------|------------|
| `ARCHIVE/monthly-YYYY-MM.md` | Monthly summary: completed features, tech decisions, known issues | Monthly maintenance |
| `ARCHIVE/quarterly-YYYY-QX.md` | Quarterly audit: project health, scope assessment, config review | Quarterly maintenance |
| `ARCHIVE/weekly-YYYY-WXX.md` | Weekly summary: completed items, next week plan | Moved from DEVLOG/ during monthly maintenance |

---

## Context Lifecycle Layers (AGENTS.md §11)

Five-layer context architecture for managing document persistence:

| Layer | Retention | Auto-load | Cleanup Strategy | Examples |
|-------|-----------|-----------|------------------|----------|
| **Permanent** | Project lifetime | Every session | Human decides removal | AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md |
| **Stable** | Project lifetime | On-demand (via path) | Human decides archival | CONTINUE/*-summary.md, completed PRDs |
| **Working** | Current dev cycle | Current session | Demote to stable on module completion | Active PRD, recent DevLog |
| **Temporary** | 30 days | Not auto-loaded | Mark as disposable on monthly cleanup | DevLogs 7-30 days old |
| **Disposable** | Unlimited | Not loaded | Physical delete on quarterly cleanup | DevLogs >30 days old |

**Layer transition rules:**
```
Working → (module complete + summary generated) → Stable
Temporary → (monthly cleanup) → Disposable
Disposable → (quarterly cleanup) → Physical delete or archive
```

---

## Periodic Maintenance Checklists (AGENTS.md §12)

### Weekly Maintenance (every 7 days)

**Trigger:** "执行本周项目维护"

**Checklist:**
- [ ] Confirm daily DEVLOG/ records for the week
- [ ] Check for modules in "developing" status over 14 days
- [ ] Confirm recently completed modules have CONTINUE/ summaries
- [ ] Verify milestone status in PROJECT_CONTEXT.md matches actual progress
- [ ] Generate weekly summary `DEVLOG/weekly-YYYY-WXX.md`

### Monthly Maintenance (every 30 days)

**Trigger:** "执行本月项目归档"

**Checklist:**
- [ ] Mark DevLogs >30 days as disposable
- [ ] Check for modules in "not started" status over 30 days; evaluate priority
- [ ] Check if MODEL_CONFIG.md config is still applicable
- [ ] Generate monthly summary `ARCHIVE/monthly-YYYY-MM.md`
- [ ] Update milestone timeline in PROJECT_CONTEXT.md

### Quarterly Maintenance (every 90 days)

**Trigger:** "执行季度项目审计"

**Checklist:**
- [ ] Physically delete or archive disposable DevLogs >90 days
- [ ] Review project scope; assess if adjustment needed (full/small/mvp)
- [ ] Check MODEL_CONFIG.md for local model version updates
- [ ] Assess overall project health (progress, risks, tech debt)
- [ ] Generate quarterly audit `ARCHIVE/quarterly-YYYY-QX.md`

### Maintenance Trigger Methods

| Method | Description |
|--------|-------------|
| Manual trigger | User says "执行本周/月/季度维护" |
| Auto-reminder | TRAE checks maintenance dates on new conversation; reminds if overdue |
| Milestone trigger | Auto-run a maintenance check after completing major modules |

---

## Long-Term Project Memory Decay Strategy (PROJECT_CONTEXT.md §9)

### Three-Layer Memory Architecture

```
External Memory (File System — AI-readable)
├── Permanent: AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md
│   └── Auto-loaded every session, no human intervention needed
├── Stable: Completed PRDs, CONTINUE/ summaries, ARCHIVE/ summaries
│   └── On-demand loading via path, not auto-loaded in full
└── Index: REFERENCES.md, STRUCTURE.md
    └── File location pointers; AI finds needed content via index

Internal Memory (Conversation Context — single session only)
└── Lost at session end unless written to external memory

Human Memory (Experience & Intuition — irreplaceable)
└── Overall project understanding, decision reasoning, judgment
```

### Cross-Month Project Recovery Protocol

When last development was >7 days ago, on new conversation TRAE MUST:
1. Read the last 3 months of ARCHIVE/ monthly summaries (if any)
2. List all completed modules and their summaries
3. Present "project state at last session" including:
   - Last completed module name and date
   - Currently developing module (if any)
   - Known issues and todos
4. Confirm user understanding before starting new development

---

## Project Health Dashboard (PROJECT_CONTEXT.md §10)

A unified view integrating maintenance status, development progress, risk alerts, and system health.

**Dashboard Structure:**
```
Project Health Dashboard — [Project Name]
├── A. Maintenance Status
│   ├── Last Weekly: [YYYY-MM-DD] — [Normal/Overdue]
│   ├── Last Monthly: [YYYY-MM-DD] — [Normal/Overdue]
│   └── Last Quarterly: [YYYY-MM-DD] — [Normal/Overdue]
├── B. Development Progress
│   ├── Total Modules: [X]
│   ├── Completed: [Y] ([Z]%)
│   ├── In Progress: [A]
│   └── Not Started: [B] ([C]%)
├── C. Risk Alerts
│   ├── Overdue Modules: [list]
│   ├── Memory Decay Warnings: [list]
│   └── Technical Risks: [list]
└── D. System Health
    ├── Core File Integrity: [AGENTS.md ✓ / PROJECT_CONTEXT.md ✓ / MODEL_CONFIG.md ✓]
    ├── Decision Log Count: [X] (last 30 days)
    └── Token Usage Trend: [Rising/Stable/Falling] (last 4 weeks)
```

**Health Standards:**
- **Excellent:** Completion >70%, no overdue modules, no warnings
- **Good:** Completion 40-70%, ≤1 overdue module, ≤2 warnings
- **Warning:** Completion 20-40%, >1 overdue module, or >2 warnings
- **Danger:** Completion <20%, or zombie modules (>30 days inactive)

**Dashboard update triggers:**
- New conversation start: auto-generate within first 3 rounds
- Module completion: update development progress
- Maintenance execution: update maintenance status
- Risk alert triggered: display latest alerts

---

## Conversation Strategy (AGENTS.md §13)

### Single Conversation Responsibility Types

| Conversation Type | Core Responsibility | Should NOT Include |
|-------------------|---------------------|---------------------|
| **Init** | Create project structure, core files, determine scope | Actual feature development |
| **Module Dev** | Complete a single feature defined in PRD | Multiple unrelated modules |
| **Debug** | Fix a single error or issue | Multiple unrelated bugs |
| **Refactor** | Refactor a single file or module | Project-wide refactoring |
| **Review** | Code review, architecture review | Development + review simultaneously |
| **Design** | UI/UX design, interaction prototypes | Design + backend simultaneously |
| **Testing** | Write and execute test cases | Mixing new features with testing |

### Recommended Limits

| Constraint | Limit | Notes |
|------------|-------|-------|
| Max conversation rounds | 30 (Q&A = 1 round) | Context quality degrades beyond this |
| Max token usage | 80% of model safe limit | Trigger context overflow handling |
| Max dev time | 2 hours per conversation | Split longer sessions |
| Max file changes | 20 files per conversation | Split into sub-tasks |
| Max code lines | 500 lines new code per conversation | Split into sub-tasks |

### New Chat / Continue / Summary Decision Timing

| Signal | Action |
|--------|--------|
| Context usage reaches 80% | **New Chat** — keep core files, reference history via paths |
| Current module development complete | **Summary** to CONTINUE/, mark as completed |
| Module interrupted >7 days | **New Chat** — load last summary first (recovery protocol) |
| Continuous dev >2 hours or >30 rounds | **Intermediate summary** to CONTINUE/, new chat for remaining work |
| Unresolvable error encountered | **Record in DEVLOG/**, new chat with different approach |

---

## Daily Checklist (AGENTS.md §15)

### Work Start (each new conversation)
- [ ] Read permanent layer files (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md)
- [ ] Confirm current project state (check module list and milestones)
- [ ] Check last maintenance dates (weekly/monthly/quarterly); remind if overdue
- [ ] Locate current working module (last developed module or milestone)
- [ ] If last development >7 days, execute cross-month recovery protocol
- [ ] Present "current project state summary" to user, confirm understanding
- [ ] Define single goal for this conversation (single responsibility)

### Work End (before closing each conversation)
- [ ] Update current module's DEVLOG/ log
- [ ] If module completed, generate CONTINUE/ summary
- [ ] Update module status in PROJECT_CONTEXT.md
- [ ] If important decisions made, generate decision log
- [ ] Check context usage; if >80%, suggest new chat and save progress
- [ ] Present "session work summary" to user, confirm state

### Auto-Trigger Actions

| Trigger Condition | Auto Action |
|-------------------|-------------|
| New conversation start | Load permanent layer + check maintenance dates + show project state summary |
| Module completed | Auto-generate CONTINUE/ summary + update PROJECT_CONTEXT.md |
| Context usage >70% | Remind about unrecorded decisions + suggest new chat |
| Context usage >80% | Trigger context overflow handling + suggest new chat |
| User says "今天先这样"/"下次继续" | Execute work end checklist |
| Continuous conversation >20 rounds | Remind about sufficient logging/summaries |
| Last weekly maintenance >7 days | Remind on each new conversation start |
| Last monthly maintenance >30 days | Remind on each new conversation start |

---

## Large File Handling Rules

### Document Files (doc/PDF)
1. TRAE reads original → generates short Markdown summary (written to REFERENCES.md)
2. Subsequent conversations only reference summary; original read via path when details needed
3. Prevents context overflow

### Figma Design Files
1. TRAE uses Figma MCP to export by page/component
2. Each page generates independent document (`ASSETS/figma/<page-name>.md`)
3. Index in REFERENCES.md; TRAE reads corresponding pages on demand

### Processing Flow
1. User submits large files → TRAE auto-detects type (doc/PDF/Figma)
2. Process per corresponding strategy; never load full text into context
3. Record in REFERENCES.md: file type, path, summary, key information points

---

## File Read/Write Order

### Reading Order (each new conversation)
1. AGENTS.md (always)
2. PROJECT_CONTEXT.md (first conversation only)
3. MODEL_CONFIG.md (before each conversation)
4. Current module's PRD (when developing that module)
5. Related CONTINUE/ summaries (when continuing existing features)

### Writing Order
1. Update corresponding module's PRD (when requirements change)
2. Append DEVLOG/ logs (after each conversation)
3. Update CONTINUE/ summaries (when module completes)
4. Update REFERENCES.md (when adding large files)

---

## Project State Judgment Rules

Based on `scope` field in PROJECT_CONTEXT.md:

| scope value | Behavior |
|-------------|----------|
| `"full"` (default) | Execute full flow, all modules expand on demand, SUPPLEMENTARY/ initialized, periodic maintenance required |
| `"small"` | Skip TESTING/, DEPLOYMENT/; keep core modules only |
| `"mvp"` | Only generate corresponding PRD; skip all other modules |

---

## Quick Reference: All Interaction Commands

| Scenario | Command Example |
|----------|-----------------|
| Initialize new project (Apple) | "这是一个完整的 Apple App 项目，包含登录、首页、设置等功能" |
| Initialize new project (Web) | "这是一个 Web 项目，包含用户系统、商品管理等功能" |
| Initialize small project | "这是一个简单的工具 App，只需要登录和首页功能" |
| Initialize MVP | "这是一个原型验证，只需要一个页面" |
| Add workflow to existing project | "帮我给这个项目加上协同工作流" |
| Expand module document | "生成 [模块名] 功能的详细 PRD" |
| Summarize completed module | "生成 [模块名] 功能的总结" |
| Continue existing feature | "继续开发 [模块名]，参考之前的总结" |
| Query project status | "当前项目的开发进度如何？" |
| Show health dashboard | "显示当前项目健康仪表板" |
| Add large file index | "将这份文档添加到项目参考中" (attach doc/PDF/Figma) |
| Execute weekly maintenance | "执行本周项目维护" |
| Execute monthly archive | "执行本月项目归档" |
| Execute quarterly audit | "执行季度项目审计" |
| Start new work session | "开始今天的开发，当前模块是 [模块名]" |
| End current session | "今天先这样，保存进度" / "执行工作结束清单" |

---

## Template Version

| Field | Value |
|-------|-------|
| **Current version** | 1.2 |
| **Created** | 2026-06-27 |
| **Last updated** | 2026-06-28 |
| **New in 1.2** | Existing project detection & merge strategy (no overwrites), non-Apple project adaptation (Web/Backend/Game/etc.), project type auto-detection from existing files |
| **New in 1.1** | Context lifecycle layering, periodic maintenance checklists, model switching decision tree, long-term memory decay strategy, project health dashboard, conversation strategy, decision log management, daily checklist, SUPPLEMENTARY/ chapters, ARCHIVE/ mechanism |
| **Applicable scenario** | All software project types (Apple App, Web, Backend, CLI, Game, etc.) |
| **Local model service** | oMLX (Gemma + Qwen) |
