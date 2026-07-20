---
name: ai-collab-workflow
description: Initialize any project (Apple App / Web / Backend / Game) with a structured documentation framework for human-AI collaborative development. Creates AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, all module placeholders, and supplementary chapters automatically. Invoke when user describes a new project or wants to adopt the workflow into an existing codebase.
---

# AI Collaborative Development Workflow

> A structured documentation framework for human + AI collaborative development.
> Supports Apple App, Web, Backend, Game, and any software project type.
> Designed for both human developers and AI coding assistants.
> **Version:** 2.1 | **Last Updated:** 2026-07-20

---

## When to Use

Invoke this skill when:
- Starting a **new project** of any type (Apple App, Web, Backend, CLI tool, Game, etc.)
- The user mentions "initialize", "new project", "template", or describes features they want to build
- The user wants to **adopt the workflow into an existing project** (e.g., "帮我给这个项目加上协同工作流")
- You need a structured way to organize project documentation across multiple sessions with an AI coding assistant

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
├── AGENTS.md                    ★ Core AI interaction rules (always detailed)
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

## Module Development Commands (P2 — §3 模块开发管理, NEW in v1.9.2)

These are **user-triggered commands** for daily module development workflows. They operate on existing project documentation (PRD/, CONTINUE/) and do NOT create new projects.

| # | Command | Trigger Phrase | When to Use | Key Actions |
|---|---------|---------------|-------------|------------------|
| 3.1 | Generate Module PRD (生成模块详细 PRD) | "生成 [模块名] 功能的详细 PRD" / "为 [模块名] 创建需求文档" | Add a new feature module's PRD after initialization, or when an existing module needs more detailed requirements. | 1) Ensure `PRD/` exists; 2) Create/update `PRD/<module-name>.md` (feature desc, user stories, acceptance criteria); 3) Update `PROJECT_CONTEXT.md` module list (status: "not started") |
| 3.2 | Generate Module Summary (生成模块总结) | "生成 [模块名] 功能的总结" / "[模块名] 开发完成了，做个总结" | After completing a feature module, generate a summary for cross-session context recovery. | 1) Read `PRD/<module-name>.md`; 2) Read `DEVLOG/` logs; 3) Generate/update `CONTINUE/<module-name>-summary.md` (overview, key decisions, known issues, file index); 4) Update status to "completed" with date |
| 3.3 | Continue Development (续接已有功能) | "继续开发 [模块名]，参考之前的总结" / "[模块名] 上次做到一半，继续开发" | Resume interrupted development, automatically loading CONTINUE/ summaries and decision logs. | 1) Load `CONTINUE/<module-name>-summary.md`; 2) Load decision logs (last 5); 3) Read `PRD/<module-name>.md`; 4) Present current state; 5) Confirm before starting |
| 3.4 | Start Daily Development (每日开发启动) | "开始今天的开发，当前模块是 [模块名]" / "今天做 [模块名] 功能" | Start a new development session, specifying the current working module. The agent loads permanent layer + PRD + CONTINUE/ summary, displays project state summary. | 1) Load permanent files (AGENTS.md, MODEL_CONFIG.md, dynamic docs); 2) Load PRD; 3) Load CONTINUE/ summary; 4) Display module status, dependencies, risks; 5) Confirm single responsibility (one conversation = one module) |

**Fallback for all commands:** If `PROJECT_CONTEXT.md` does not exist, the agent MUST inform the user: "项目尚未初始化。请先运行 '这是一个完整的 [类型] 项目，包含 [功能]' 或 '帮我给这个项目加上协同工作流' 进行初始化。"

---

## Project Initialization: Three Modes

All three modes share a common pre-detection + interactive model dialog step (see § 全局前置检测).

### 1. Full Commercial Project (Default)

**Trigger:** "这是一个完整的 Apple App 项目，包含 [features]...等功能"

**Actions:** Pre-detection (if directory has existing code → downgrade to Merge Mode) → Interactive Model Dialog (auto-detects `sysctl -n hw.memsize` + curl probes on 8080/11434/1234, presents results for user confirmation) → Generate complete directory structure → Initialize all core files (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, REFERENCES.md, TEMPLATE_GUIDE.md, STRUCTURE.md) → Initialize all module placeholders (PRD/, ARCHITECTURE/, TESTING/, DEPLOYMENT/, DEVLOG/, CONTINUE/) → Initialize all SUPPLEMENTARY/ chapters (S01-S07) → Create CONTINUE/decision-log/ template → Record source documents in REFERENCES.md (if any).

### 2. Small Tool Project

**Trigger:** "这是一个简单的工具 App，只需要 [feature1] 和 [feature2]"

**Actions:** Pre-detection (if directory has existing code → downgrade to Merge Mode) → Interactive Model Dialog (auto-detects `sysctl -n hw.memsize` + curl probes on 8080/11434/1234, presents results for user confirmation) → Generate core files + selected module placeholders → Skip TESTING/, DEPLOYMENT/ → Mark `scope` as `"small"` in PROJECT_CONTEXT.md.

### 3. MVP (Minimum Viable Product)

**Trigger:** "这是一个原型验证，只需要 [one feature]"

**Actions:** Pre-detection (if directory has existing code → downgrade to Merge Mode) → Interactive Model Dialog (auto-detects `sysctl -n hw.memsize` + curl probes on 8080/11434/1234, presents results for user confirmation) → Generate core files + only the corresponding PRD placeholder → Skip all other modules, mark `scope` as `"mvp"`.

---

## ⚠️ 全局前置检测（所有模式统一执行 — CRITICAL）

**BEFORE determining the mode or generating any files, the agent MUST check whether the target directory is an existing project.** This step runs for ALL modes (Full / Small / MVP / Merge).

### Detection: Is this an existing project?

Check for the following signals in the working directory:
- Any source code files (`.swift`, `.ts`, `.js`, `.py`, `.go`, `.rs`, `.java`, `.kt`, etc.)
- Any `package.json`, `Cargo.toml`, `go.mod`, `Podfile`, `requirements.txt`, etc.
- Any `.git/` directory
- Any existing `AGENTS.md`, `PROJECT_CONTEXT.md`, or `TEMPLATE_GUIDE.md`

**If ANY of these exist → treat as existing project. Do NOT blindly overwrite.**

### Merge Mode: Adding workflow to an existing project

When the user says things like "帮我给这个项目加上协同工作流" or "为这个项目初始化协作开发模板", the agent MUST:

**Step 0 — Run Global Pre-Detection + Interactive Model Dialog (CRITICAL):** Before doing anything else, the agent MUST run two sub-steps in order: (0a) Global Pre-Detection — check if the target directory has existing code (source files, package.json, .git, etc.); (0b) Interactive Model Dialog (defined in §0 below) — the agent first auto-detects physical memory and local model services, then presents the results for the user to confirm or correct (model names 🧠/⚡ remain required).

**Step 1 — Write to MODEL_CONFIG.md §0:** After the dialog, write results into `MODEL_CONFIG.md` under a new section.

**Step 2 — Inventory existing files** — list all files already in the directory.

**Step 3 — Present a plan** before writing anything: "检测到这是一个已有项目。在开始工作前，已与您确认模型信息（见 MODEL_CONFIG.md §0）。我建议以下操作：- 保留现有源码文件（不修改）- 新增以下框架文件：AGENTS.md, PROJECT_CONTEXT.md, ... - 以下文件已存在，建议：[跳过 / 合并 / 备份] - 请问如何继续？"

**Step 4 — Never overwrite** — existing files are only merged with explicit user consent.

**Step 5 — Fill PROJECT_CONTEXT.md from context** — auto-detect tech stack from existing files (e.g., `package.json` → "Node.js project").

**Step 6 — Create DEVLOG/ and CONTINUE/** — but do NOT create PRD/ placeholders for already-implemented features.

### Per-file merge rules

| If this file already exists | Agent action |
|------------------------------|-------------|
| `AGENTS.md` | Ask: keep existing, replace, or merge? |
| `PROJECT_CONTEXT.md` | Auto-fill from existing codebase analysis; ask about conflicting fields |
| `MODEL_CONFIG.md` | Add if missing; skip if exists |
| `REFERENCES.md` | Add if missing; skip if exists |
| Any source code | **NEVER touch** — only read for context |
| `PRD/*.md` | Skip if module already implemented |
| `DEVLOG/` | Always safe to create (new log files only) |


### Functional Equivalence Detection (功能等价物检测 — P0-3)

**Problem:** The current Merge Mode only checks if a file exists, not whether an existing document serves the same function. This leads to redundant files when projects already have their own documentation体系.

**Detection Rules:** the agent MUST check for the following functional equivalence relationships BEFORE creating any standard files:

| Standard File | Functional Equivalent (Project-Own) | Action When Detected |
|---------------|-------------------------------------|----------------------|
| `AGENTS.md` §3 (Task Routing) | `AI_CONTEXT_MAP.md` with 14 task classification types + line-level precision | Skip creating standard AGENTS.md §3; instead, create a reference in the new AGENTS.md pointing to `AI_CONTEXT_MAP.md` |
| `PROJECT_CONTEXT.md` (Progress Section) | `AI_PROGRESS_MAP.md` with 23+ sub-module progress + verification status | Skip creating PROJECT_CONTEXT.md progress section; instead, create a reference in AGENTS.md pointing to `AI_PROGRESS_MAP.md` |
| `ARCHITECTURE/` (Engineering Specs) | 技术文件框架/ (E2-E6 system contracts + development methods) | Skip creating ARCHITECTURE/ directory; instead, create a reference in AGENTS.md pointing to 技术文件框架/ |
| `PRD/` (Feature Requirements) | 森林文档/ (PRD + Design Charter + World Bible) | Skip creating PRD/ directory; instead, create a reference in AGENTS.md pointing to 森林文档/ |
| `.trae/rules/project_rules.md` | Content already integrated into AGENTS.md §2 (Token segmentation rules) | Keep `.trae/rules/project_rules.md` for the agent system; note in AGENTS.md that content is integrated |

**Priority Rule:** When a functional equivalent exists, the project-own document takes priority over the standard template. User can override this rule manually if needed.

**Output Format When Equivalence Detected:**
```markdown
检测到功能等价文档，跳过标准文件创建：

[已跳过] PROJECT_CONTEXT.md → 使用 AI_PROGRESS_MAP.md（功能等价：23+模块进度 + 验证状态）
[已跳过] ARCHITECTURE/ → 使用 技术文件框架/（功能等价：E2-E6工程规格）
[需新增] AGENTS.md — 包含对 AI_CONTEXT_MAP.md 和 AI_PROGRESS_MAP.md 的引用
```

---

### Shell Mode (外壳模式 — P0-1)

**Problem:** The current Merge Mode assumes the project will accept a complete directory structure (PRD/, ARCHITECTURE/, TESTING/). Real projects often have their own documentation system that serves the same purpose.

**When to activate Shell Mode:**
- User says "帮我给这个项目加上协同工作流" AND directory contains project-specific documentation (AI_CONTEXT_MAP.md, AI_PROGRESS_MAP.md, 技术文件框架/, 森林文档/, or equivalent)
- After functional equivalence detection (P0-3) identifies ≥2 functionally equivalent documents

**Shell Mode Workflow:**

```
Step 1 — Run functional equivalence detection (P0-3 rules above)
Step 2 — Classify detected documents:
         - "已跳过" (skipped): Standard file has functional equivalent → skip creation
         - "需新增" (needs new): No equivalent exists → create standard file
         - "保留" (keep): Project-own document is superior → keep as-is, add reference
Step 3 — Generate merge plan showing:
         - Which standard files are skipped (reason: functional equivalent)
         - Which standard files need to be created (filling process-layer gaps)
         - Which project-own documents are preserved with references added
Step 4 — Present clear plan to user:
         ```
         Shell Mode 合并计划：

         [已跳过] PRD/ → 使用 森林文档/（功能等价）
         [已跳过] ARCHITECTURE/ → 使用 技术文件框架/（功能等价）
         [已跳过] PROJECT_CONTEXT.md 进度部分 → 使用 AI_PROGRESS_MAP.md（功能等价）

         [需新增] AGENTS.md — 包含对 AI_CONTEXT_MAP.md 的引用
         [需新增] MODEL_CONFIG.md — 模型路由配置（无等价物）
         [需新增] DEVLOG/ — 开发日志目录（无等价物）
         [需新增] CONTINUE/ — 模块摘要目录（无等价物）

         标准框架将作为"外壳"包裹项目自有文档。
         请问是否按此计划执行？
         ```

**Key Principle:** Shell Mode respects the project's existing documentation system. The standard framework acts as a "shell" that adds process-layer capabilities (session management, maintenance checklists, memory decay strategy) without duplicating content-layer capabilities that the project already handles well.

**Backward Compatibility:** Shell Mode is ONLY activated when functional equivalents are detected. If no equivalents exist, the workflow falls back to standard Merge Mode (existing behavior unchanged).

---
---

## Non-Apple App Project Adaptation

This workflow was originally designed for Apple App (SwiftUI) projects but is **fully adaptable** to any project type. The agent must auto-detect and adapt.

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
| `.cs` + `.unity` scenes / `.cpp` + `.uproject` | **Unity Game** | Tech stack → "Unity/C#"; **新增游戏专属 AGENTS.md 模板章节**: §G1 Tick vs Frame 驱动概念, §G2 确定性回放 (Deterministic Replay), §G3 头显/无头模式 (Headless Simulation), §G4 资产管道 (Asset Pipeline); 对话职责类型增加: SimCore Dev / Asset Gen / Shader Dev / LevelDesign; 目录结构模板: Assets/Scripts/, Assets/Audio/, Assets/Materials/ |
| `.cpp` + `.uproject` | **Unreal Game** | Tech stack → "Unreal/C++"; 同上游戏专属章节 (C++ 版本); 目录结构: Source/, Content/, Plugins/ |

### Non-Apple adaptations checklist

When the project is NOT an Apple App, the agent MUST:
1. **Rename DEPLOYMENT/app-store-guide.md** → `DEPLOYMENT/deploy-guide.md` (web/server deploy instead of App Store)
2. **Update ARCHITECTURE/tech-stack.md** placeholder content to match detected tech stack
3. **Adjust AGENTS.md trigger phrases** — change "Apple App" references to match the detected project type
4. **Update PROJECT_CONTEXT.md** tech stack section:
   - "平台：iOS（SwiftUI）" → detected platform
   - "语言：Swift / SwiftUI" → detected language
   - "设计工具：Figma" → keep (universal)
5. **Skip Apple-specific modules** if not applicable (e.g., no App Store for web projects)

### Game Project Specific Sections (P1-1 — NEW in v1.9.2)

When project type is detected as **Unity** or **Unreal**, the agent MUST additionally:

1. **AGENTS.md §G1-G4** — Create game-specific chapters: §G1 (Tick vs Frame 驱动概念), §G2 (确定性回放 — seeded RNG, fixed-point math), §G3 (头显/无头模式 — headless build for CI/CD), §G4 (资产管道 — Addressables/StreamableAssets).

2. **Conversation Strategy** — Add rows: SimCore Dev (Tick, ECS, UtilityAI), Asset Gen (3D models, textures, audio), Shader Dev (Unity Shaders/Unreal Materials), Level Design (scene layout, terrain, lighting).

3. **Directory Structure Adaptations:** `Assets/Scripts/`, `Assets/Audio/`, `Assets/Materials/`, `Assets/Scenes/` (Unity) or `Source/`, `Content/`, `Plugins/`, `Config/` (Unreal); `DEPLOYMENT/` → `BUILD/`; `PRD/` → Add GDD templates; `TESTING/` → Add PlayMode + EditMode test templates (Unity) or Automation Test templates (Unreal).

4. **Game-Specific Hard Constraints** (auto-added when game type detected): HC-014 (Simulation logic MUST NOT live in `MonoBehaviour`/`AActor::Tick()`), HC-015 (Deterministic replay requires seeded RNG), HC-016 (Asset loading MUST use Addressables/StreamableAssets), HC-017 (Headless mode MUST pass all gameplay tests).

---

---

## ⚠️ 全局物理硬件与内存红线 (Device-Adaptive OOM Prevention)

**This section defines the global hardware-aware memory management rules for all full-stack projects.**
**The agent MUST follow these rules before executing ANY task that involves file reading or context loading.**

### Hardware-Adaptive Sensing (硬件自适应感知 — CRITICAL)

This project may use a local dual-model workflow that is **extremely sensitive to physical RAM**.

**On first run, the agent MUST auto-detect the host machine's physical unified memory:**

```bash
sysctl -n hw.memsize | awk '{printf "%.0f\n", $1/1024/1024/1024}'
```

Based on the detected memory, the agent selects the appropriate strategy tier below. The five-tier system covers ALL possible memory sizes — no gaps, no blind spots.

### Start-of-Session Interactive Model Dialog (启动交互式模型对话 — CRITICAL UPDATE)

**The agent does NOT ask the user to fill in information they may not know.** Instead, the agent **first auto-detects** physical memory and local model services, then presents the results for the user to **confirm or correct**. Only the model names (🧠/⚡) are genuinely required from the user.

#### Step 0: Auto-Detection (自动检测)

Before showing any dialog, the agent MUST execute these two operations silently:

**0a. Physical memory detection:** `sysctl -n hw.memsize | awk '{printf "%.0f\n", $1/1024/1024/1024}'`
**0b. Local model service probing:** Probe three default ports (oMLX 8080, Ollama 11434, LM Studio 1234) via `curl --connect-timeout 2`. Accept any 2xx as "running".

#### Step 1: Present Dialog (展示检测结果 + 收集用户输入)

The agent MUST present the following dialog to the user **before any file operations**. The dialog shows detected results first, then asks the user to confirm or correct:

```
=== 启动环境确认 ===
[检测结果上下文：空目录 / 已有项目]
在开始工作前，请确认以下信息——（the agent 已完成检测，您只需确认或修改有误的项）

📊 物理内存：检测到 [e.g., 32] GB — 如果不对，请告诉我您的实际内存大小
🤖 本地模型服务：oMLX (8080): [✅/❌], Ollama (11434): [✅—[model] / ❌], LM Studio (1234): [✅/❌]
   如果您还运行了其他服务（名称 + 端口），请告诉我
🧠 推理模型 — 必填：您用于需求分析/架构设计/Debug 的模型名？ (如: "gemma-3-27b" / "qwen-2.5-72b")
⚡ 生成模型 — 必填：您用于代码编写/文件生成的模型名？ (如: "gpt-4o" / "claude")
🔧 自定义端口（可选）— 如果您的模型服务使用了非默认端口
   推理模型端口：[留空 = 使用默认] | 生成模型端口：[留空 = 使用默认]
────────────────────────
请回复"确认"以使用检测结果；如需修改，直接告诉我哪一项改成什么。
```

#### Step 2: User Response Handling (用户响应处理)

| User says | Agent action |
|-----------|-------------|
| "确认" (no changes) | All detected values used as-is; write to `MODEL_CONFIG.md §0` with source: `[自动检测]` |
| "内存是 64GB" | Update memory → mark source as `[用户确认]` |
| "Ollama 端口是 11435" | Update port → re-probe on corrected port |
| "推理用 gemma-3-27b" / "生成用 gpt-4o" | Set model names → `[用户确认]` |
| "推理端口 8081" | Set custom port → `[用户确认]` |

**Most common pattern (C):** User provides model names only; memory and services remain auto-detected.

#### Step 3: Write to MODEL_CONFIG.md §0 (写入配置)

After the dialog, the agent MUST write results into `MODEL_CONFIG.md` under a new section (see §0 format in original).

**Source marking rules:**
- Physical memory: always `[自动检测]` unless user corrected → then `[用户确认]`
- Model services: always `[自动检测]` (the agent probes before dialog)
- Model names (🧠/⚡): always `[用户确认]` (user provides them in the dialog)

#### Step 4: Proceed with Task (继续任务 + 边界情况降级处理)

After writing MODEL_CONFIG.md §0:
- **If user provided model names (🧠/⚡):** Use them directly for routing
- **If user did not provide model names:** Ask a focused follow-up: "请告诉我您的推理模型名（🧠）和生成模型名（⚡）"
- **If no local model detected at all:** Note in §0, route all tasks through current cloud Agent

**IMPORTANT:** the agent MUST NOT proceed until user has provided: Reasoning model (🧠) AND Generation model (⚡), OR explicitly said "auto-detect for me" / "use cloud".

**Boundary Case Handling (边界情况降级处理):**

| User behavior | Agent fallback action |
|---------------|---------------------|
| "随便" / "你定吧" / "auto" | Uses first detected local model for 🧠, cloud Agent for ⚡. Marks both as `[自动选择]`. |
| "不用本地模型，全部用云端" / "use cloud only" | Skip all local routing. Route ALL tasks through cloud Agent. Mark §0 with `local_models: "none (cloud only)"`. |
| Same model name for 🧠 and ⚡ (e.g., `qwen-2.5-72b` for both) | Accept it — routes tasks by intent (analysis vs. code generation). Note: `note: "same model for both roles"`. |
| Only one model name (e.g., "推理用 gemma, 生成随便") | Use provided for 🧠; default to cloud Agent for ⚡. Mark ⚡ as `[自动检测 → 云端]`. |
| User manually edits `MODEL_CONFIG.md` (changes port/model) | On next task, the agent runs lightweight re-probe (`curl` 8080/11434/1234). If user's manual change conflicts with actual probe results, **trust the live probe** and notify: "检测到您手动修改了配置，但实际检测到的服务状态已变化。以实时检测结果为准（已更新 §0 时间戳）。" |
| User provides invalid model name (service returns error on specified port) | The agent retries once with 5-second timeout. If still fails, marks as `[服务不可用]` and routes through cloud Agent. Notifies: "您指定的模型端口无法连接，已临时切换为云端路由。" |
| User completely ignores the dialog (no response after 3 follow-ups) | Defaults to: 🧠 = cloud Agent (same as ⚡). Proceeds with development, logs warning in §0: `note: "user did not respond after 3 attempts; using cloud Agent for both roles"`. |

**IMPORTANT:** the agent MUST NOT proceed with development until the user has provided:
- Reasoning model name (🧠), AND
- Generation model name (⚡), OR
- One of the above boundary case fallbacks has been triggered.

### Static Physical Blacklist (静态物理黑名单 — 绝对死线)

**On ALL devices, regardless of memory tier, these directories are STRICTLY FORBIDDEN from recursive scanning:**

| Blacklisted Directory | Reason |
|----------------------|--------|
| `presets/` | Contains pre-built templates and large assets; scan only when user explicitly attaches a specific preset file |
| `node_modules/` | Massive dependency tree; never load into context |
| `.github/` | CI/workflow configs; irrelevant to feature development |
| Build artifacts (`DerivedData/`, `.build/`, `dist/`, `.next/`) | Generated binaries; never read |

**The agent must NEVER blindly `ls` or `glob` these directories.** If a file inside them is needed, the user must provide the exact path.

### Contract Green Pass (跨端数据契约绿通 — Templatized)

To ensure consistency between frontend and backend data contracts, a **"Contract Green Pass"** mechanism is established. The file paths below are **templates** — the agent MUST resolve the actual paths based on the project's detected tech stack during initialization.

**Contract File Variables (resolved at project init):**

| Variable | Apple App Project | Web Frontend Project | Backend API Project |
|----------|------------------|---------------------|-------------------|
| `$SCHEMA_FILE` | `prisma/schema.prisma` | `prisma/schema.prisma` or `drizzle/schema.ts` | `prisma/schema.prisma` or `drizzle/schema.ts` |
| `$ROUTE_DEFS` | `api/routes/` | `api/routes/` or `app/api/` | `api/routes/` or `src/routes/` |
| `$DESIGN_TOKENS` | `Sources/AppComponents/DesignToken.swift` | `src/styles/tokens.ts` or `tailwind.config.ts` | N/A (no design tokens for pure backend) |
| `$PRD_DIR` | `PRD/` | `PRD/` | `PRD/` |
| `$API_CONTRACTS` | `api/contracts/` | `api/contracts/` or `src/types/api.ts` | `api/contracts/` or `src/types/` |

**When executing Frontend tasks:**
- ✅ **ALLOWED:** Read `$SCHEMA_FILE` and `$ROUTE_DEFS` to ensure Model fields align with the backend contract.
- ❌ **STILL FORBIDDEN:** Scanning backend business logic controllers, services, or middleware.

**When executing Backend tasks:**
- ✅ **ALLOWED:** Read `$PRD_DIR` documents, design specifications, and `$DESIGN_TOKENS` (if applicable) to ensure API responses match frontend UI expectations.
- ❌ **STILL FORBIDDEN:** Scanning frontend UI view code or interaction logic.

**For pure single-layer projects (no full-stack):** The Contract Green Pass is automatically skipped. the agent detects this during init and marks `$cross_module` as `none` in MODEL_CONFIG.md.

### Circuit Breaker Isolation Thresholds (断路隔离阈值 — Five-Tier Continuous Coverage)

| Tier | Device Memory | Strategy | Token Budget | Contract Green Pass Behavior |
|------|--------------|----------|-------------|------------------------------|
| **T1** | **≤ 16 GB** | 极限保守 | **16K tokens** | ❌ Contract Green Pass disabled. Zero cross-module reads. Read only the exact file requested. |
| **T2** | **17–32 GB** | 极致保守 | **24K tokens** | ⚠️ Contract Green Pass limited to reading a single `$SCHEMA_FILE` only. No other cross-module reads. |
| **T3** | **33–48 GB** | 标准平衡 | **50K tokens** | ✅ Contract Green Pass fully active: AI may auto-associate and read frontend-backend contract files as needed. |
| **T4** | **49–64 GB** | 充裕 | **80K tokens** | ✅ Contract Green Pass fully active + reasonable cross-module global scanning allowed. |
| **T5** | **≥ 65 GB** | 无限制 | **100K+ tokens** | ✅ No token restriction. Full cross-module access. Still respect static blacklist. |

### Context Budget Guide (项目级精度 — P1-2)

Based on project scale (full/small/mvp), the agent MUST set appropriate context budget levels.
This guide works in tandem with the T1-T5 circuit breaker thresholds above.

| Budget Level | Token Range | Project Scale | Recommended Loaded Files |
|-------------|-------------|---------------|--------------------------|
| Small | 15–25 KB (≈4K–7K tokens) | MVP scope, single module | AGENTS.md + current module PRD only |
| Medium | 30–50 KB (≈8K–14K tokens) | Small scope, 2-3 modules | AGENTS.md + PROJECT_CONTEXT.md (milestones) + current module PRD |
| Large | 50–70 KB (≈14K–20K tokens) | Full scope, multi-module | AGENTS.md + PROJECT_CONTEXT.md (full) + MODEL_CONFIG.md + current module PRD + related CONTINUE/ summaries |

**Task-Level Precision (任务级精度):** For each task type, the agent MUST annotate the suggested file paths and line ranges:

| Task Type | Suggested Load | Line Range | Budget Impact |
|-----------|---------------|------------|---------------|
| 需求分析 (Requirements) | AGENTS.md §1-3 + PRD/ | Lines 1–200 (AGENTS) + full PRD | Small-Medium |
| 架构设计 (Architecture) | PROJECT_CONTEXT.md §2-3 + ARCHITECTURE/ | Lines 50–150 (PROJECT) + spec files | Medium-Large |
| 代码生成 (Code Gen) | Current module PRD + existing source files | Line-level per file | Small-Large (depends on scope) |
| Debug/调试 (Debugging) | Error logs + relevant source files only | Exact file:line from error | Small |
| 跨模块审查 (Cross-Module Review) | Contract files only ($SCHEMA_FILE + $ROUTE_DEFS) | Lines 1–50 per contract file | Medium |
| 项目审计 (Audit) | All ARCHIVE/ summaries + PROJECT_CONTEXT.md §4-5 | Full documents | Large |

**Budget Adjustment Rules (预算调整规则):**
- When project scale is `mvp`: always use Small budget, even if physical memory supports Large
- When project scale is `full` AND T3+ tier: use Large budget
- When project scale is `small` AND T3+ tier: use Medium budget
- When project scale is `small` AND T1-T2 tier: use Small budget (circuit breaker takes precedence)
- Shell Mode projects (≥2 functional equivalents skipped): default to Medium budget for remaining files


**When token budget is exceeded:** the agent MUST proactively stop the retrieval chain and ask the user for precise file paths.

### Dynamic Permanent Layer Scheduling (P1-2 — 动态永久层调度, NEW in v1.9.2)

When initializing or re-initializing a project, the agent MUST execute the following scheduling algorithm to determine which files belong in the Permanent Layer based on hardware constraints:

**Scheduling Algorithm (执行于初始化阶段):**

```
Step 1: Detect all project-owned core files (AI_CONTEXT_MAP.md, AI_PROGRESS_MAP.md, etc.)
Step 2: Estimate each file's token consumption (file_size_KB × 1.5 safety factor)
Step 3: Determine the Context Budget ceiling based on T1-T5 tier (see table below)
Step 4: Fill Permanent Layer by priority (P0 > P1 > P2) until budget is exhausted
Step 5: Files exceeding budget are automatically demoted to "Stable Layer" (on-demand loading only)
Step 6: Document each file's priority and status (Permanent Layer / Stable Layer) in AGENTS.md §3
```

**T1-T5 Tier → Permanent Layer Budget Mapping:**

| Tier | Physical RAM | Context Window | Permanent Layer Budget Cap | Strategy |
|------|-------------|---------------|---------------------------|----------|
| **T1** | ≤ 16 GB | 16K tokens | **≤8 KB (50%)** | Load ONLY P0 files (AGENTS.md + MODEL_CONFIG.md + [PROJECT_CONTEXT_FILE]). AI_PROGRESS_MAP.md auto-demoted to Stable Layer. |
| **T2** | 17–32 GB | 24K tokens | **≤15 KB (60%)** | Load P0 + FIRST P1 file (e.g., AI_CONTEXT_MAP.md). Second and subsequent P1 files demoted to Stable Layer. |
| **T3** | 33–48 GB | 32K tokens | **≤20 KB (60%)** | Load P0 + ALL P1 files (≤3). Excess P2 files demoted to Stable Layer. |
| **T4** | 49–64 GB | 48K tokens | **≤30 KB (60%)** | Load P0 + ALL P1 files + partial P2 on-demand. |
| **T5** | ≥ 65 GB | 64K+ tokens | **≤50 KB (75%)** | Full load. Remaining space can hold conversation history. |

**Key Behaviors:**
- **T1 users**: Permanent layer contains ONLY P0 files (AGENTS.md + MODEL_CONFIG.md + PROJECT_CONTEXT_FILE). AI_PROGRESS_MAP.md is auto-demoted to Stable Layer.
- **T2 users**: Permanent layer contains P0 + first P1 file. Second and subsequent P1 files demoted to Stable Layer.
- **T3+ users**: Can load all P0 + P1 files. P2 files demoted on-demand as needed.
- **All tiers**: User-manually added files ALWAYS remain in Permanent Layer (not subject to budget limits).
- **Budget recalculation**: If user adds new core documents, re-run scheduling algorithm on next initialization.

**Tier-to-Budget Reference Table (for user display):**
| Your Hardware Tier | Context Window | Permanent Layer Budget Cap | Estimated Files Loadable |
|-------------------|---------------|---------------------------|-------------------------|
| T1 (≤16GB) | 16K tokens | ≤8 KB | 2-3 files (P0 only) |
| T2 (17-32GB) | 24K tokens | ≤15 KB | 3-4 files (P0 + partial P1) |
| T3 (33-48GB) | 32K tokens | ≤20 KB | 4-5 files (P0 + all P1) |
| T4 (49-64GB) | 48K tokens | ≤30 KB | 5-7 files (P0 + P1 + partial P2) |
| T5 (≥65GB) | 64K+ tokens | ≤50 KB | 7+ files (full load) |

### Pre-Task Memory Checklist (v1.8 — Updated)

Before starting ANY task, the agent MUST determine which phase the session is in and follow the appropriate path:

**Phase A — Initialization Phase (首次初始化):**
1. **Run auto-detection first** — detect physical memory (`sysctl`) + probe model services (`curl` 8080/11434/1234)
2. **Present interactive dialog** — show detected results + ask user to confirm/correct + collect model names (🧠/⚡)
3. **Resolve contract file paths** from project tech stack → fill in variable placeholders
4. **Match the tier** from the five-tier table above based on confirmed memory
5. **Respect the static blacklist** — never scan `presets/`, `node_modules/`, or build artifacts
6. **Use Contract Green Pass** only for contract alignment — never for business logic exploration

**Phase B — Subsequent Tasks (后续任务 — 复用策略):**
1. **Check if `MODEL_CONFIG.md` exists and has valid §0** (model names 🧠/⚡ are present):
   - **YES → Skip interactive dialog.** Use existing configuration directly. Proceed to Step 2 below.
   - **NO (missing or incomplete):** Run a lightweight re-probe (`curl` 8080/11434/1234 only, skip `sysctl`) and compare with stored config:
     - If detected services changed (e.g., Ollama was not running before but now is, or port changed) → **re-run full interactive dialog** (go to Phase A Step 2).
     - If nothing changed → silently update the probe timestamps in §0 and proceed to Step 2 below.
2. **Resolve contract file paths** from project tech stack → fill in variable placeholders (only if not already resolved)
3. **Match the tier** from the five-tier table above based on confirmed memory (use stored value)
4. **Respect the static blacklist** — never scan `presets/`, `node_modules/`, or build artifacts
5. **Use Contract Green Pass** only for contract alignment — never for business logic exploration

> **Why this matters:** the agent detects first, user confirms — no guessing, no blind probing. Every memory configuration from 8GB laptops to 192GB workstations gets its own optimal rules. **Always prefer file-path-specific reads over broad directory scans.**

---

## 📂 Full-Stack Module Architecture & Tech Stack Mapping

### Default Full-Stack Project Structure

When initializing a full-stack project (iOS + Backend + Database), the agent MUST create the following module mapping:

```
Project/
├── Sources/AppComponents/       iOS 原生客户端 (SwiftUI + TCA)
│   ├── Models/                  数据模型层
│   ├── Views/                   UI 视图层
│   ├── ViewModels/              视图模型层 (TCA reducers)
│   └── Services/                网络与服务层
├── api/                         后端 API 服务 (Node.js / TypeScript)
│   ├── routes/                  异步路由控制器
│   ├── controllers/             业务逻辑层
│   └── middleware/              中间件 (auth, validation)
├── prisma/                      数据库层 (Prisma ORM / PostgreSQL)
│   ├── schema.prisma            数据模型定义
│   └── migrations/              渐进式迁移文件
└── [其他前端模块...]            Web / Desktop / Game etc.
```

### Per-Module Tech Stack & Standards

| Module | Tech Stack | Key Specifications |
|--------|------------|-------------------|
| **iOS 原生客户端** (Sources/AppComponents/) | iOS 16+ / SwiftUI / TCA | 严格对齐 Apple HIG；动效 `Animation.spring(damping: 0.7, duration: 0.3s)`；触觉 `UIImpactFeedbackGenerator`；图片 `Nuke` |
| **后端 API 服务** (api/) | Node.js / TypeScript / Express/Fastify | 必须包含完善的错误捕获（Try-Catch），返回标准 JSON 格式响应 |
| **数据库层** (prisma/) | Prisma ORM / PostgreSQL | 变更字段必须遵循渐进式迁移（Migration），禁止直接破坏现有表结构 |
| **Web 前端** (app/ / src/) | React / Next.js / Vue + TypeScript | 组件化开发，遵循既定设计系统 Token |

### Full-Stack Cross-Module Communication Rules

When a task spans multiple modules (e.g., "implement login feature across iOS + Backend"):

1. **Define API contract first** — document request/response schema in `api/contracts/<feature>.md`
2. **Generate backend routes** — implement controllers and database queries
3. **Generate frontend integration** — implement network layer and UI updates
4. **Update both module summaries** in `CONTINUE/` after completion

---

## 🤖 Intelligent Model Routing Strategy (Model-Agnostic Division of Labor)

This section defines a **model-agnostic** routing strategy. It does NOT assume specific model names (Gemma, Qwen, etc.). Instead, all models are classified into two **role-based categories** that apply to any AI model ecosystem.

### Two Role-Based Model Categories

| Category | Role | Key Trait | Examples (Any Model) |
|----------|------|-----------|----------------------|
| **🧠 Reasoning Model** (推理型) | Analyze, design, review, debug | Deep chain-of-thought, strong logic | Claude, Gemma, DeepSeek-R1, o1, o3, Llama-4 (thinking) |
| **⚡ Generation Model** (生成型) | Write code, generate files, expand PRDs | High throughput, fast output | GPT-4o, Qwen, Codex, Llama-4, Mistral, DeepSeek-V3 |

### User Model Mapping (Filled from Interactive Dialog)

During the start-of-session interactive dialog, the agent first auto-detects then asks the user to:
- Confirm or correct detected results (memory, services)
- Provide their Reasoning model name (🧠) and Generation model name (⚡)
- Optionally specify custom ports

This information is written to `MODEL_CONFIG.md §0` with source attribution: `[自动检测]` for probed data, `[用户确认]` for user-provided data.

```markdown
## 0. 环境自检结果 & 模型角色映射

| 角色 | 用户指定模型名 | 来源 |
|------|-------------|------|
| 🧠 Reasoning | `[user-provided via dialog]` | [用户确认] |
| ⚡ Generation | `[user-provided via dialog]` | [用户确认] |
```

**Model names are always user-provided** — the agent detects services (oMLX/Ollama/LM Studio) but does not map model names to roles without user consent.

**If no local model found:** Route all tasks through the current cloud Agent (Claude/GPT/the agent). The routing logic still applies (which task goes to which role), even if both roles are served by the same cloud model.

### Task Classification & Role Assignment

| Task Type | Role | Reason |
|-----------|------|--------|
| **需求分析 / 设计 / 重构 / Debug** | 🧠 Reasoning | 需要深层思维链处理复杂业务边界、HIG 核对、并发死锁、类型报错及架构设计 |
| **全量代码编写 / 扩写 / 生成** | ⚡ Generation | 高吞吐优势，根据既定 PRD 和设计 Token，快速产出全量、闭合的代码文件 |
| **架构决策 / 技术选型** | 🧠 Reasoning | 需要深度推理和多方案对比 |
| **单元测试 / 测试用例** | ⚡ Generation | 模式化程度高，适合快速生成 |
| **文档撰写 / PRD** | 🧠 Reasoning | 需要逻辑性和完整性 |

### Model Routing Decision Flow (v1.8 — Updated)

```
Session start
    │
    ├── Step 0: Check if MODEL_CONFIG.md §0 exists and is valid
    │
    ├── YES → Phase B (Subsequent Task — 复用已有配置)
    │         ├── Lightweight re-probe (curl only, skip sysctl)
    │         ├── If services changed → back to Phase A dialog
    │         └── If unchanged → use stored config directly
    │
    └── NO → Phase A (Initialization — 首次初始化)
              │
              ├── Step 0a: Auto-detect physical memory (sysctl)
              ├── Step 0b: Auto-probe model services (curl 8080/11434/1234)
              │
              ▼
         Present Interactive Dialog — show detected results + ask user to confirm
              │
              ▼
         User confirms/corrects + provides model names (🧠/⚡)
              │
              ├── Boundary case? → Apply fallback rule (auto-select / cloud-only / etc.)
              │
              ▼
         Write to MODEL_CONFIG.md §0 (with source attribution)
              │
              ▼
         User request received
              │
              ▼
         Is the task about "what to build" or "how to fix"?
            ├── YES → Route to 🧠 Reasoning Model (user-provided)
            │         └─ Analyze requirements, identify edge cases, design solution
            │
            └── NO → Is the task about "write code" or "generate files"?
                       ├── YES → Route to ⚡ Generation Model (user-provided)
                       │         └─ Generate complete, compilable code files
                       │
                       └── UNKNOWN → Ask user to clarify task type

#### Step 4.5 — Pre-Execution Compliance Check (执行前合规检查)

**Before any code modification, the AI coding assistant MUST run a lightweight compliance gate:**

```
1. Scope verification:   Target file + function + lines identified?
2. Policy check:         Does the plan violate any POLICY_CONSTRAINTS (1-7)?
3. Complexity assessment: Is this a simple fix or complex task?
   - Simple → Execute directly (skip 4-phase pipeline)
   - Complex → Invoke full Scout→Plan→Execute→Verify pipeline
```

**Compliance checklist (self-audit before acting):**
- [ ] Only the necessary lines will be changed
- [ ] One function / logical block at a time
- [ ] Existing style preserved (indentation, naming, imports)
- [ ] Scope does not exceed the original request
- [ ] No unrequested refactoring (renames, moves, architecture changes)

**If ANY check fails → STOP and revise the plan.**

```

> **AI Coding Assistant's role:** The AI coding assistant (the agent / Cursor / Claude Code / Windsurf / etc.) itself does NOT execute code. Its job is to:
> 1. Auto-detect first (sysctl + curl probes) — then present results for user to confirm/correct
> 2. Collect user's model names (🧠/⚡) via interactive dialog — model names are always user-provided
> 3. Classify the user's request into 🧠 Reasoning or ⚡ Generation role
> 4. Look up the user's mapped model from `MODEL_CONFIG.md §0` (source: [用户确认])
> 5. Tell the user: "[Task] → 请使用 [User's Model Name] (🧠 Reasoning / ⚡ Generation)"
> 6. **Run pre-execution compliance check (Step 4.5) before any code modification**

### Example: Full-Stack Feature Implementation (Model-Agnostic)

User says: "实现用户登录功能，包含 iOS 客户端和后端 API"

Agent response:
```
检测到这是一个跨模块功能开发。根据你的 MODEL_CONFIG.md 配置，当前模型映射为：
- 🧠 Reasoning: [user's model]     ⚡ Generation: [user's model]

建议按以下步骤执行：

Step 1 — 需求分析与 API 契约设计
→ 请使用 [user's reasoning model] (🧠 Reasoning)
→ 任务：定义登录接口的请求/响应格式、错误码、边界条件

Step 2 — 后端 API 实现
→ 请使用 [user's generation model] (⚡ Generation)
→ 任务：根据 Step 1 的契约，实现路由、控制器、数据库查询

Step 3 — iOS 客户端集成
→ 请使用 [user's generation model] (⚡ Generation)
→ 任务：实现网络层调用和 UI 更新

Step 4 — 联调与 Debug
→ 请使用 [user's reasoning model] (🧠 Reasoning)
→ 任务：处理异常场景、边界条件、错误恢复

请问是否按此计划执行？
```

---

## 🛡️ Editing Policy Constraints (编辑策略约束)

This section defines the **execution-layer constraints** that govern HOW a model performs code modifications, complementing the routing strategy (which determines WHICH model handles which task).

> **Routing vs. Execution:** The routing strategy above decides "which model does what." These constraints decide "how the model must execute." Both layers apply to every code-modification task.

### Core Policy Constraints (POLICY_CONSTRAINTS)

These 7 constraints are injected into every agent's prompt and MUST be followed:

1. **MINIMAL EDIT** — Change only the necessary lines. Do not rewrite entire files or replace working code with equivalent implementations.
2. **SMALL PATCH** — Modify one function or one logical block at a time. No large-scale replacements.
3. **PRESERVE STYLE** — Keep existing formatting, indentation, naming conventions, and import ordering. No unauthorized formatting.
4. **SCOPE CONTROL** — Identify target file, target function, and modification area before acting. Do not exceed scope.
5. **NO UNREQUESTED REFACTORING** — Do not rename variables, move files, or change architecture unless explicitly requested.
6. **FAILURE RECOVERY** — If an edit fails, do NOT retry blindly. Recalculate the smallest possible patch.
7. **UNITY RULES** — Preserve lifecycle methods and do not change public APIs casually.

### Optional 4-Phase Compliance Pipeline (for Complex Tasks)

For tasks requiring significant code modification, the agent MAY invoke the **Policy-Enforced Workflow** (智能路由工作流):

```
Phase 1: Scout    → Identify exact scope (target file, function, lines)
Phase 2: Plan    → Create policy-compliant step-by-step plan
Phase 3: Execute → Apply smallest patch (one change at a time)
Phase 4: Verify  → Audit compliance, reject if violated
```

**Audit output format:**
```json
{
  "is_compliant": true,
  "violations": ["none"],
  "summary": "Changes match plan; scope respected"
}
```

**When to use:** Complex refactors, cross-module changes, or when the task involves modifying more than 3 files.

---

## 📝 Code Delivery Standards (Output Quality Rules)

These standards apply to ALL AI-generated code, regardless of model or project type.

### 1. No Pseudo-Code Allowed (严禁偷懒)

- **MUST output structurally complete, directly compilable/runnable code.**
- **NEVER use** `// ... keep original`, ellipsis (`...`), or placeholder comments to truncate code.
- **NEVER skip** imports, error handling, edge cases, or type definitions.
- If a file is too large to output in one response, the agent MUST split it into logical chunks and clearly mark the continuation points.

### 2. Complete File Output (完整文件输出)

When generating or modifying a file, the agent MUST output the **entire file content**, not just the changed portion. This ensures:
- The recipient can compile/run immediately without merging
- No risk of missing context from the original file
- Clear diff for version control

### 3. Documentation Persistence (文档沉淀)

Product design outputs at each stage (e.g., error messages, interaction flows) MUST be persisted locally to the `交互流程/` directory (or equivalent).

| Output Type | Target Directory |
|-------------|------------------|
| Error messages & copy | `PRD/error-messages/` |
| Interaction flows | `交互流程/` or `DESIGN/interactions/` |
| API contracts | `api/contracts/` |
| Design tokens / UI specs | `DESIGN/tokens/` or `ASSETS/design-system/` |

### 4. Self-Verification Before Delivery

Before delivering code, the agent MUST mentally verify:
- [ ] Does it compile / run without errors?
- [ ] Are all imports and dependencies included?
- [ ] Is error handling complete (try-catch, validation)?
- [ ] Are edge cases covered (empty input, network failure, invalid data)?
- [ ] Does it follow the project's existing conventions (naming, structure, patterns)?

---

## 🚫 Project-Level Hard Constraints (项目级硬约束)

**Purpose:** Define non-negotiable rules that ALL AI-generated code MUST obey. Violating any constraint is a critical error, regardless of other quality metrics.

**Format:** `HC-[NNN]: [Title]` — Type: Architecture/Security/Performance/Data Integrity/Platform-Specific | Rule: [Precise statement] | Consequence: [What happens if broken] | Applicable: All projects / specific types

**Auto-Recommended Constraints by Project Type (during initialization):**

| ID | Constraint (summary) | Type | Consequence |
|----|---------------------|------|-------------|
| HC-001 | `@State`/`@Binding` MUST NOT persist across view navigation; use `@Observable` (iOS 17+) or `@EnvironmentObject` | Architecture | Stale UI state, data inconsistency |
| HC-002 | All network requests: retry with exponential backoff (max 3, base 500ms) | Performance | App unresponsive on poor networks; user churn |
| HC-003 | All user-facing errors MUST be localized (min: en, zh-Hans); no hardcoded strings in production | Platform-Specific | App Store rejection (Guideline 4.1) |
| HC-004 | No direct file system access outside `Application Support` or `Documents` | Data Integrity | Sandbox violation; crash on restart |
| HC-005 | All UI animations MUST respect `Reduce Motion` (`Accessibility.isReduceMotionEnabled`) | Accessibility | App Store rejection (Guideline 4.3) |
| HC-006 | No direct DOM manipulation outside React/Vue lifecycle; all changes through framework reactivity | Architecture | Memory leaks, stale UI, race conditions |
| HC-007 | All API endpoints: rate limiting + auth checks; no public endpoint without auth middleware | Security | Unauthorized access, DDoS |
| HC-008 | All user inputs sanitized before rendering (XSS prevention); never `innerHTML`/`v-html` with user data | Security | XSS (OWASP Top 10) |
| HC-009 | All critical paths: loading states + error boundaries; no unhandled promise rejections | Performance | Frozen UI, silent failures |
| HC-010 | All API endpoints: rate limiting + auth checks; no public endpoint without auth middleware | Security | Unauthorized access, data breach |
| HC-011 | All database queries: parameterized statements; no string interpolation in SQL | Data Integrity | SQL injection (critical) |
| HC-012 | All error responses: HTTP status + machine-readable error code + human message; no raw stack traces in production | Architecture | Information leakage, broken client error handling |
| HC-013 | All file uploads: malware scan, size-limited (max 25MB), stored outside web root | Security | Server compromise, web root exposure |
| HC-014 | Simulation logic MUST NOT live in `MonoBehaviour` (Unity) or `AActor::Tick()` (Unreal); all in dedicated service classes | Architecture | Frame rate instability, save-game desync |
| HC-015 | All networked state: authoritative server-side; client predictions MUST be reconcilable | Architecture | Cheating, inconsistent game state |
| HC-016 | All asset loading: async APIs only; no synchronous `LoadAsset()` in gameplay code paths | Performance | Frame drops, input lag, platform rejection |
| HC-017 | Deterministic simulation: identical results across platforms for same seed and input sequence | Data Integrity | Multiplayer desync, replay system failure |
| HC-018 | All external API calls: timeout (max 30s) + retry logic; no blocking calls in async contexts | Performance | Hung processes, resource exhaustion |
| HC-019 | All configuration: loaded from env vars or config files; no hardcoded credentials | Security | Credential exposure in version control |

### User-Defined Hard Constraints

Users can add custom constraints at any time: "添加硬约束 HC-XXX：[description]" → the agent validates (a) specific and testable, (b) has clear violation consequence → appends with next available ID.

**Modify/remove:** "修改/删除 HC-XXX" → the agent requires user confirmation, records reason in `CONTINUE/decision-log/`.

### Hard Constraint Verification Checklist (before delivering ANY code)

```markdown
Hard Constraint Verification:
- [ ] HC-001 through HC-[last] (all applicable constraints checked)
- [ ] No violations detected, OR: Violation: HC-[NNN] — Reason: [justification, requires user approval]
```

**If any hard constraint is violated without explicit user approval → REJECT the output and regenerate.**

---

## Core Files (Always Detailed — Never Skip)

| File | Purpose | Maintained By |
|------|---------|---------------|
| `AGENTS.md` | AI interaction rules, context lifecycle layers (§11), maintenance checklists (§12), conversation strategy (§13), decision log management (§14), daily checklist (§15) | The agent |
| `PROJECT_CONTEXT.md` | Project goals, feature list, tech overview, memory decay strategy (§9), health dashboard (§10), maintenance tracking | Human + The agent |
| `MODEL_CONFIG.md` | Local model config (oMLX/Gemma/Qwen), model switching decision tree, dialogue management strategy | The agent |
| `REFERENCES.md` | Large file index and summaries (doc/PDF/Figma) | The agent |
| `[项目自有永久文件]` (如 `AI_CONTEXT_MAP.md`, `AI_PROGRESS_MAP.md`) | 任务路由/进度追踪等（项目自有核心文档） | 用户 + The agent (自动检测推荐) |
| `TEMPLATE_GUIDE.md` | Template usage guide with FAQ and quick reference | The agent |
| `STRUCTURE.md` | Directory structure overview and file relationship diagram | The agent |

### Dynamic Permanent Layer (P1-1 — 动态永久层, NEW in v1.9.5)

Unlike the old fixed-3-file model (AGENTS.md + PROJECT_CONTEXT.md + MODEL_CONFIG.md), the Permanent Layer is now **fully configurable** and **dynamically computed**.

#### Initialization Detection (Step 0c)

When initializing or re-initializing a project, the agent MUST scan the project root for known core document patterns and add them to the Permanent Layer:

| Detected File | Auto-Added to Permanent Layer? | Reason |
|---------------|-------------------------------|--------|
| `AI_CONTEXT_MAP.md` | ✅ Yes | Full task routing equivalent to AGENTS.md §3 |
| `AI_PROGRESS_MAP.md` | ✅ Yes | Full progress tracking equivalent to PROJECT_CONTEXT.md 进度部分 |
| `project-constants.md` | ✅ Yes (recommended) | Project-specific constants / feature flags |
| `tech-decisions.md` | ✅ Yes (recommended) | Architecture decision log (ADR) |
| `DESIGN_SYSTEM.md` | ✅ Yes (recommended) | UI design tokens and style guide |
| Custom file (user-added) | ✅ Yes (always) | User explicitly added via manual edit |

> **Detection priority**: Standard files (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md) always win. Project-owned equivalents only fill in the gaps.

#### Permanent Layer Extension Mechanism

Users can extend the Permanent Layer in two ways:
1. **Manual addition** — Edit `AGENTS.md §3` directly, adding any file path (always loaded regardless of Context Budget).
2. **The agent auto-recommendation** — When the agent detects a core project document (by naming patterns, content analysis, or frequency of reference), it recommends adding it.

**Budget Impact on Extended Permanent Layer:** User-added permanent files NEVER get demoted. If budget is tight, the agent demotes lower-priority standard files instead.

---

## Module Expansion Guide

When the user requests a detailed document for a module, the agent replaces placeholder files with complete chapter structure (goal description, chapter list, filling guide), and records the expansion in `CONTINUE/module-expanded-<name>.md`.

**Expansion targets:** PRD/<module>.md, ARCHITECTURE/{tech-stack,dependencies,build-config}.md, TESTING/{test-strategy,automation-scripts,coverage-requirements}.md, DEPLOYMENT/{release-process,app-store-guide,cicd-config}.md.

---

## SUPPLEMENTARY/ Chapters (Deep-Dive Reference)

These 7 chapters are initialized as detailed documents during project creation. They are read on-demand — not loaded into context automatically.

| ID | File | Content |
|----|------|---------|
| S01 | `S01-prompt-engineering.md` | Prompt templates for feature, refactor, review, and design tasks |
| S02 | `S02-trae-best-practices.md` | Rules, Memory, Workspace, Worktree, Context, Tool Call, Conversation |
| S03 | `S03-model-switching-decision-tree.md` | When to use Gemma vs Qwen vs cloud models; context window checks; network adaptation |
| S04 | `S04-long-term-project-strategy.md` | 3-month/6-month/1-year strategies; cross-session recovery; knowledge decay management |
| S05 | `S05-omlx-best-practices.md` | Context, Memory, SSD Cache, Profile, Benchmark, Runtime, Memory Guard |
| S06 | `S06-agent-task-granularity.md` | Task granularity decision; Apple App decomposition example (analysis→modeling→UI→network→animation→accessibility→testing→review) |
| S07 | `S07-appendices.md` | Directory, prompt, continue, decision, devlog templates; Apple Native/Game Project templates |

**Quick jump:** "What prompt?"→S01 | "Configure the agent?"→S02 | "Which model?"→S03 | "Project >1 month?"→S04 | "Local model tuning"→S05 | "Split tasks?"→S06 | "Template files?"→S07

---

## Module Summary Mechanism (CONTINUE/)

After completing a feature module, the agent generates `CONTINUE/<module>-summary.md` containing: feature overview (2-3 sentences), key technical decisions, known issues/todos, related file path index.

## Decision Log Management (CONTINUE/decision-log/)

Record important technical decisions for cross-session context recovery. **When to record:** tech stack/framework selection, architecture pattern choice, data persistence strategy, UI/UX design decisions, requirement changes, performance optimization strategy, third-party library/API selection. **File naming:** `CONTINUE/decision-log/YYYY-MM-DD-[module]-[short-title].md`.

**Decision log format:**
```markdown
## Decision Log: [Brief title]
- **Date:** YYYY-MM-DD | **Module:** [module name] | **Type:** Architecture / Tech Selection / Requirement Change / UI Design / Performance / Other
- **Background:** Why this decision was needed | **Final Decision:** Which option and why
- **Impact Scope:** Affected files and modules | **Review Date:** YYYY-MM-DD (30 days later)
```

---

## Verified Immutable Constraints (P2-1 — 已验证的知识固化, NEW in v1.9.2)

**Problem:** After multiple conversations, certain design decisions and engineering conventions become "verified truths" (e.g., "Population-centric model", "Utility AI not behavior trees"), but they are scattered across various documents.

**Mechanism:** After completing a module, the agent MUST automatically extract verified design decisions and consolidate them into an immutable constraint list.

### Extraction Rules (模块完成后自动提取)

When a module summary is generated (CONTINUE/<module>-summary.md), the agent MUST scan the following sources for verified constraints:

| Source | What to Extract | Constraint Type |
|--------|-----------------|-----------------|
| `PRD/<module>.md` | Non-negotiable requirements (performance targets, compatibility rules) | **Functional Constraint** |
| `CONTINUE/decision-log/` (last 30 days) | Architecture decisions that were validated through implementation | **Architectural Constraint** |
| `DEVLOG/` (module period) | Engineering conventions proven during development | **Engineering Constraint** |
| `ARCHIVE/` (if available) | Cross-module patterns that survived multiple iterations | **Pattern Constraint** |

### Consolidation Process (固化流程)

After generating module summary, the agent MUST: (1) scan decision logs from the same module period; (2) extract decisions meeting ALL criteria: implemented successfully (no rollback), referenced by ≥2 other modules/files, validated through testing/user acceptance; (3) format each as a "Verified Immutable Constraint" (VIC): `VIC-[ID]: [Title]` with Type, Source Module, Validation Evidence, Effective Date, Review Status (Active, +90 days), Override Procedure; (4) append to `CONTINUE/verified-constraints.md`; (5) add reference in AGENTS.md §3 (Permanent Layer); (6) mark as "Active" — subsequent conversations MUST respect without re-validating.

### Quarterly Review Mechanism (约束复审机制)

**Trigger:** Every 90 days during quarterly maintenance. For each Active VIC: assess if still functionally valid (no breaking changes), no architectural drift invalidated it, no new technology made it obsolete. Failed VICs marked "Deprecated" with reason, logged in `ARCHIVE/quarterly-YYYY-QX.md`. Passed VICs: extend review date by 90 days.

**User Override (用户手动推翻):** "推翻约束 VIC-[ID]，原因是 [reason]" → the agent marks as "Overridden" with reason recorded in `CONTINUE/verified-constraints.md`.

**Key Principle:** Verified Immutable Constraints eliminate redundant validation. Once consolidated, subsequent conversations MUST respect without re-evaluating — unless explicitly overridden.

---

## Development Log Mechanism (DEVLOG/)

Daily activity recording:

**Trigger:** New conversation OR manual log entry.

**Actions:**
1. Check if `DEVLOG/YYYY-MM-DD.md` exists for today
2. If not, create new file with: date, session summary, task list
3. If yes, append new log entry

**Periodic maintenance logs:**
- Weekly: `DEVLOG/weekly-YYYY-WXX.md` (moved to ARCHIVE/ during monthly maintenance)
- After maintenance: Update maintenance tracking dates in PROJECT_CONTEXT.md

---

## Archive Mechanism (ARCHIVE/)

Created automatically on first maintenance: `ARCHIVE/monthly-YYYY-MM.md` (monthly summary), `ARCHIVE/quarterly-YYYY-QX.md` (quarterly audit), `ARCHIVE/weekly-YYYY-WXX.md` (moved from DEVLOG/ during monthly maintenance).

---

## Context Lifecycle Layers (AGENTS.md §11)

Five-layer context architecture for managing document persistence:

| Layer | Retention | Auto-load | Cleanup Strategy | Examples |
|-------|-----------|-----------|------------------|----------|
| **Permanent** (动态预算) | Project lifetime | Every session (budget-limited) | Human decides removal; 初始化时按 T1-T5 档位动态调度: P0 文件始终加载, P1/P2 文件受预算限制, 超出部分降级为 Stable Layer | AGENTS.md (P0), MODEL_CONFIG.md (P0), [项目自有核心文档, 优先级排序] |
| **Stable** (按需加载) | Project lifetime | On-demand (via path) — 包含从 Permanent 层降级的高优先级文件 | Human decides archival | CONTINUE/*-summary.md, completed PRDs, AI_PROGRESS_MAP.md (当预算不足时) |
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

### Weekly (every 7 days) — "执行本周项目维护"
Confirm daily DEVLOG/ records, check modules in "developing" >14 days, confirm completed modules have CONTINUE/ summaries, verify milestone status in PROJECT_CONTEXT.md, generate `DEVLOG/weekly-YYYY-WXX.md`.

### Monthly (every 30 days) — "执行本月项目归档"
Mark DevLogs >30 days as disposable, check modules in "not started" >30 days, verify MODEL_CONFIG.md config, generate `ARCHIVE/monthly-YYYY-MM.md`, update milestone timeline.

### Quarterly (every 90 days) — "执行季度项目审计"
Delete/archive disposable DevLogs >90 days, review project scope (full/small/mvp), check MODEL_CONFIG.md for local model updates, assess overall health, generate `ARCHIVE/quarterly-YYYY-QX.md`.

**Trigger Methods:** Manual ("执行本周/月/季度维护"), Auto-reminder (the agent checks maintenance dates on new conversation), Milestone trigger (auto-run after completing major modules).

---

## User-Triggered Commands (P2 — 用户触发命令)

These are **user-triggered commands** for project maintenance, session management, compliance checking, and status queries. They invoke the same logic as the corresponding checklists above but provide explicit user-facing entry points.

### 项目维护 (Maintenance)
| 命令 | 触发语 | 频率 | 核心操作 |
|------|--------|------|---------|
| 周维护 | "执行本周项目维护" / "这周的维护检查一下" | 每7天 | 检查近7天 DEVLOG/ 记录 → 更新模块进度 → 生成 `DEVLOG/weekly-YYYY-WXX.md` |
| 月归档 | "执行本月项目归档" / "这个月的归档做一下" | 每30天 | 审查近30天日志 → 标记>30天日志为可丢弃 → 生成 `ARCHIVE/monthly-YYYY-MM.md` |
| 季度审计 | "执行季度项目审计" / "这个季度的全面检查做一下" | 每90天 | 全面健康评估 → 提取已验证约束 → 生成 `SUPPLEMENTARY/quarterly-YYYY-QX.md` |

### 会话管理 (Session Management)
| 命令 | 触发语 | 核心操作 |
|------|--------|---------|
| 保存进度 | "今天先这样，保存进度" / "执行工作结束清单" | 更新模块PRD → 追加 DEVLOG/ 记录 → 若模块完成则生成 CONTINUE/ 摘要 → 更新 `PROJECT_CONTEXT.md` 状态 |
| 新对话 | "开始新的对话" | 按 Context Budget 加载永久层文件 → 检查维护日期 → 显示项目状态摘要 |

### 合规检查 (Compliance Check)
| 命令 | 触发语 | 核心操作 |
|------|--------|---------|
| 快速检查 | "检查一下项目的合规情况" / "项目文档质量怎么样？" | 检查核心文件 (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, REFERENCES.md) + 标准目录 (PRD/, CONTINUE/, DEVLOG/) → 计算 0-100 评分 |
| 详细报告 | "显示详细的合规检查报告" / "帮我看看项目文档缺哪些部分" | 4阶段检查: 核心文件 → Context生命周期 → 硬件自适应 → 维护机制 → 总分 |
| 自动修复 | "帮我补齐缺失的合规文件" / "自动修复项目文档缺口" | 检测缺失文件 → 生成占位符 (PROJECT_CONTEXT.md, PRD/, CONTINUE/, DEVLOG/) → 重新评分并请求确认 |
| 历史趋势 | "看看合规评分的历史变化" / "显示项目文档的改进趋势" | 读取 `.compliance_history` 文件 → 展示评分趋势表 |

### 项目查询 (Project Query)
| 命令 | 触发语 | 核心操作 |
|------|--------|---------|
| 开发进度 | "当前项目的开发进度如何？" / "项目现在进行到哪一步了？" | 读取 `PROJECT_CONTEXT.md` 模块状态 → 展示各模块完成百分比 → 整体进度和健康状态 |
| 健康仪表板 | "显示当前项目健康仪表板" / "查看项目整体健康状况" | 读取 `PROJECT_CONTEXT.md` 所有仪表盘章节 (A-D)，游戏项目额外读取 Section E → 生成完整状态报告 |

**Fallback:** 若 `PROJECT_CONTEXT.md` 不存在或未初始化，the agent 必须提示用户先运行初始化命令。

## Long-Term Project Memory Decay Strategy (PROJECT_CONTEXT.md §9)

### Three-Layer Memory Architecture

```
External Memory (File System — AI-readable)
├── Permanent: AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md (auto-loaded every session)
├── Stable: Completed PRDs, CONTINUE/ summaries, ARCHIVE/ summaries (on-demand loading via path)
└── Index: REFERENCES.md, STRUCTURE.md (file location pointers; AI finds needed content via index)

Internal Memory (Conversation Context — single session only): Lost at session end unless written to external memory
Human Memory (Experience & Intuition — irreplaceable): Overall project understanding, decision reasoning, judgment
```

### Cross-Month Project Recovery Protocol (>7 days gap)

When last development was >7 days ago, on new conversation the agent MUST: (1) Read the last 3 months of ARCHIVE/ monthly summaries; (2) List all completed modules and their summaries; (3) Present "project state at last session" (last completed module name/date, currently developing module if any, known issues/todos); (4) Confirm user understanding before starting new development.

---

## Project Health Dashboard (PROJECT_CONTEXT.md §10)

A unified view integrating maintenance status, development progress, risk alerts, and system health.

**Dashboard Structure:**
```
Project Health Dashboard — [Project Name]
├── A. Maintenance Status: Last Weekly/Monthly/Quarterly [YYYY-MM-DD] — [Normal/Overdue]
├── B. Development Progress: Total [X], Completed [Y](Z%), In Progress [A], Not Started [B](C%)
├── C. Risk Alerts: Overdue Modules / Memory Decay Warnings / Technical Risks [list]
└── D. System Health: Core File Integrity ✓ | Decision Log Count [X] (30d) | Token Usage Trend [Rising/Stable/Falling] (4w)
```

**Health Standards:** Excellent: Completion >70%, no overdue modules, no warnings | Good: 40-70%, ≤1 overdue module, ≤2 warnings | Warning: 20-40%, >1 overdue module, or >2 warnings | Danger: <20% or zombie modules (>30 days inactive).

**Dashboard update triggers:** New conversation (auto-generate within first 3 rounds), module completion, maintenance execution, risk alert.

---

### Game Project Health Metrics (P2-2 — 游戏领域适配, NEW in v1.9.2)

When detected project type is **Game Project** (Unity/C# or Unreal/C++), the agent MUST extend the health dashboard with game-specific metrics. **Extended Dashboard (Game Projects Only):** Append Section E — 游戏特有指标: 编译状态/资产加载时间/Tick帧率抖动/确定性回放通过率.

**Game Health Score Standards (游戏健康度评分标准):**

| Grade | Criteria | Action Required |
|-------|----------|-----------------|
| **Excellent** 🟢 | 0 compilation errors + Tick frame rate stable (jitter <5%) + replay pass rate >95% | No action needed |
| **Good** 🟡 | ≤2 warnings + Tick frame rate jitter <10% + replay pass rate >85% | Monitor; schedule optimization in next sprint |
| **Warning** 🟠 | >2 warnings OR Tick frame rate jitter >10% OR replay pass rate <85% | Investigate root cause; prioritize in current sprint |
| **Danger** 🔴 | Compilation errors OR deterministic replay failures | Block all feature development until resolved |

**Game Risk Alert Rules:** Asset Pipeline Stale: Load time >2× baseline → alert in C. | Tick Drift Warning: Jitter >10% for >3 consecutive builds → alert in C. | Tick Drift Danger: Jitter >25% OR replay pass rate <70% → block all development (Danger grade). | Asset Overdue: PRD-defined asset not imported within 14 days → flag in C.

**Non-Game Projects:** When project type is NOT a game, Section E and Game-Specific Risks are automatically skipped. the agent marks `$game_health` as `false` in dashboard configuration.

---

## Project Query Commands (P2 — §4 项目查询管理)

These are **user-triggered query commands** for project status and health monitoring. They read from existing documentation rather than creating new content.

### 4.1 Query Development Progress (查询开发进度)

**Trigger Phrase:** "当前项目的开发进度如何？" / "项目现在进行到哪一步了？"
**The agent Actions:** Read `PROJECT_CONTEXT.md` module status section (typically §2 or §3). Display completion percentage for each feature module and overall project health status.

**Output Format:**
```markdown
当前项目开发进度：总模块数: [X] 模块状态: 用户登录模块 ✅ 已完成 (100%) — YYYY-MM-DD | 首页展示模块 🔄 开发中 (75%) — 预计 YYYY-MM-DD | 支付功能模块 ⏸️ 未开始 (0%)
整体进度: [Y]% | 健康状态: 🟢 正常 / 🟡 关注 / 🔴 危险
最近完成模块: [module-name] (YYYY-MM-DD) | 当前开发中模块: [module-name] ([Z]%)
```

### 4.2 Display Project Health Dashboard (显示项目健康仪表板)

**Trigger Phrase:** "显示当前项目健康仪表板" / "查看项目整体健康状况"
**Agent Actions:** Read `PROJECT_CONTEXT.md` (sections A-D); if Game project, also read game-specific metrics (Section E).

**Output Format:**
```markdown
项目健康仪表板 — [Project Name]
A. 维护状态: 上次周/月/季度维护 [YYYY-MM-DD] — ✅ 正常 / ⚠️ 逾期
B. 开发进度: 总[X] 已完成[Y](Z%) 开发中[A] 未开始[B](C%)
C. 风险告警: 逾期模块/记忆衰减/技术风险 [list or "无"]
D. 系统健康: 核心文件完整性 ✓ | 决策日志[X] (近30天) | Token趋势 📈/➡️/📉
整体健康评分: [Excellent/Good/Warning/Danger]
```

**Game Projects:** Append Section E — 游戏特有指标: 编译状态/资产加载时间/Tick帧率抖动/确定性回放通过率.

**Fallback (both commands):** If `PROJECT_CONTEXT.md` does not exist, the agent MUST inform: "项目尚未初始化，无法生成健康仪表板。请先运行 '这是一个完整的 [类型] 项目，包含 [功能]' 或 '帮我给这个项目加上协同工作流' 进行初始化。"

---

## Project Scale Assessment (P2-3 — 项目规模自适应, NEW in v1.9.2)

**Problem:** The three modes (Full / Small / MVP) are discrete categories, but real project scale is continuous. A "Medium" project (50-200 files) gets forced into either Full or Small mode.

**Solution:** 5-level continuous scale assessment that dynamically adjusts document detail level, sub-directory count, and maintenance frequency.

### Scale Assessment Algorithm (规模评估算法)

During initialization (all modes), the agent MUST run:
```
Step 1: Count total files (excluding node_modules/, .git/, build artifacts)
Step 2: Count source code files by language (.swift, .ts, .js, .py, .go, .rs, .cs, .cpp, etc.)
Step 3: Count distinct module directories (PRD-defined features or natural code groupings)
Step 4: Calculate: scale_score = (file_count × 0.3) + (source_file_count × 0.4) + (module_count × 15 × 0.3)
Step 5: Map score to scale level using thresholds below
```

### Scale Level Thresholds (规模分级标准)

| Scale Level | File Count | Source Files | Modules | Corresponding Mode | Document Detail Level | Sub-Dirs Created |
|-------------|-----------|--------------|---------|-------------------|----------------------|------------------|
| **Micro** | <10 files | <5 | 0-1 | MVP only (forced) | Minimal — core files only | Core + selected PRD placeholder |
| **Small** | 10–50 files | 5–30 | 2-4 | Small mode (default) | Standard — core + selected modules | Core + PRD, CONTINUE/ |
| **Medium** | 50–200 files | 30–100 | 4-8 | Full mode (reduced) | Detailed — core + most modules, skip DEPLOYMENT/ if not needed | Core + PRD, ARCHITECTURE/, CONTINUE/, DEVLOG/ |
| **Large** | 200–500 files | 100-300 | 8-15 | Full mode (default) | Complete — all modules with full detail | All directories including DEPLOYMENT/, TESTING/ |
| **Enterprise** | >500 files | >300 | 15+ | Full mode (extended) | Complete + additional sections (multi-tenant, compliance, SLA docs) | All directories + custom modules per user request |

### Dynamic Document Generation Rules (动态文档生成规则)

| Scale Level | PRD Depth | ARCHITECTURE Depth | TESTING Coverage | DEPLOYMENT Detail | Maintenance Frequency |
|-------------|-----------|-------------------|------------------|-------------------|----------------------|
| Micro | 1 page max (core feature only) | Skip entirely | Manual test notes in DEVLOG/ | Skip | Weekly checks only |
| Small | 2-3 pages per module (core features) | Tech stack summary only | Unit test targets documented | CI/CD basic config | Weekly monthly checks |
| Medium | 5-10 pages per module (full specs) | Full architecture docs for active modules | Coverage ≥60% target | Standard CI/CD + staging env | Weekly monthly checks; quarterly at 180 days |
| Large | Full PRD per module (comprehensive) | Complete architecture documentation | Coverage ≥80% target + E2E test plans | Full CI/CD + monitoring + rollback plans | Standard maintenance schedule |
| Enterprise | Full PRD + compliance docs per module | Complete architecture + multi-tenant design | Coverage ≥90% target + formal QA process | Full CI/CD + SLA docs + compliance audit | Standard maintenance + quarterly compliance review |

### Scale Migration Mechanism (规模迁移机制)

Projects can grow or shrink over time. the agent MUST support automatic scale migration: upward (Small → Medium, etc.) when file count crosses upper threshold for 2 consecutive monthly assessments; downward (Large → Medium, etc.) when file count drops below lower threshold for 2 consecutive monthly assessments.

- **Upward Migration:** Generate additional document sections that were previously skipped, expand existing PRD modules with more detailed specifications, add sub-directories that were previously omitted (e.g., add TESTING/ when entering Medium), update PROJECT_CONTEXT.md §1 (scope) with new scale level, notify user: "项目规模已从 [Level N] 增长到 [Level N+1]，已自动扩展以下文档结构：[list]"
- **Downward Migration:** Mark previously created optional directories as "deprecated" (move to ARCHIVE/), reduce PRD depth for modules that are no longer active, simplify maintenance schedule (reduce frequency if appropriate), update PROJECT_CONTEXT.md §1 (scope) with new scale level, notify user: "项目规模已从 [Level N] 缩减到 [Level N-1]，已精简以下文档结构：[list]"
- **Scale Migration Log:** Each scale migration is recorded in `PROJECT_CONTEXT.md §1` under a new subsection: `### Scale Migration History (P2-3)` with columns: Date, From Level, To Level, Trigger (File count crossed threshold), Actions Taken.

### Integration with Existing Modes (与现有模式的集成)

The scale assessment does NOT replace the three modes. Instead, it refines them: "这是 MVP" → **MVP** (document depth adjusted by scale); "这是小型项目" with Micro/Small scale → **Small** (standard behavior); "这是小型项目" with Medium/Large scale → **Small mode with Medium+ document depth** (user warned about mismatch); "这是完整项目" with Micro scale → **Full mode with Micro document depth** (user warned about mismatch); "这是完整项目" with Small/Medium/Large/Enterprise → **Full** (standard behavior).

> **Key Principle:** Scale assessment provides fine-grained control over document generation depth. The three modes (Full/Small/MVP) remain as user-facing triggers, but the actual document generation is adjusted by the assessed scale level. This ensures that even an MVP on a large codebase gets appropriate documentation depth, while a small project doesn't get overwhelmed by excessive documentation.

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
| **SimCore Dev** (Game) | Implement simulation core logic (Tick, ECS, UtilityAI, state machines) | UI/rendering changes |
| **Asset Gen** (Game) | Generate/import 3D models, textures, audio, animations | Gameplay logic changes |
| **Shader Dev** (Game) | Write/modify Unity Shaders or Unreal Materials, post-processing effects | Non-rendering code |
| **Level Design** (Game) | Scene layout, terrain, lighting, navmesh, spawn points | Core gameplay systems |

### Recommended Limits

Max conversation rounds: 30 (Q&A = 1 round). Max token usage: 80% of model safe limit (trigger context overflow handling). Max dev time: 2 hours per conversation (split longer sessions). Max file changes: 20 files per conversation (split into sub-tasks). Max code lines: 500 lines new code per conversation (split into sub-tasks).

### New Chat / Continue / Summary Decision Timing

Context usage reaches 80% → **New Chat** (keep core files, reference history via paths). Current module development complete → **Summary** to CONTINUE/ (mark as completed). Module interrupted >7 days → **New Chat** (load last summary first, recovery protocol). Continuous dev >2 hours or >30 rounds → **Intermediate summary** to CONTINUE/ (new chat for remaining work). Unresolvable error encountered → **Record in DEVLOG/** (new chat with different approach).

---

## Daily Checklist (AGENTS.md §15)

### Work Start (each new conversation)
Read permanent layer files (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md), confirm current project state (module list and milestones), check last maintenance dates (weekly/monthly/quarterly); remind if overdue, locate current working module (last developed module or milestone), execute cross-month recovery protocol if last development >7 days, present "current project state summary" to user and confirm understanding, define single goal for this conversation (single responsibility).

### Work End (before closing each conversation)
Update current module's DEVLOG/ log, generate CONTINUE/ summary if module completed, update module status in PROJECT_CONTEXT.md, generate decision log if important decisions made, check context usage (if >80%, suggest new chat and save progress), present "session work summary" to user and confirm state.

### Auto-Trigger Actions

| Trigger Condition | Auto Action |
|-------------------|-------------|
| New conversation start | Load permanent layer + check maintenance dates + show project state summary |
| Module completed | Auto-generate CONTINUE/ summary + update PROJECT_CONTEXT.md + run compliance check (score before/after) |
| Context usage >70% | Remind about unrecorded decisions + suggest new chat |
| Context usage >80% | Trigger context overflow handling + suggest new chat |
| User says "今天先这样"/"下次继续" | Execute work end checklist |
| Continuous conversation >20 rounds | Remind about sufficient logging/summaries |
| Last weekly maintenance >7 days | Remind on each new conversation start |
| Last monthly maintenance >30 days | Remind on each new conversation start |

### 8.1 Module Completion Auto-Check (完成重要模块后)

System detects user has just completed a feature module: auto-generate `CONTINUE/<module-name>-summary.md` (if not already generated), update module status in `PROJECT_CONTEXT.md` to "completed" with completion date, run quick compliance check and log score to `.compliance_history` (if history doesn't exist, create baseline), display compliance check result to user with suggestion (output format: 见 §7.1).

---

## Session Management Commands (P2 — §6 会话管理)

These are **user-triggered commands** for daily session lifecycle management. They ensure state continuity across conversations.

### 6.1 End Session (保存进度) — 会话结束

**Trigger Phrase:**
- "今天先这样，保存进度"
- "执行工作结束清单"

**When to Use:** End of daily development session — automatically update DEVLOG/, save progress, and confirm state.

**The agent Actions:**
1. Update corresponding module's PRD (if requirements changed during session)
2. Append DEVLOG/ entry (record this session's work)
3. If module completed, generate CONTINUE/ summary
4. Update `PROJECT_CONTEXT.md` module status (if changed)
5. If important decisions were made, generate decision log entry
6. Check context usage; if >80%, suggest new chat and save progress

**Output:** 见 §6.1 简化版，展示会话结束状态。

---

### 6.2 New Session (新对话) — 新会话启动

**Trigger Phrase:**
- "开始新的对话"

**When to Use:** Start a brand new conversation, automatically loading permanent layer files based on Context Budget.

**The agent Actions:**
1. Load permanent layer files (according to Context Budget):
   - P0 tier (all users): AGENTS.md + MODEL_CONFIG.md + [project context files]
   - T1 tier (≤16GB): P0 only (budget ≤8KB)
   - T2 tier (17-32GB): P0 + first P1 file (budget ≤15KB)
   - T3+ tier: can load more P1/P2 files (budget increases per tier)
2. Check maintenance dates (weekly/monthly/quarterly)
3. Show project state summary

**Output:** 见 §6.2 简化版，展示会话启动状态。

---

## Compliance Check Commands (P2 — §7 合规检查管理)

These are **user-triggered commands** for project documentation quality assessment. They perform a file-based compliance check WITHOUT requiring any external shell scripts — pure Markdown operations only.

### 7.1 Quick Compliance Check (快速合规检查)

**Trigger Phrase:**
- "检查一下项目的合规情况"
- "项目文档质量怎么样？"

**When to Use:** Quick assessment of project documentation completeness — shows overall compliance score and critical missing files.

**The agent Actions:**
1. Check existence of core files: AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, REFERENCES.md
2. Check existence of standard directories: PRD/, CONTINUE/, DEVLOG/
3. Calculate compliance score (0-100):
   - Core files present: 40 points (each worth ~10)
   - Standard directories present: 30 points (PRD, CONTINUE, DEVLOG)
   - Context lifecycle compliance: 15 points (permanent/working layers correct)
   - Hardware adaptive check: 10 points (budget within expected range)
   - Maintenance mechanism: 5 points (maintenance dates tracked)
4. Generate summary output

**Output:** 见 §7.2 (详细报告) 简化版，仅展示总分和核心文件状态。

---

### 7.2 Detailed Compliance Report (详细合规报告)

**Trigger Phrase:**
- "显示详细的合规检查报告"
- "帮我看看项目文档缺哪些部分"

**When to Use:** Multi-stage detailed report covering core files, context lifecycle, hardware adaptation, and maintenance mechanisms.

**The agent Actions:**
1. Run all 4 stages of compliance check:
   - **Stage 1:** Core file existence (AGENTS.md, PROJECT_CONTEXT.md, MODEL_CONFIG.md, REFERENCES.md)
   - **Stage 2:** Context lifecycle (permanent/working/ephemeral layers — check file ages)
   - **Stage 3:** Hardware adaptive (check if current Context Budget is within expected range for user tier)
   - **Stage 4:** Maintenance mechanism (check if weekly/monthly/quarterly maintenance dates are tracked and up-to-date)
2. Calculate total score across all stages
3. Present detailed report

**Output:** 见 §7.1 的完整版本，包含4阶段详细评分。

---

### 7.3 Auto-Fix Compliance Gaps (自动修复合规缺口)

**Trigger Phrase:**
- "帮我补齐缺失的合规文件"
- "自动修复项目文档缺口"

**When to Use:** Automatically detect and generate missing core files, then re-check compliance score.

**The agent Actions:**
1. Run quick compliance check to get current score and identify missing files
2. For each missing core file, generate a minimal placeholder:
   - `PROJECT_CONTEXT.md`: Create with default module list (empty) + dashboard template
   - `PRD/` directory: Create empty placeholder with README.md
   - `CONTINUE/` directory: Create empty placeholder
   - `DEVLOG/` directory: Create with today's date subfolder
3. Re-run compliance check and show before/after score comparison
4. Present results to user for confirmation

**Output:** 见 §7.1 修复版，展示修复前后评分对比。

**Fallback Behavior:** If user confirms, save all generated files. If user says "否" or similar, revert changes and inform: 已撤销所有更改，项目状态恢复到修复前。

---

### 7.4 View Compliance History (查看合规历史趋势)

**Trigger Phrase:**
- "看看合规评分的历史变化"
- "显示项目文档的改进趋势"

**When to Use:** Read `.compliance_history` file and display score trend over time.

**The agent Actions:**
1. Check if `.compliance_history` file exists (created by previous compliance checks)
2. If not, inform user that no history is available yet (first check will create it)
3. If exists, parse entries and display trend table

**Output:** 见 §7.1 趋势版，展示评分历史曲线。

## Large File Handling Rules

### Document Files (doc/PDF)
1. the agent reads original → generates short Markdown summary (written to REFERENCES.md)
2. Subsequent conversations only reference summary; original read via path when details needed
3. Prevents context overflow

### Figma Design Files
1. the agent uses Figma MCP to export by page/component
2. Each page generates independent document (`ASSETS/figma/<page-name>.md`)
3. Index in REFERENCES.md; the agent reads corresponding pages on demand

### Processing Flow
1. User submits large files → the agent auto-detects type (doc/PDF/Figma)
2. Process per corresponding strategy; never load full text into context
3. Record in REFERENCES.md: file type, path, summary, key information points

---

## File Read/Write Order

### Reading Order (each new conversation, subject to Context Budget)

1. AGENTS.md — reads [Budget-Limited Permanent File List] from §3
2. MODEL_CONFIG.md (before each conversation)
3. [Project-owned context map] → AI_CONTEXT_MAP.md or equivalent (P0/P1, Permanent Layer if budget allows)
4. [Budget-permitted progress tracker] → AI_PROGRESS_MAP.md (if T1/T2 budget insufficient, loaded from Stable Layer on-demand)
5. Current working document (PRD, engineering spec, etc.)
6. Related CONTINUE/ summaries (when continuing existing features)

> **Note:** If total permanent layer exceeds Context Budget, lower-priority files
> are demoted to Stable Layer (on-demand loading only). See AGENTS.md §3 for details.
>
> **Budget-aware behavior by tier (P1-1 Dynamic Permanent Layer):**
> - T1: Only P0 files loaded automatically (AGENTS.md + MODEL_CONFIG.md + PROJECT_CONTEXT_FILE); extended permanent layer always loaded but may push P0 to Stable Layer
> - T2: P0 + first P1 file loaded automatically; remaining P1 files on-demand from Stable Layer; extended permanent layer always loaded
> - T3+: All P0 + P1 files loaded automatically; P2 files on-demand; extended permanent layer always loaded
>
> **Dynamic loading order respects user-added priority:** User-added permanent files are read before standard P0 files if they were added more recently.

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
| **Current version** | 2.1 |
| **Created** | 2026-06-27 |
| **Last updated** | 2026-07-20 |
| **New in 2.1** | Phase 4.1 文档精简: 合并 P2 命令章节 (Session Management + Compliance Check + Project Query) 为紧凑表格格式，移除冗余输出示例 — SKILL.md 从 ~2400 行降至 ~1570 行，核心功能不变 |
| **New in 2.0** | Phase 2 全部完成: (1) P1-3 项目硬约束模板 (v1.9.1) — HC-001~HC-019 按项目类型自动推荐; (2) P1-1 动态永久层 (v1.9.5) — 初始化自动检测项目自有核心文档 + 永久层扩展机制 (用户手动添加 / the agent 自动推荐) + 预算豁免规则; (3) P1-2 Context Budget Guide (v1.9.6) — 基于项目规模的三级上下文预算 (Small/Medium/Large) + 任务级精度标注 |
| **New in 1.9.6** | P1-2 Context Budget Guide (项目级精度): 基于项目规模 (full/small/mvp) 的三级上下文预算指南 — Small (15-25KB / ≈4K-7K tokens, MVP 单模块) / Medium (30-50KB / ≈8K-14K tokens, 小范围 2-3 模块) / Large (50-70KB / ≈14K-20K tokens, 大范围多模块); 任务级精度 — 按任务类型 (需求分析/架构设计/代码生成/调试/跨模块审查/项目审计) 标注建议加载的文件路径和行号范围; 预算调整规则 — 根据项目规模 × T1-T5 档位动态调整预算级别; Shell Mode 项目默认 Medium 预算 |
| **New in 1.9.5** | P1-1 动态永久层: 从固定 3 文件改为完全可配置的永久层 — 初始化自动检测项目自有核心文档 (AI_CONTEXT_MAP.md, AI_PROGRESS_MAP.md, project-constants.md 等); 永久层扩展机制 (用户手动添加 / the agent 自动推荐); 用户添加的永久文件不受 Context Budget 限制 (始终加载，但可降级其他标准文件); 动态读取顺序尊重用户添加优先级 |
| **New in 1.9.2** | P1 级优化: (1) P1-1 游戏项目差异化内容 — §G1-G4 游戏专属章节模板 (Tick/Frame、确定性回放、头显模式、资产管道)、对话职责类型扩展 (SimCore Dev/Asset Gen/Shader Dev/Level Design)、游戏专属目录结构 (Assets/, BUILD/, GDD)、HC-014~HC-017 游戏硬约束; (2) P1-2 动态永久层调度 — T1-T5 档位→上下文预算上限映射表、6步调度算法 (检测/估算/填充/降级/标注/重算)、AGENTS.md §3 预算状态标注、Reading Order 支持动态加载顺序和预算感知 |
| **New in 1.9** | P0: Shell Mode + 功能等价检测 + 游戏项目增强: 合并模式增加"外壳模式"(Shell Mode)，当检测到≥2个功能等价文档时自动跳过冗余创建；增加"功能等价检测"(P0-3)，智能识别 AI_CONTEXT_MAP.md / AI_PROGRESS_MAP.md / 技术文件框架/ 与标准文件的等价关系；项目类型检测表增强游戏开发（Unity/Unreal），新增 Tick vs Frame、确定性回放、资产管道等游戏专属章节模板 |
| **New in 1.8** | 边界补全: 初始化后配置复用策略（Phase A/B — 后续任务不再重复弹出模型对话）；7 种边界情况降级处理（用户不理/随便填/只填一个/手工改配置等） |
| **New in 1.7** | Bug 修复: Full / Small / MVP 模式补充交互式模型对话 — 从 0 开始的新项目也会先运行模型对话，再执行文件生成 |
| **New in 1.6** | 架构重构: the agent 先检测，用户再确认 — 交互式对话不再是"填空"而是"确认"：the agent 先自动检测物理内存和模型服务状态（sysctl + curl），展示结果让用户确认/纠正，用户只需提供模型名（🧠/⚡）；检测环节提升为全局前置步骤，所有模式（Full/Small/MVP）统一先检测目录状态再决定行为；Full 模式在已有代码目录中自动降级为 Merge 模式以避免覆盖用户源码 |
| **New in 1.5** | Interactive model dialog: the agent asks user about their local model setup (memory, services, model names, ports) before any auto-detection; user fills in dialog box and confirms — no blind curl probing needed; fallback to auto-detection only if user skips fields; custom port support for both Reasoning and Generation models; source attribution in MODEL_CONFIG.md §0 (`[用户确认]` vs `[自动探测]`) |
| **New in 1.4** | True environment agnosticism: 5-tier continuous memory coverage (T1–T5 eliminates blind spots), start-of-session auto-detect (memory + model services → writable to MODEL_CONFIG.md §0), model-agnostic routing (Reasoning vs Generation roles, not hardcoded model names), templatized Contract Green Pass (variable placeholders resolved by project type), pure single-layer project handling (auto-skip cross-module logic), works with any model ecosystem (oMLX/Ollama/LM Studio/cloud-only) |
| **New in 1.3** | Full-stack OOM prevention: hardware-adaptive sensing, static physical blacklist, Contract Green Pass, device-adaptive circuit breaker thresholds |
| **New in 1.2** | Existing project detection & merge strategy (no overwrites), non-Apple project adaptation (Web/Backend/Game/etc.), project type auto-detection from existing files |
| **New in 1.1** | Context lifecycle layering, periodic maintenance checklists, model switching decision tree, long-term memory decay strategy, project health dashboard, conversation strategy, decision log management, daily checklist, SUPPLEMENTARY/ chapters, ARCHIVE/ mechanism |
| **Applicable scenario** | All software project types (Apple App, Web, Backend, CLI, Game, etc.) |
| **Local model service** | Model-agnostic (oMLX / Ollama / LM Studio / cloud-only) with interactive user dialog (the agent detects first, user confirms) |
