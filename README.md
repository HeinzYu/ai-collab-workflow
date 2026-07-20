# ai-collab-workflow

> **AI Project Documentation Framework** — Keep AI Agents (TRAE, Claude Code, Cursor, Codex, Gemini CLI, etc.) context-aware across sessions, no matter how long the project gets.

[![Version](https://img.shields.io/badge/version-2.1-blue)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Language](https://img.shields.io/badge/language-markdown-DB4936.svg)]()
[![Topics](https://img.shields.io/badge/topics-ai--agents%2C%20developer--tools%2C%20project--templates-blue?style=flat)]()

<!-- Language Toggle -->
<div style="text-align: right; margin-bottom: 16px;">
  <button id="lang-toggle" onclick="toggleLang</think>" style="background: #1a1e24; color: #c9d1d9; border: 1px solid #30363d; padding: 6px 16px; border-radius: 6px; cursor: pointer; font-size: 14px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
    切换语言 / Switch Language
  </button>
</div>

<!-- EN Content -->
<div id="en-content">
  <h2>The Problem, Solved</h2>

  | Scenario | Pain Point | How ai-collab-workflow Helps |
  |----------|-----------|-----------------------------|
  | 🔄 **New session, AI forgot past decisions** | *"We agreed on OAuth login — why is it back to email auth?"* | Persistent project memory across sessions |
  | 📦 **Project grows, AI starts hallucinating** | *"This file was written three months ago — why is it being rewritten?"* | Context lifecycle tiers + periodic maintenance |
  | 💻 **AI is burning your local RAM** | *"48GB Mac froze — model went OOM"* | Device-adaptive 5-tier protection, auto-detects your hardware |
  | 🤖 **Switched AI tools, rules need rewriting** | *"Migrated from Cursor to TRAE — redoing everything"* | Tool-agnostic design, one framework for all AI Agents |
  | 🧹 **Mid-project, no idea what to maintain** | *"What should I archive this month?"* | Weekly / monthly / quarterly maintenance commands |

  <h2>Quick Start (3 Minutes)</h2>

  ```bash
  # One-line install (recommended)
  curl -sSL https://raw.githubusercontent.com/HeinzYu/ai-collab-workflow/main/install.sh | bash

  # Or manual install:
  git clone https://github.com/HeinzYu/ai-collab-workflow.git
  cd ai-collab-workflow
  bash install.sh
  ```

  In your project, tell the AI:

  > "This is a full-stack web app with login, dashboard, and settings features"

  The AI Agent automatically initializes the entire framework — no manual file creation needed.

  <h3>📢 Trigger Phrases (Natural Language, No Memorization)</h3>

  | Scenario | Example Trigger |
  |----------|----------------|
  | 🚀 **Project Initialization** (4 types) | "This is a complete [type] project with [features]" / "This is a simple tool App" / "This is an MVP prototype" |
  | 🔗 **Existing Project Integration** (3 types) | "Help me add the collaborative workflow to this project" |
  | 🛠️ **Module Development** (4 types) | "Generate detailed PRD for [module name]" / "Today's development: [module name]" |
  | 📊 **Project Query** (2 types) | "What's the current development progress?" / "Show project health dashboard" |
  | 🧹 **Project Maintenance** (3 types) | "Execute weekly/monthly/quarterly project maintenance" |
  | 💬 **Session Management** (2 types) | "That's it for today, save progress" / "Start a new session" |
  | ✅ **Compliance Check** (4 types) | "Check the project's compliance status" / "Help me fill missing compliance files" |
  | ⚙️ **Auto-triggered** (6 scenarios) | System executes automatically, no user input needed |

  > **💡 Core Principle**: Just express your needs in natural conversation — no special syntax or command-line parameters to memorize. See [TRIGGER_COMMANDS.md](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md) for the complete list.

  <h2>What You Get</h2>

  ### 🧠 AI Gets "Project Memory"
  - Every new session, AI knows the PRD, architecture, completed items, and pending tasks
  - Solved problems stay solved; decisions are not overturned

  ### 📋 Full Pipeline: Idea → Production
  ```
    PRD   →  Architecture  →  Development  →  Testing  →  Deployment
            tech stack         code            auto       app store
  ```

  ### 🖥️ Runs on Any Machine
  Auto-detects your physical RAM on startup. Adapts automatically from a 16GB laptop to a 128GB workstation.

  ### 🤖 Switch AI Tools, Keep the Rules
  One framework works with TRAE, Claude Code, Cursor, Codex, Gemini CLI — any AI Coding Agent.

  <h2>Key Features (v2.1)</h2>

  ### Hardware-Adaptive Memory Protection
  Five-tier system (T1–T5) covering ≤16GB to ≥65GB. Each tier has its own token budget, context loading strategy, and cross-module access rules. **No more OOM crashes.**

  ### Dynamic Permanent Layer (v2.0)
  On initialization, the framework auto-detects project-owned core documents (AI_CONTEXT_MAP.md, AI_PROGRESS_MAP.md, etc.) and adds them to the Permanent Layer. User-added files are never demoted — even under tight budgets.

  ### Shell Mode (v1.9.2)
  When a project already has its own documentation system, the framework wraps around it as a "shell" instead of overwriting. Detects functional equivalents and skips redundant file creation.

  ### Model-Agnostic Routing
  Classifies tasks into **Reasoning** (🧠) and **Generation** (⚡) roles — works with any model: Claude, GPT-4o, Gemma, Qwen, Llama, DeepSeek, or cloud Agent.

  ### Editing Policy Constraints
  Seven non-negotiable rules (MINIMAL EDIT, SMALL PATCH, PRESERVE STYLE, SCOPE CONTROL, NO UNREQUESTED REFACTORING, FAILURE RECOVERY, UNITY RULES) enforced on every code modification.

  ### Hard Constraints System
  Pre-built constraints (HC-001 ~ HC-019) auto-recommended by project type (Apple App / Web / Backend / Game / Python). Users can add custom constraints (HC-020+).

  ### Context Lifecycle Management
  Five-layer architecture (Permanent → Stable → Working → Temporary → Disposable) with automatic promotion/demotion rules.

  ### Periodic Maintenance
  Weekly, monthly, and quarterly checklists with automatic archive generation.

  <h2>Directory Structure (After Initialization)</h2>

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

  <h2>Supported Project Types</h2>

  | Type | Detection Signals | Key Adaptations |
  |------|-------------------|-----------------|
  | **Apple App** (SwiftUI) | `.swift`, `Package.swift` | Default — "iOS / Swift / SwiftUI" |
  | **Web Frontend** | `package.json` + `next.config.*` / `vite.config.*` | "React/Next.js/Vue + TypeScript" |
  | **Node.js Backend** | `package.json` + `express` / `fastify` | "Node.js + Express/Fastify" |
  | **Python** | `requirements.txt` / `pyproject.toml` | "Python + FastAPI/Django/etc." |
  | **Rust** | `Cargo.toml` | "Rust + [framework]" |
  | **Go** | `go.mod` | "Go + [framework]" |
  | **Unity Game** | `.cs` + `.unity` scenes | Game-specific sections (Tick, ECS, Asset Pipeline) |
  | **Unreal Game** | `.cpp` + `.uproject` | Game-specific sections (C++ version) |

  <h2>Go Deeper</h2>

  | You want to learn | Go here |
  |-------------------|---------|
  | Full feature specs (Context tiers, model routing, maintenance) | [Core Doc](AI-Development-Workflow.md) |
  | What each template file does | [Template Guide](TEMPLATE_FRAMEWORK/TEMPLATE_GUIDE.md) |
  | Adapting to existing projects or other platforms | [Supplementary Docs](TEMPLATE_FRAMEWORK/SUPPLEMENTARY/README.md) |
  | Version changelog | [CHANGELOG](CHANGELOG.md) |

  <h2>Contributing</h2>
  Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

  <h2>License</h2>
  MIT — See [LICENSE](LICENSE)
</div>

<!-- ZH Content -->
<div id="zh-content" style="display: none;">
  <h2>你的问题，它来解</h2>

  | 场景 | 痛点 | ai-collab-workflow 怎么帮 |
  |------|------|------------------------|
  | 🔄 **换了一个对话，AI 忘了上次的决定** | "我们不是定好登录用 OAuth 吗？怎么又改成邮箱了？" | 持久化项目记忆，跨会话不丢上下文 |
  | 📦 **项目变大后 AI 开始"幻觉"** | "这个文件明明三个月前就写好了，怎么又在改？" | Context 生命周期分层 + 定期维护机制 |
  | 💻 **本地跑 AI，内存爆了** | "48GB 的 Mac 都卡死，模型直接 OOM" | 硬件自适应五档防护，自动适配你的设备 |
  | 🤖 **换了个 AI 工具，所有规则要重写** | "从 Cursor 换到 TRAE，又要重新调一遍" | 工具无关设计，规则一套通用所有 AI Agent |
  | 🧹 **项目做了一半，不知道维护什么** | "这个月该归档哪些文件？谁说了算？" | 周/月/季度自动维护指令，一键清理 |

  <h2>快速开始</h2>

  ```bash
  # 一键安装 (推荐)
  curl -sSL https://raw.githubusercontent.com/HeinzYu/ai-collab-workflow/main/install.sh | bash

  # 或手动安装:
  git clone https://github.com/HeinzYu/ai-collab-workflow.git
  cd ai-collab-workflow
  bash install.sh
  ```

  在你的项目中对 AI Agent 说：

  > "这是一个完整的 [类型] 项目，包含 [功能]"

  AI Agent 会自动初始化整个框架。

  <h3>📢 所有场景触发语（完整列表见 [启动语使用指南](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md)）</h3>

  | 场景分类 | 触发语示例（自然语言，无需记忆） | 完整说明 |
  |---------|-------------------------------|----------|
  | 🚀 **项目初始化** (4条) | "这是一个完整的 [类型] 项目，包含 [功能]" / "这是一个简单的工具 App" / "这是一个原型验证" | [§1 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#1-项目初始化类启动语) |
  | 🔗 **已有项目集成** (3条) | "帮我给这个项目加上协同工作流" | [§2 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#2-已有项目集成类启动语) |
  | 🛠️ **模块开发管理** (4条) | "生成 [模块名] 功能的详细 PRD" / "今天做 [模块名] 功能" | [§3 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#3-模块开发管理类启动语) |
  | 📊 **项目查询与管理** (2条) | "当前项目的开发进度如何？" / "显示当前项目健康仪表板" | [§4 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#4-项目查询与管理类启动语) |
  | 🧹 **项目维护管理** (3条) | "执行本周/本月/季度项目维护" | [§5 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#5-项目维护管理类启动语) |
  | 💬 **会话管理** (2条) | "今天先这样，保存进度" / "开始新的对话" | [§6 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#6-会话管理类启动语) |
  | ✅ **合规检查管理** (4条) | "检查一下项目的合规情况" / "帮我补齐缺失的合规文件" | [§7 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#7-合规检查管理类启动语) |
  | ⚙️ **自动触发场景** (6种) | 系统自动执行，无需用户输入 | [§8 详细说明](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md#8-自动触发场景无需用户输入) |

  > **💡 核心原则**: 像日常对话一样表达你的需求即可，无需记忆任何特殊语法或命令行参数。完整启动语列表和使用指南请参阅 [TRIGGER_COMMANDS.md](.trae/skills/ai-collab-workflow/TRIGGER_COMMANDS.md)。

  <h2>你能得到什么</h2>

  ### 🧠 AI 有了"项目记忆"
  - 每次新对话，AI 都知道项目的 PRD、架构、已完成和待办事项
  - 不再重复已解决的问题，不会推翻已有的决定

  ### 📋 从想法到上线的完整流程
  ```
    需求文档 → 架构设计 → 开发实现 → 测试验证 → 部署上线
       PRD      技术栈       代码        自动化     应用商店
  ```

  ### 🖥️ 任何设备都能跑
  启动时自动检测物理内存，从 16GB 笔记本到 128GB 工作站，自动适配最合适的运行模式。

  ### 🤖 换 AI 工具不换规则
  一套框架适配 TRAE、Claude Code、Cursor、Codex、Gemini CLI 等任何 AI Coding Agent。

  <h2>核心特性 (v2.1)</h2>

  ### 硬件自适应内存保护
  五档系统 (T1–T5) 覆盖 ≤16GB 到 ≥65GB。每档有独立的 token 预算、上下文加载策略和跨模块访问规则。**不再有 OOM 崩溃。**

  ### 动态永久层 (v2.0)
  初始化时自动检测项目自有核心文档 (AI_CONTEXT_MAP.md, AI_PROGRESS_MAP.md 等) 并加入永久层。用户添加的文件永不降级——即使预算紧张。

  ### 外壳模式 (v1.9.2)
  当项目已有自有文档系统时，框架以"外壳"包裹而非覆盖。检测功能等价物并跳过冗余文件创建。

  ### 模型无关路由
  将任务分为**推理型** (🧠) 和**生成型** (⚡) 两类——适用于任何模型：Claude、GPT-4o、Gemma、Qwen、Llama、DeepSeek 或云端 Agent。

  ### 编辑策略约束
  七条不可违背的规则 (MINIMAL EDIT, SMALL PATCH, PRESERVE STYLE, SCOPE CONTROL, NO UNREQUESTED REFACTORING, FAILURE RECOVERY, UNITY RULES)，每条代码修改都强制执行。

  ### 硬约束系统
  预置约束 (HC-001 ~ HC-019) 按项目类型自动推荐 (Apple App / Web / Backend / Game / Python)。用户可添加自定义约束 (HC-020+)。

  ### 上下文生命周期管理
  五层架构 (永久 → 稳定 → 工作 → 临时 → 可弃)，自动升降级规则。

  ### 定期维护
  周/月/季度检查清单，自动生成归档。

  <h2>目录结构 (初始化后)</h2>

  ```
  Project/
  ├── AGENTS.md                    ★ AI 交互核心规则 (始终详细)
  ├── PROJECT_CONTEXT.md           ★ 项目目标、功能、健康仪表板
  ├── MODEL_CONFIG.md              ★ 本地模型配置 + 切换决策树
  ├── REFERENCES.md                ★ 大文件索引 (doc/PDF/Figma)
  ├── TEMPLATE_GUIDE.md            ★ 模板使用指南
  ├── STRUCTURE.md                 ◉ 目录结构概览

  # 按需展开模块 (初始为占位符):
  ├── PRD/                         ○ 功能需求文档
  ├── ARCHITECTURE/                ○ 技术栈、依赖、构建配置
  ├── TESTING/                     ○ 测试策略、脚本、覆盖率
  ├── DEPLOYMENT/                  ○ 发布流程、应用商店、CI/CD
  ├── DEVLOG/                      ○ 每日开发日志 (自动生成)
  ├── CONTINUE/                    ○ 模块摘要 + 决策日志
  ├── SUPPLEMENTARY/               ○ 深入补充章节
  └── ARCHIVE/                     ◉ 月/季度摘要 (首次维护时创建)
  ```

  <h2>支持的项目类型</h2>

  | 类型 | 检测信号 | 关键适配 |
  |------|---------|---------|
  | **Apple App** (SwiftUI) | `.swift`, `Package.swift` | 默认 — "iOS / Swift / SwiftUI" |
  | **Web 前端** | `package.json` + `next.config.*` / `vite.config.*` | "React/Next.js/Vue + TypeScript" |
  | **Node.js 后端** | `package.json` + `express` / `fastify` | "Node.js + Express/Fastify" |
  | **Python** | `requirements.txt` / `pyproject.toml` | "Python + FastAPI/Django/etc." |
  | **Rust** | `Cargo.toml` | "Rust + [framework]" |
  | **Go** | `go.mod` | "Go + [framework]" |
  | **Unity 游戏** | `.cs` + `.unity` 场景 | 游戏专属章节 (Tick, ECS, 资产管道) |
  | **Unreal 游戏** | `.cpp` + `.uproject` | 游戏专属章节 (C++ 版本) |

  <h2>深入阅读</h2>

  | 你想了解 | 看这里 |
  |---------|--------|
  | 完整的功能特性 (Context 分层、模型路由、维护策略) | [核心文档](AI-Development-Workflow.md) |
  | 模板目录中每个文件的用途 | [TEMPLATE_GUIDE](TEMPLATE_FRAMEWORK/TEMPLATE_GUIDE.md) |
  | 如何适配已有项目或不同平台 | [补充文档](TEMPLATE_FRAMEWORK/SUPPLEMENTARY/README.md) |
  | 版本变更记录 | [CHANGELOG](CHANGELOG.md) |

  <h2>贡献</h2>
  欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。

  <h2>许可</h2>
  MIT — See [LICENSE](LICENSE)
</div>

<script>
function toggleLang() {
  const en = document.getElementById('en-content');
  const zh = document.getElementById('zh-content');
  if (zh.style.display === 'none') {
    zh.style.display = 'block';
    en.style.display = 'none';
  } else {
    zh.style.display = 'none';
    en.style.display = 'block';
  }
}
</script>
