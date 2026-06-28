# AI\-Development\-Workflow

# **Professional AI Workflow Specification v1\.0**

这是一个很好的时机来整理这套方法。我认为这份文档不应该只是「TRAE 使用说明」，而应该成为你未来所有 AI 产品开发项目（Apple App、游戏、Design System 等）的**一级工程规范**。

基于这几天我们不断调试的内容（M5 Pro \+ oMLX \+ Gemma4 \+ Qwen3\.6 \+ TRAE \+ Notion \+ Apple 原生开发），我建议把它提升为一个真正的工程标准。

文档建议命名：

> **AI\-Development\-Workflow\.md**
> 
> 副标题：
> 
> **Professional AI Workflow Specification v1\.0**
> 
> 

我建议它不是十几页，而是大约 **40\~60 页 Markdown** 的规范文档，类似 Google Engineering Handbook 或 Anthropic Claude Code Best Practices 那种级别，可以直接作为项目根目录里的长期规范。

---

## 我建议的完整目录

```Plain Text
AI-Development-Workflow.md

Professional AI Workflow Specification
Version 1.0

────────────────────────────

0. Philosophy
为什么AI Agent需要工程化管理

────────────────────────────

1. Workspace Architecture
项目目录规范

Project/
├── AGENTS.md
├── PROJECT_CONTEXT.md
├── DESIGN_SYSTEM.md
├── AI_WORKFLOW.md
├── CONTINUE/
├── DEVLOG/
├── DECISIONS/
├── PRD/
├── DOCS/
├── DESIGN/
├── SOURCE/
└── ARCHIVE/

────────────────────────────

2. AI Roles Definition

Gemma负责什么

Qwen负责什么

Claude负责什么（以后）

GPT负责什么（以后）

什么时候切模型

什么时候不用Agent

────────────────────────────

3. Document Hierarchy

哪些文档属于：

Permanent Context

哪些属于：

Session Context

哪些属于：

Disposable Context

如何避免Context Explosion

────────────────────────────

4. Context Management

为什么Context会越来越长

Token如何计算

什么时候：

New Chat

什么时候：

Continue

什么时候：

Summary

什么时候：

Archive

────────────────────────────

5. Conversation Strategy

一个Conversation应该负责什么

推荐最长多少轮

推荐最长多少Token

推荐最长开发时间

什么时候结束Chat

────────────────────────────

6. Module Development Workflow

以Apple App为例

PRD

↓

Review

↓

Architecture

↓

Design

↓

SwiftUI

↓

Testing

↓

Review

↓

Summary

↓

Archive

────────────────────────────

7. Agent Task Granularity

不要：

开发整个首页

而是：

分析

↓

建模

↓

UI

↓

Networking

↓

Animation

↓

Accessibility

↓

Testing

↓

Review

────────────────────────────

8. Prompt Engineering Standard

推荐Prompt模板

禁止Prompt

大型任务Prompt

Refactor Prompt

Review Prompt

Design Prompt

────────────────────────────

9. AGENTS.md Specification

应该放什么

不要放什么

Apple项目推荐内容

Design项目推荐内容

────────────────────────────

10. Continue Strategy

Continue.md规范

Module Summary规范

Decision Log规范

AI如何恢复工作

────────────────────────────

11. Decision Management

每次重要决定

写：

Decision Log

为什么以后AI理解越来越快

────────────────────────────

12. DevLog Workflow

每天结束：

生成：

DevLog

记录：

今天完成

今天修改

明天继续

────────────────────────────

13. Model Switching Strategy

什么时候：

Gemma

什么时候：

Qwen

什么时候：

云端Claude

什么时候：

GPT

什么时候：

本地模型足够

────────────────────────────

14. oMLX Best Practice

Context

Memory

SSD Cache

Profile

Benchmark

Runtime

Memory Guard

────────────────────────────

15. TRAE Best Practice

Rules

Memory

Workspace

Worktree

Context

Tool Call

Conversation

────────────────────────────

16. Long-term Project Strategy

持续3个月

持续半年

持续一年

AI如何一直理解项目

────────────────────────────

17. Daily Checklist

开始工作

结束工作

Weekly Review

Monthly Cleanup

────────────────────────────

Appendix A

推荐目录模板

Appendix B

Prompt模板

Appendix C

Continue模板

Appendix D

Decision模板

Appendix E

DevLog模板

Appendix F

Apple Native Project模板

Appendix G

Game Project模板
```

---

## 我希望把它做到与你的工作方式高度匹配

结合这几天的交流，我希望这份文档不是一份通用教程，而是专门针对你的工作流设计。

例如，它会默认假设：

## 开发环境

```Plain Text
MacBook Pro M5 Pro
48GB Unified Memory

oMLX
Gemma4 26B
Qwen3.6 35B

TRAE

Apple Native

SwiftUI

Notion/Lark

Figma

GitHub
```

---

## 项目类型

例如：Apple 原生 App

不是：Web

不是：Java

不是：Python。

所以：大量示例都会是：

```Plain Text
PRD

↓

SwiftUI

↓

MVVM

↓

Design Tokens

↓

Apple HIG

↓

Accessibility

↓

Review

↓

Summary
```

而不是：Node\.js。

---

## 文档结构

我希望它真正成为以后所有项目统一遵守：

例如：

```Plain Text
Project/

AGENTS.md

↓

PROJECT_CONTEXT.md

↓

PRD/

↓

DESIGN/

↓

DECISIONS/

↓

DEVLOG/

↓

CONTINUE/
```

未来换：TRAE，Cursor，Codex，Claude Code，Gemini CLI。全部不用改。

---

## 我还想加入一些目前网上几乎没有系统整理的内容

例如：

### AI Context 生命周期

很多人不知道Context其实有生命周期。

```Plain Text
Permanent

↓

Stable

↓

Working

↓

Temporary

↓

Disposable
```

不同文档应该放不同层。

例如Decision Log应该永久保存。而聊天不用。

还有：AI Project Memory Architecture，这是很多AI团队真正在用。

例如：

```Plain Text
Brain

↓

Knowledge

↓

Memory

↓

Context

↓

Conversation
```

不同作用完全不同。

---

### 我的建议**不要把它当作一篇普通 Markdown，而是把它当作你的"AI 开发操作系统（AI Development Operating System）"。**

它应该成为你所有 AI 协同开发项目的根规范，与 `AGENTS.md`、`PROJECT_CONTEXT.md` 并列，是整个工程的顶层文档。

---

**我建议直接编写 Version 1\.0 正式版，而不是简化版。**

预计规模：

- **约 2\.5～4 万字**

- **40\+ 个流程图**

- **30\+ 个最佳实践**

- **大量 Prompt 模板**

- **大量目录模板**

- **完整的 Apple Native App 开发示例**

- **完整的 TRAE \+ oMLX \+ 本地模型协同规范**

这样完成后，它不仅能指导你当前的 Apple App 项目，未来也能直接应用到你的生态模拟游戏项目，以及其他任何长期 AI 协同开发工程中。

