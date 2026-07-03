# ai-collab-workflow

> AI Project Documentation Framework — Keep AI Agents (TRAE, Claude Code, Cursor, Codex, etc.) context-aware across sessions, no matter how long the project gets.

[![Version](https://img.shields.io/badge/version-2.0-blue)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Language](https://img.shields.io/badge/language-markdown-DB4936.svg)]()
[![Topics](https://img.shields.io/badge/topics-ai--agents%2C%20developer--tools%2C%20project--templates-blue?style=flat)]()

<details>
<summary>📖 中文版本 / Chinese Version</summary>

> AI 项目文档框架 — 让 TRAE、Claude Code、Cursor、Codex 等 AI Agent 跨会话保持上下文一致

---

## 你的问题，它来解

| 场景 | 痛点 | ai-collab-workflow 怎么帮 |
|------|------|------------------------|
| 🔄 **换了一个对话，AI 忘了上次的决定** | "我们不是定好登录用 OAuth 吗？怎么又改成邮箱了？" | 持久化项目记忆，跨会话不丢上下文 |
| 📦 **项目变大后 AI 开始"幻觉"** | "这个文件明明三个月前就写好了，怎么又在改？" | Context 生命周期分层 + 定期维护机制 |
| 💻 **本地跑 AI，内存爆了** | "48GB 的 Mac 都卡死，模型直接 OOM" | 硬件自适应五档防护，自动适配你的设备 |
| 🤖 **换了个 AI 工具，所有规则要重写** | "从 Cursor 换到 TRAE，又要重新调一遍" | 工具无关设计，规则一套通用所有 AI Agent |
| 🧹 **项目做了一半，不知道维护什么** | "这个月该归档哪些文件？谁说了算？" | 周/月/季度自动维护指令，一键清理 |

## 快速开始

### 3 分钟安装

```bash
# 1. 克隆仓库
git clone https://github.com/HeinzYu/ai-collab-workflow.git

# 2. 安装为 TRAE Skill（推荐）
cp -r ai-collab-workflow/.trae/skills/ai-collab-workflow ~/.trae/skills/
```

在你的项目中对 TRAE 说：

> "这是一个完整的 Apple App 项目，包含登录、首页、设置等功能"

TRAE 会自动初始化整个框架。

## 你能得到什么

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

### 🧩 v2.0 新增：智能文档合并
- **功能等价物检测** — 自动识别项目自有文档（如 `AI_CONTEXT_MAP.md`、`技术文件框架/`）与标准文件的等效关系
- **Shell Mode 外壳模式** — 保留项目自有文档结构，标准框架作为"外壳"包裹已有内容
- **智能跳过** — 检测到等价文档时自动创建引用，避免冗余文件

## 目录结构

```
ai-collab-workflow/
├── .trae/skills/            ← 安装到 ~/.trae/skills/ 即可使用
├── TEMPLATE_FRAMEWORK/      ← 手动安装时复制到你的项目根目录
│   ├── AGENTS.md            AI Agent 的全局规则
│   ├── PROJECT_CONTEXT.md   项目核心（AI 自动填充）
│   └── MODEL_CONFIG.md      AI 模型配置
├── CHANGELOG.md             版本历史
└── CONTRIBUTING.md          贡献指南
```

## 深入阅读

| 你想了解 | 看这里 |
|---------|--------|
| 完整的功能特性（Context 分层、模型路由、维护策略） | [核心文档](AI-Development-Workflow.md) |
| 模板目录中每个文件的用途 | [TEMPLATE_GUIDE](TEMPLATE_FRAMEWORK/TEMPLATE_GUIDE.md) |
| 如何适配已有项目或不同平台 | [补充文档](TEMPLATE_FRAMEWORK/SUPPLEMENTARY/README.md) |
| 版本变更记录 | [CHANGELOG](CHANGELOG.md) |

## 贡献

欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 许可

MIT — See [LICENSE](LICENSE)

</details>

---

## When You Face This

| Scenario | Pain Point | How ai-collab-workflow Helps |
|------|------|------|
| 🔄 **New session, AI forgot past decisions** | "We agreed on OAuth login — why is it back to email auth?" | Persistent project memory across sessions |
| 📦 **Project grows, AI starts hallucinating** | "This file was written three months ago — why is it being rewritten?" | Context lifecycle tiers + periodic maintenance |
| 💻 **AI is burning your local RAM** | "48GB Mac froze — model went OOM" | Device-adaptive 5-tier protection, auto-detects your hardware |
| 🤖 **Switched AI tools, rules need rewriting** | "Migrated from Cursor to TRAE — redoing everything" | Tool-agnostic design, one framework for all AI Agents |
| 🧹 **Mid-project, no idea what to maintain** | "What should I archive this month?" | Weekly / monthly / quarterly maintenance commands |

---

## Quick Start

### 3-Minute Setup

```bash
# 1. Clone
git clone https://github.com/HeinzYu/ai-collab-workflow.git

# 2. Install as TRAE Skill (recommended)
cp -r ai-collab-workflow/.trae/skills/ai-collab-workflow ~/.trae/skills/
```

In your project, tell TRAE:

> "This is a full-stack web app with login, dashboard, and settings features"

TRAE initializes the entire framework automatically.

---

## What You Get

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

### 🧩 v2.0 New: Smart Document Merging
- **Functional Equivalence Detection** — Auto-detects project-own docs (e.g., `AI_CONTEXT_MAP.md`, `技术文件框架/`) that serve the same purpose as standard files
- **Shell Mode** — Preserves your project's existing documentation structure; the standard framework wraps around it as a "shell"
- **Smart Skip** — When an equivalent document is found, creates a reference instead of duplicating content

---

## Structure

```
ai-collab-workflow/
├── .trae/skills/            ← Copy to ~/.trae/skills/ to install
├── TEMPLATE_FRAMEWORK/      ← Copy to your project root
│   ├── AGENTS.md            Global rules for AI Agents
│   ├── PROJECT_CONTEXT.md   Project core (auto-filled by AI)
│   └── MODEL_CONFIG.md      AI model configuration
├── CHANGELOG.md             Version history
└── CONTRIBUTING.md          Contribution guide
```

---

## Go Deeper

| You want to learn | Go here |
|---------|--------|
| Full feature specs (Context tiers, model routing, maintenance) | [Core Doc](AI-Development-Workflow.md) |
| What each template file does | [Template Guide](TEMPLATE_FRAMEWORK/TEMPLATE_GUIDE.md) |
| Adapting to existing projects or other platforms | [Supplementary Docs](TEMPLATE_FRAMEWORK/SUPPLEMENTARY/README.md) |
| Version changelog | [CHANGELOG](CHANGELOG.md) |

---

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

---

## License

MIT — See [LICENSE](LICENSE)
