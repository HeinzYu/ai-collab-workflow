# ai-collab-workflow

> AI 项目文档框架 — 让 TRAE、Claude Code、Cursor、Codex 等 AI Agent 跨会话保持上下文一致  
> *AI Project Documentation Framework — Keep context consistent across sessions for TRAE, Claude Code, Cursor, Codex, and more*

[![Version](https://img.shields.io/badge/version-1.8-blue)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Language](https://img.shields.io/badge/language-markdown-DB4936.svg)]()
[![Topics](https://img.shields.io/badge/topics-ai--agents%2C%20developer--tools%2C%20project--templates-blue?style=flat)]()

---

## 你的问题，它来解 / When You Face This

| 场景 | 痛点 | ai-collab-workflow 怎么帮 |
|------|------|------------------------|
| 🔄 **换了一个对话，AI 忘了上次的决定** | "我们不是定好登录用 OAuth 吗？怎么又改成邮箱了？" | 持久化项目记忆，跨会话不丢上下文 |
| 📦 **项目变大后 AI 开始"幻觉"** | "这个文件明明三个月前就写好了，怎么又在改？" | Context 生命周期分层 + 定期维护机制 |
| 💻 **本地跑 AI，内存爆了** | "48GB 的 Mac 都卡死，模型直接 OOM" | 硬件自适应五档防护，自动适配你的设备 |
| 🤖 **换了个 AI 工具，所有规则要重写** | "从 Cursor 换到 TRAE，又要重新调一遍" | 工具无关设计，规则一套通用所有 AI Agent |
| 🧹 **项目做了一半，不知道维护什么** | "这个月该归档哪些文件？谁说了算？" | 周/月/季度自动维护指令，一键清理 |

---

## 快速开始 / Quick Start

### 3 分钟安装

```bash
# 1. 克隆仓库
git clone https://github.com/HeinzYu/ai-collab-workflow.git

# 2. 安装为 TRAE Skill（推荐）
cp -r ai-collab-workflow/.trae/skills/ai-collab-workflow ~/.trae/skills/
```

在你的项目中对 TRAE 说：

> "这是一个完整的 Apple App 项目，包含登录、首页、设置等功能"

TRAE 会自动初始化整个框架。[手动安装方式](#手动安装) →

---

## 你能得到什么 / What You Get

### 🧠 AI 有了"项目记忆"
- 每次新对话，AI 都知道项目的 PRD、架构、已完成和待办事项
- 不再重复已解决的问题，不会推翻已有的决定

### 📋 从想法到上线的完整流程
```
需求文档 → 架构设计 → 开发实现 → 测试验证 → 部署上线
   PRD      技术栈       代码        自动化     应用商店
```

### 🖥️ 任何设备都能跑
启动时自动检测你的物理内存，从 16GB 笔记本到 128GB 工作站，自动适配最合适的运行模式。

### 🤖 换 AI 工具不换规则
一套框架适配 TRAE、Claude Code、Cursor、Codex、Gemini CLI 等任何 AI Coding Agent。

---

## 目录结构 / Structure

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

---

## 深入阅读 / Go Deeper

| 你想了解 | 看这里 |
|---------|--------|
| 完整的功能特性（Context 分层、模型路由、维护策略） | [核心文档](AI-Development-Workflow.md) |
| 模板目录中每个文件的用途 | [TEMPLATE_GUIDE](TEMPLATE_FRAMEWORK/TEMPLATE_GUIDE.md) |
| 如何适配已有项目或不同平台 | [补充文档](TEMPLATE_FRAMEWORK/SUPPLEMENTARY/README.md) |
| 版本变更记录 | [CHANGELOG](CHANGELOG.md) |

---

## 贡献 / Contributing

欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。  
*Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md).*

---

## 许可 / License

MIT — See [LICENSE](LICENSE)
