# 目录结构总览与使用指引

> 本文档是模板框架的快速参考，展示完整的目录结构和各文件的关系。人类开发者和 TRAE Agent 均可快速查阅。

---

## 完整目录结构

```
Project/
├── AGENTS.md                    ★ [核心] TRAE 全局规则、交互指令、Context生命周期分层、周期性维护
├── PROJECT_CONTEXT.md           ★ [核心] 项目目标、功能清单、技术架构概述、长期项目记忆衰减策略
├── MODEL_CONFIG.md              ★ [核心] 本地模型（oMLX/Gemma/Qwen）配置、模型切换决策树
├── REFERENCES.md                ★ [核心] 大文件索引（doc/PDF/Figma）
├── TEMPLATE_GUIDE.md            ★ [核心] 模板使用指南（本文件）
├── STRUCTURE.md                 ◉ [参考] 本文档——目录结构总览
└── ARCHIVE/                     ◉ [新增] 月度/季度摘要归档目录（长期项目必需）

# ★ = 始终详细（不可跳过）
# ◉ = 辅助参考文件

# ──────────── 按需展开模块（初始为占位符） ────────────

├── PRD/
│   └── login.md                 ○ 功能需求文档（占位符 → "生成登录功能的详细 PRD"）

├── ARCHITECTURE/
│   ├── tech-stack.md            ○ 技术架构（占位符 → "完善技术架构文档"）
│   ├── dependencies.md          ○ 依赖管理（占位符 → "完善依赖管理文档"）
│   └── build-config.md          ○ 构建配置（占位符 → "完善构建配置文档"）

├── TESTING/
│   ├── test-strategy.md         ○ 测试策略（占位符 → "完善测试策略"）
│   ├── automation-scripts.md    ○ 自动化脚本（占位符 → "完善自动化脚本"）
│   └── coverage-requirements.md ○ 覆盖率要求（占位符 → "完善覆盖率要求"）

├── DEPLOYMENT/
│   ├── release-process.md       ○ 发布流程（占位符 → "完善发布流程"）
│   ├── app-store-guide.md       ○ App Store 提交指南（占位符 → "完善提交指南"）
│   └── cicd-config.md           ○ CI/CD 配置（占位符 → "完善 CI/CD 配置"）

├── DEVLOG/
│   └── YYYY-MM-DD.md            ○ 开发日志（TRAE 每次对话自动生成）

├── CONTINUE/
│   ├── module-summary.md        ○ 模块总结（占位符 → "生成 XXX 功能的总结"）
│   └── decision-log/            ◉ 决策日志目录（按需创建，YYYY-MM-DD-[module]-[title].md）

└── ASSETS/
    ├── documents/               ◉ 人类提交的 doc/PDF 原文
    └── figma/                   ◉ Figma 设计稿导出文件
```

---

## 文件分类与使用场景

### 第一类：核心文件（始终详细）

这些文件在模板初始化时即生成完整内容，不可跳过：

| 文件 | 用途 | 谁负责维护 |
|------|------|-----------|
| `AGENTS.md` | TRAE 的行为准则、交互指令、Context生命周期分层、周期性维护检查清单 | TRAE（初始化时生成） |
| `PROJECT_CONTEXT.md` | 项目目标、功能清单、开发阶段、长期项目记忆衰减策略、维护追踪 | 人类 + TRAE（共同维护） |
| `MODEL_CONFIG.md` | 本地模型配置、对话管理策略、模型切换决策树 | TRAE（根据实际部署填充） |
| `REFERENCES.md` | 大文件索引与摘要 | TRAE（处理大文件时自动更新） |
| `TEMPLATE_GUIDE.md` | 模板使用说明 | TRAE（初始化时生成） |
| `STRUCTURE.md` | 目录结构总览（本文档） | TRAE（初始化时生成） |

### 第二类：按需展开模块（占位符 → 详细文档）

这些文件初始为简短的占位符，由 TRAE 对话触发展开：

| 模块 | 触发指令示例 | 展开后内容 |
|------|-------------|-----------|
| `PRD/login.md` | "生成登录功能的详细 PRD" | 完整功能需求文档（8个章节） |
| `ARCHITECTURE/tech-stack.md` | "完善技术架构文档" | 完整技术架构说明（7个章节） |
| `ARCHITECTURE/dependencies.md` | "完善依赖管理文档" | 完整依赖清单与更新策略（4个章节） |
| `ARCHITECTURE/build-config.md` | "完善构建配置文档" | 完整构建与打包流程（4个章节） |
| `TESTING/test-strategy.md` | "完善测试策略" | 完整测试方案（5个章节） |
| `TESTING/automation-scripts.md` | "完善自动化脚本" | 完整脚本清单与运行方式（4个章节） |
| `TESTING/coverage-requirements.md` | "完善覆盖率要求" | 完整覆盖率指标与报告生成（3个章节） |
| `DEPLOYMENT/release-process.md` | "完善发布流程" | 完整发布步骤（4个章节） |
| `DEPLOYMENT/app-store-guide.md` | "完善 App Store 提交指南" | 完整提交清单（5个章节） |
| `DEPLOYMENT/cicd-config.md` | "完善 CI/CD 配置" | 完整流水线配置（4个章节） |
| `DEVLOG/YYYY-MM-DD.md` | 每次新对话（自动生成） | 当日开发活动记录（5个章节） |
| `CONTINUE/module-summary.md` | "生成 XXX 功能的总结" | 模块完成后的完整总结（6个章节） |

### 第三类：大文件存储区（人类提交，TRAE 处理）

| 目录 | 用途 | 触发方式 |
|------|------|---------|
| `ASSETS/documents/` | 人类提交的 doc/PDF 原文 | 用户通过 TRAE 提交大文件时存储 |
| `ASSETS/figma/` | Figma 设计稿导出文件 | 用户提供 Figma 链接时 TRAE 自动导出 |

### 第四类：归档目录（长期项目必需）

| 目录 | 用途 | 触发方式 |
|------|------|---------|
| `ARCHIVE/monthly-YYYY-MM.md` | 月度项目摘要（功能完成、技术决策、问题记录） | 每月维护时自动生成 |
| `ARCHIVE/quarterly-YYYY-QX.md` | 季度审计报告（项目健康度、scope评估、配置审查） | 每季度维护时自动生成 |
| `ARCHIVE/weekly-YYYY-WXX.md` | 周总结（本周完成内容、下周计划） | 每周维护时自动生成到 DEVLOG/，月度维护时归档到 ARCHIVE/ |

**注意：** ARCHIVE/ 目录在项目初始化时不创建，首次执行月维护或季维护时由 TRAE 自动创建。

---

## 工作流程图

```
项目初始化
    │
    ▼
TRAE 生成核心文件（始终详细）
    │
    ├──→ 生成所有模块占位符
    │
    ▼
用户通过 TRAE 对话开发功能
    │
    ├──→ TRAE 读取核心文件 + 当前模块 PRD
    ├──→ 若 PRD 为占位符 → 先展开为详细文档
    ├──→ 开发功能模块
    ├──→ 记录日志到 DEVLOG/
    └──→ 完成后生成 CONTINUE/ 总结
```

---

## 快速指令对照表

| 你想做什么 | 对 TRAE 说什么 |
|-----------|---------------|
| **初始化新项目** | "这是一个完整的 Apple App 项目，包含登录、首页、设置等功能" |
| **初始化小型项目** | "这是一个简单的工具 App，只需要登录和首页功能" |
| **初始化 MVP** | "这是一个原型验证，只需要一个页面" |
| **展开模块文档** | "生成 [模块名] 功能的详细 PRD" / "完善 [模块名] 文档" |
| **生成模块总结** | "生成 [模块名] 功能的总结" |
| **继续已有功能** | "继续开发 [模块名]，参考之前的总结" |
| **添加大文件** | "将这份文档添加到项目参考中"（附上 doc/PDF/Figma） |
| **查询项目状态** | "当前项目的开发进度如何？" |
| **执行周维护** | "执行本周项目维护" |
| **执行月归档** | "执行本月项目归档" |
| **执行季审计** | "执行季度项目审计" |

---

## 文件关系图

```
AGENTS.md（规则中心）
    │
    ├──→ 指导 TRAE 如何生成/更新其他文件
    ├──→ §11 Context生命周期分层（文档持久性与访问策略）
    └──→ §12 周期性维护检查清单（周/月/季度）

PROJECT_CONTEXT.md（项目中心）
    │
    ├──→ 引用 MODEL_CONFIG.md（模型配置 + 切换决策树）
    ├──→ 列出 PRD/ 下的功能模块状态
    ├──→ 记录维护追踪日期（周/月/季）
    └──→ §9 长期项目记忆衰减策略（跨会话恢复协议）

MODEL_CONFIG.md（模型中心）
    │
    ├──→ 指导 TRAE 如何选择模型处理任务
    ├──→ §7 模型切换决策树（复杂度/上下文/网络自适应）
    └──→ 定义大文件处理策略

REFERENCES.md（索引中心）
    │
    ├──→ 记录 ASSETS/documents/ 中的大文件摘要
    └──→ 记录 ASSETS/figma/ 中的设计稿索引

ARCHIVE/（归档中心，长期项目）
    │
    ├──→ 月度摘要：功能完成、技术决策、问题记录
    └──→ 季度审计：项目健康度、scope评估、配置审查

TEMPLATE_GUIDE.md（使用手册）
    │
    └──→ 指导人类和 TRAE 如何使用模板

STRUCTURE.md（总览，本文档）
    │
    └──→ 展示所有文件的关系与使用场景
```

---

## 模板版本信息

- **当前版本：** 1.2
- **创建日期：** 2026-06-27
- **最后更新：** 2026-06-28
- **适用场景：** Apple App / Web / Backend / Game 项目
- **本地模型服务：** oMLX（Gemma + Qwen）
