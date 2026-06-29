# Changelog

All notable changes to ai-collab-workflow will be documented in this file.

---

## [1.4] — 2026-06-29

### Added
- **五档连续内存覆盖** (T1–T5)：消除旧版三档盲区，覆盖 ≤16GB 到 ≥65GB 全部内存配置
  - T1 (≤16GB)：16K tokens，极限保守，仅读用户指定文件
  - T2 (17–32GB)：24K tokens，契约绿通限单文件
  - T3 (33–48GB)：50K tokens，标准平衡
  - T4 (49–64GB)：80K tokens，充裕模式
  - T5 (≥65GB)：100K+ tokens，无限制
- **启动环境自检流程**：Agent 首次进入项目自动执行
  - `sysctl -n hw.memsize` 检测物理内存 → 匹配策略档位
  - 三重 `curl` 探测可用模型服务（oMLX / Ollama / LM Studio）
  - 结果自动写入 `MODEL_CONFIG.md §0 环境自检结果 & 模型角色映射`
- **模型无关分工策略**：不再硬编码 Gemma/Qwen，改为角色分类
  - 🧠 推理型（Reasoning）：需求分析、架构设计、重构、Debug、文档撰写
  - ⚡ 生成型（Generation）：全量代码编写、文件生成、测试用例
  - 用户在 MODEL_CONFIG.md 中填写自己的模型名即可，无需修改 Skill
- **契约绿通模板化**：文件路径改为变量占位（$SCHEMA_FILE, $ROUTE_DEFS, $DESIGN_TOKENS, $PRD_DIR, $API_CONTRACTS）
  - 初始化时根据项目技术栈自动解析实际路径
  - 纯单层项目自动跳过契约绿通（$cross_module = none）

### Changed
- MODEL_CONFIG.md 新增 `§0 环境自检结果 & 模型角色映射`（自动填充 + 用户确认）
- 模型分工决策树更新为模型无关版本（Role-based 而非 Model-based）
- 任务前检查清单从 5 步扩展为 7 步（新增模型服务检测 + 契约路径解析）
- 本地模型服务声明改为 Model-agnostic（oMLX / Ollama / LM Studio / cloud-only）

---

## [1.3] — 2026-06-29

### Added
- **硬件自适应 OOM 防护**：启动时 `sysctl -n hw.memsize` 检测物理内存，自动选择策略档位
- **静态物理黑名单**：全局禁止递归扫描 `presets/`、`node_modules/`、`.github/`、构建产物
- **跨端数据契约绿通**：前后端联调时允许读取契约文件（schema.prisma / DesignToken.swift），但禁止扫描业务逻辑层
- **设备自适应断路阈值**：≤32GB: 24K / 48GB: 50K / ≥64GB: 80K tokens
- **任务前内存检查清单**：5 步流程确保每次任务前记忆安全

### Changed
- 模块架构章节新增跨模块通信规则（API contract first 流程）
- AGENTS.md 新增 `§0 全局物理硬件与内存红线` 章节（中文本地化）

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
