# Changelog

All notable changes to ai-collab-workflow will be documented in this file.

---

## [1.2] — 2026-06-28

### Added
- **SUPPLEMENTARY/** 补充章节体系：将 ChatGPT 方案（AI-Development-Workflow.md）中的有价值概念以补充章节形式融入
  - `S01-prompt-engineering.md` — Prompt 模板库（6 套场景：大型任务 / 重构 / 审查 / 设计 / 调试 / 架构）
  - `S02-trae-best-practices.md` — TRAE 深度指南（Rules / Memory / Workspace / Worktree / Context / Tool Call / Conversation）
  - `S03-model-switching-decision-tree.md` — 模型切换决策树完整版（Gemma / Qwen / Claude / GPT）
  - `S04-long-term-project-strategy.md` — 3 个月 / 半年 / 1 年项目的长期策略
  - `S05-omlx-best-practices.md` — oMLX 性能优化与运维指南（Context/Memory/SSD Cache/Profile/Benchmark/Runtime/Memory Guard）
  - `S06-agent-task-granularity.md` — 任务粒度决策指南（4 种项目类型的完整分解示例）
  - `S07-appendices.md` — 附录模板库（目录结构/Prompt/Continue/Decision/DevLog/Apple Native/Game 共 7 套模板）
- TEMPLATE_FRAMEWORK/CONTINUE/decision-log/ 决策日志目录
- TEMPLATE_FRAMEWORK/ARCHIVE/ 月度和季度归档目录

### Changed
- AGENTS.md 新增章节：
  - §11 Context 生命周期分层（Permanent / Stable / Working / Temporary / Disposable）
  - §12 周期性维护检查清单（周 / 月 / 季度）
  - §13 对话策略（Conversation Strategy）
  - §14 决策日志管理（Decision Log Management）
  - §15 每日清单（Daily Checklist）
- PROJECT_CONTEXT.md 新增章节：
  - §9 长期项目记忆衰减策略
  - §10 项目健康仪表板（Project Health Dashboard）
  - §11 变更记录
- MODEL_CONFIG.md 新增章节：
  - §7 模型切换决策树
  - §8 性能监控与调优
  - §10 Token 成本追踪与模型对比

### Fixed
- 补充了 TEMPLATE_GUIDE.md 中的长期项目维护 FAQ

---

## [1.1] — 2026-06-28

### Added
- Context 生命周期分层架构（5 层：永久 / 稳定 / 工作 / 临时 / 可弃）
- 周期性维护检查清单（每周 / 每月 / 每季度）
- 模型切换决策树（Gemma / Qwen / Claude / GPT 自动选择）
- 长期项目记忆衰减策略（3 层记忆架构 + 跨月恢复协议）
- 项目健康仪表板（维护状态 / 开发进度 / 风险预警 / 系统健康度）
- 对话策略（单次对话职责定义、推荐限制、生命周期管理）
- 决策日志管理（格式规范、自动记录规则、回顾机制）
- 每日清单（工作开始 / 工作结束 / 每周 / 每月检查清单）
- Token 成本追踪与多模型对比矩阵

### Changed
- AGENTS.md 从 ~10 个章节扩展到 15 个章节
- PROJECT_CONTEXT.md 新增 §9-11
- MODEL_CONFIG.md 新增 §7-10
- TEMPLATE_GUIDE.md 新增 §6-8（FAQ + 最佳实践 + 版本信息）

---

## [1.0] — 2026-06-27

### Added
- 初始框架创建
- 核心文件：AGENTS.md / PROJECT_CONTEXT.md / MODEL_CONFIG.md / REFERENCES.md / TEMPLATE_GUIDE.md / STRUCTURE.md
- 按需展开模块占位符：PRD/ / ARCHITECTURE/ / TESTING/ / DEPLOYMENT/ / DEVLOG/ / CONTINUE/
- 三种项目规模支持：full / small / mvp
- 大文件处理规则（doc/PDF/Figma 混合策略）
- 本地模型配置（oMLX + Gemma + Qwen）
- 对话管理策略（上下文窗口限制、任务拆分、错误处理）
- 文件读写规范
- 快速指令速查表
