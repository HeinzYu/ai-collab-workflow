# ai-collab-workflow

> AI 协作开发的操作系统级工程规范 —— 让 AI Agent 在长期项目中始终保持对上下文的准确理解。  
> *An OS-level engineering specification for AI-assisted development — keeping AI Agents context-aware across long-running projects.*

[![Version](https://img.shields.io/badge/version-1.2-blue)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## 这是什么？ / What is this?

**ai-collab-workflow** 是一套面向 AI 辅助开发的文档框架和工作流规范。它不是一个代码库，而是一个 **项目基础设施模板** —— 当你在任何项目中初始化这套框架后，AI Agent（如 TRAE、Claude Code、Cursor、Codex 等）将拥有：

*ai-collab-workflow is a documentation framework and workflow specification for AI-assisted development. It is not a code library — it is a **project infrastructure template**. Once initialized, AI Agents (TRAE, Claude Code, Cursor, Codex, etc.) gain:*

- 🧠 **持久化的项目记忆** / *Persistent project memory* — 跨对话上下文不会丢失 / *context survives across sessions*
- 📋 **结构化的开发流程** / *Structured dev pipeline* — PRD → Architecture → Development → Testing → Deployment
- 🔄 **智能的上下文管理** / *Smart context management* — 五层 Context 生命周期，自动防止 Token 溢出 / *5-tier lifecycle prevents overflow*
- 📝 **自动化的文档维护** / *Automated documentation* — DevLog, module summaries, decision logs
- 🗓️ **周期性的健康检查** / *Periodic health checks* — 周/月/季度维护，防止"记忆衰减" / *weekly/monthly/quarterly maintenance*
- 🔀 **模型切换策略** / *Model switching strategy* — 本地模型 vs 云端模型的智能决策树 / *local vs cloud decision tree*

---

## 快速开始 / Quick Start

### 方式 A：作为 TRAE Skill 安装（推荐）/ Install as TRAE Skill (Recommended)

```bash
git clone https://github.com/HeinzYu/ai-collab-workflow.git

# 安装 Skill：让 TRAE 自动理解并执行整个工作流
cp -r ai-collab-workflow/.trae/skills/ai-collab-workflow ~/.trae/skills/

# 在你的项目中，直接对 TRAE 说：
```
> "这是一个完整的 Apple App 项目，包含登录、首页、设置等功能"

TRAE 会自动初始化整个框架。Skill 让 TRAE 理解何时触发、如何适配不同项目类型（Apple App / Web / Backend / Game），以及如何安全地合并到已有项目中。

---

### 方式 B：手动复制模板 / Copy Manually

```bash
git clone https://github.com/HeinzYu/ai-collab-workflow.git
cp -r ai-collab-workflow/TEMPLATE_FRAMEWORK/* your-project/
```

复制完成后，在你的 AI Agent 中说：
```
"This is a full-stack project with login, dashboard, and settings features."
```
*The AI Agent auto-fills PROJECT_CONTEXT.md and generates all module placeholders.*

---

### 开始开发 / Start developing

```
"Generate a detailed PRD for the login feature."
"Start developing the login module."
```

---

## 目录结构 / Directory Structure

```
ai-collab-workflow/
├── README.md                    ← 本文件 / This file
├── .trae/skills/                ← TRAE Skill 定义 / Skill definition
│   └── ai-collab-workflow/
│       └── SKILL.md             ← Skill 规则（安装后 TRAE 自动执行）
├── TEMPLATE_FRAMEWORK/          ← 模板文件 / Template files
│   ├── AGENTS.md                ★ Global rules for AI Agents
│   ├── PROJECT_CONTEXT.md       ★ Project core
│   ├── MODEL_CONFIG.md          ★ Model config
│   ├── ...
├── LICENSE / CHANGELOG.md / CONTRIBUTING.md
└── .github/workflows/           ← CI 自动检查
```

---

## 核心特性 / Core Features

### 🧠 Context 生命周期分层 / Context Lifecycle Tiers

```
Permanent  — Always loaded, never deleted
  ├── AGENTS.md / PROJECT_CONTEXT.md / MODEL_CONFIG.md
Stable     — Loaded on demand, retained for project lifetime
  ├── Completed PRDs / CONTINUE summaries / ARCHIVE digests
Working    — Loaded for current session
  ├── Active PRD / Last 7 days of DevLog
Temporary  — Valid for 30 days
Disposable — Cleaned up quarterly
```

### 🔀 模型切换决策树 / Model Switching Decision Tree

```
Task arrives → Evaluate complexity → Select model
  ├── Simple → Gemma (local, zero cost)
  ├── Medium → Qwen (local, large context)
  └── Complex → Claude/GPT (cloud, strong reasoning)
```

### 📋 Prompt 工程标准 / Prompt Engineering Standard

内置 6 套 Prompt 模板：大型任务、重构、审查、设计、调试、架构设计。每套模板都有明确的输入/输出规范和验收标准。  
*Built-in 6 Prompt templates: Feature Implementation, Refactoring, Review, Design, Debug, Architecture Design — each with clear I/O specs and acceptance criteria.*

### 🗓️ 周期性维护 / Periodic Maintenance

| 周期 / Cycle | 操作 / Action | 触发指令 / Trigger |
|------|------|------|
| 每周 / Weekly | 检查进度、生成周总结 / *Check progress, generate weekly summary* | `"Execute weekly maintenance"` |
| 每月 / Monthly | 归档 DevLog、生成月摘要 / *Archive DevLog, generate monthly digest* | `"Execute monthly archive"` |
| 每季度 / Quarterly | 物理清理、审计 scope / *Physical cleanup, audit scope* | `"Execute quarterly audit"` |

---

## 适用场景 / Use Cases

| 项目类型 / Project Type | 推荐配置 / Recommended |
|---------|---------|
| 🍎 Apple Native App (SwiftUI) | `scope: full` |
| 🌐 Web Application | `scope: full` |
| ⚙️ Backend Service | `scope: full` |
| 🛠️ Small Utility | `scope: small` — skips testing/deployment modules |
| 🧪 Prototype (MVP) | `scope: mvp` — PRD modules only |

---

## 版本历史 / Version History

| 版本 | 日期 / Date | 主要变更 / Highlights |
|------|------|---------|
| v1.0 | 2026-06-27 | Initial framework: core files + module placeholders + large file handling + model config |
| v1.1 | 2026-06-28 | Context lifecycle tiers, periodic maintenance, model switching tree, memory decay strategy, health dashboard, conversation strategy, decision logs, daily checklist |
| v1.2 | 2026-06-28 | SUPPLEMENTARY chapter system, Prompt engineering standard, TRAE best practices, long-term project strategy |

详见 / *See* [CHANGELOG.md](CHANGELOG.md)

---

## 设计哲学 / Design Philosophy

这套框架默认面向 **TRAE Agent**，但架构设计为 **工具无关** —— 所有的规则、模板、工作流都可以无缝适配 Claude Code、Cursor、Codex、Gemini CLI 等任何 AI Coding Agent。

*This framework defaults to **TRAE Agent**, but is designed **tool-agnostic** — all rules, templates, and workflows adapt seamlessly to Claude Code, Cursor, Codex, Gemini CLI, or any AI Coding Agent.*

核心理念 / *Core philosophy* from [AI-Development-Workflow.md](AI-Development-Workflow.md):
> 把它当作你的"AI 开发操作系统"，而不是一篇普通文档。  
> *Treat it as your "AI Development Operating System," not just another document.*

---

## 贡献 / Contributing

欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 了解行为准则和 Pull Request 流程。  
*Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for our code of conduct and PR process.*

---

## 许可 / License

MIT License — 详见 / *see* [LICENSE](LICENSE)
