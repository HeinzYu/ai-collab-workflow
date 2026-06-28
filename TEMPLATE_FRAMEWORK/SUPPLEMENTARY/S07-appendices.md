# S07 — Appendices（附录模板库）

> 对应 ChatGPT 方案 附录 A-G。提供全套可直接复制使用的模板文件，覆盖目录结构、Prompt、Continue、Decision、DevLog、Apple Native Project、Game Project 七大场景。

---

## 附录 A：推荐目录模板

### A.1 Apple App (SwiftUI) 项目

```
Project/
├── AGENTS.md
├── PROJECT_CONTEXT.md
├── MODEL_CONFIG.md
├── REFERENCES.md
├── TEMPLATE_GUIDE.md
├── STRUCTURE.md
│
├── PRD/
│   ├── login.md
│   ├── home.md
│   └── settings.md
├── ARCHITECTURE/
│   ├── tech-stack.md
│   ├── dependencies.md
│   └── build-config.md
├── TESTING/
│   ├── test-strategy.md
│   ├── automation-scripts.md
│   └── coverage-requirements.md
├── DEPLOYMENT/
│   ├── release-process.md
│   └── app-store-guide.md
├── SOURCE/
│   ├── App/
│   │   └── AppEntry.swift
│   ├── Views/
│   ├── ViewModels/
│   ├── Models/
│   ├── Services/
│   └── Utilities/
├── TESTS/
│   ├── UnitTests/
│   └── UITests/
├── DESIGN/
│   ├── tokens.md
│   └── components.md
├── ASSETS/
│   ├── documents/
│   └── figma/
├── DEVLOG/
├── CONTINUE/
│   └── decision-log/
└── ARCHIVE/
```

### A.2 Web 应用 (React/Next.js) 项目

```
Project/
├── AGENTS.md
├── PROJECT_CONTEXT.md
├── MODEL_CONFIG.md
├── REFERENCES.md
├── TEMPLATE_GUIDE.md
│
├── PRD/
│   ├── auth.md
│   ├── dashboard.md
│   └── settings.md
├── ARCHITECTURE/
│   ├── tech-stack.md
│   ├── api-design.md
│   └── deployment.md
├── TESTING/
│   ├── test-strategy.md
│   └── e2e-scenarios.md
├── DEPLOYMENT/
│   ├── vercel-config.md
│   └── cicd-config.md
├── SOURCE/
│   ├── app/
│   ├── components/
│   ├── hooks/
│   ├── lib/
│   └── styles/
├── TESTS/
├── ASSETS/
│   ├── documents/
│   └── figma/
├── DEVLOG/
├── CONTINUE/
│   └── decision-log/
└── ARCHIVE/
```

### A.3 后台服务项目

```
Project/
├── AGENTS.md
├── PROJECT_CONTEXT.md
├── MODEL_CONFIG.md
├── REFERENCES.md
├── TEMPLATE_GUIDE.md
│
├── PRD/
│   ├── user-api.md
│   ├── data-pipeline.md
│   └── admin-panel.md
├── ARCHITECTURE/
│   ├── tech-stack.md
│   ├── database-schema.md
│   └── api-design.md
├── TESTING/
│   ├── test-strategy.md
│   └── load-testing.md
├── DEPLOYMENT/
│   ├── docker-config.md
│   └── cicd-config.md
├── SOURCE/
│   ├── controllers/
│   ├── services/
│   ├── models/
│   ├── middleware/
│   └── utils/
├── TESTS/
├── DEVLOG/
├── CONTINUE/
│   └── decision-log/
└── ARCHIVE/
```

---

## 附录 B：Prompt 模板

> 详细 Prompt 模板见 S01-prompt-engineering.md，此处提供速查卡片版。

### B.1 大型任务 Prompt 速查卡

```
【任务类型】功能开发
【目标模块】[模块名]
【输入文件】PRD/xxx.md, ARCHITECTURE/xxx.md
【具体要求】1)... 2)... 3)...
【验收标准】□ 功能1 □ 功能2 □ 代码规范
【约束条件】文件≤X个, 不引入新依赖
```

### B.2 Refactor Prompt 速查卡

```
【任务类型】代码重构
【目标文件】[文件路径]
【当前问题】1)... 2)...
【重构目标】保持功能 + 改善[可读性/性能/可测试性]
【约束条件】不改变API, 测试全通过
【验收标准】□ 行为不变 □ 测试通过 □ 复杂度降低
```

### B.3 Review Prompt 速查卡

```
【任务类型】审查
【审查对象】[文件/模块]
【审查类型】□ Code □ Architecture □ Design
【审查重点】1)... 2)... 3)...
【参考标准】AGENTS.md §X, Apple HIG
【输出】总体评价 → 问题列表 → 修改建议 → 确认清单
```

### B.4 Design Prompt 速查卡

```
【任务类型】UI/UX设计
【目标模块】[模块名]
【输入参考】Figma/xxx.md, DESIGN/tokens.md
【设计要求】元素1, 元素2, 交互流程
【设计规范】Apple HIG, Design Tokens, 深色模式
【输出】布局描述 → 组件列表 → 交互流程 → 适配方案 → 代码实现
```

### B.5 Debug Prompt 速查卡

```
【任务类型】Bug修复
【错误信息】[完整错误日志]
【涉及文件】[路径]
【复现步骤】1)... 2)... 3)...
【已尝试】1)... 2)...
【期望】[正确行为]
【实际】[问题行为]
【约束】只修改相关代码, 不改变API
```

### B.6 Architecture Prompt 速查卡

```
【任务类型】架构设计
【项目背景】[类型+规模]
【当前状态】已有模块:[], 技术栈:[]
【待解决问题】1)... 2)...
【约束条件】平台限制, 团队规模
【输出】架构模式 → 模块划分 → 设计决策 → 目录结构 → 风险
```

---

## 附录 C：Continue / 模块总结模板

```markdown
# [模块名] - 模块开发总结

- **模块名称：** [模块名]
- **PRD 文件：** `PRD/[module-name].md`
- **开始日期：** YYYY-MM-DD
- **完成日期：** YYYY-MM-DD
- **开发轮次：** [N] 轮对话

---

## 1. 功能概述

[2-3 句话描述该模块实现的功能]

## 2. 交付清单

| 文件路径 | 类型 | 说明 |
|----------|------|------|
| [文件1] | View | [说明] |
| [文件2] | ViewModel | [说明] |
| [文件3] | Service | [说明] |
| [文件4] | Test | [说明] |

## 3. 关键技术决策

| 决策 | 选择方案 | 理由 |
|------|---------|------|
| [决策1] | [方案] | [理由] |
| [决策2] | [方案] | [理由] |

> 详细决策日志见：`CONTINUE/decision-log/YYYY-MM-DD-[module]-[title].md`

## 4. 已知问题和待办事项

| 问题/待办 | 严重程度 | 计划处理日期 |
|-----------|---------|-------------|
| [问题1] | 🔴/🟡/💡 | YYYY-MM-DD |
| [待办1] | — | YYYY-MM-DD |

## 5. 相关文件路径索引

- PRD: `PRD/[module-name].md`
- 架构文档: `ARCHITECTURE/[file].md`（如相关）
- 设计稿: `ASSETS/figma/[file].md`（如相关）
- 测试文件: `TESTS/[file].swift`（如相关）

## 6. 下次开发建议

[给未来继续开发此模块的自己或他人的建议]
```

---

## 附录 D：Decision（决策日志）模板

```markdown
# Decision Log: [简短标题]

- **日期：** YYYY-MM-DD
- **模块：** [相关模块名称]
- **决策类型：** 架构 / 技术选型 / 需求变更 / UI设计 / 性能优化 / 其他
- **背景：**

  [2-3 句话描述为什么需要做这个决策]

- **选项 A：** [方案名称]
  - 优点：[列出优点]
  - 缺点：[列出缺点]

- **选项 B：** [方案名称]
  - 优点：[列出优点]
  - 缺点：[列出缺点]

- **[可选] 选项 C：** [方案名称]
  - 优点：[列出优点]
  - 缺点：[列出缺点]

- **最终决定：**

  [选择了哪个方案 + 原因，2-3 句话]

- **影响范围：**

  | 文件/模块 | 影响类型 | 说明 |
  |-----------|---------|------|
  | [路径1] | 修改/新增/删除 | [说明] |
  | [路径2] | 修改/新增/删除 | [说明] |

- **后续回顾日期：** YYYY-MM-DD（建议 30 天后）

---

## 回顾记录

| 日期 | 回顾人 | 结论 | 备注 |
|------|--------|------|------|
| YYYY-MM-DD | [姓名/TRAE] | 仍适用 / 需调整 / 已过时 | [说明] |
```

---

## 附录 E：DevLog 模板

### E.1 每日 DevLog 模板

```markdown
# DevLog — YYYY-MM-DD

## 会话摘要
[1-2 句话描述今天做了什么]

## 今日完成
- [ ] [任务 1] — [状态：完成/进行中/受阻]
- [ ] [任务 2] — [状态]

## 修改的文件
| 文件 | 操作 | 说明 |
|------|------|------|
| [路径] | 新增/修改/删除 | [变更说明] |

## 遇到的问题
| 问题 | 严重程度 | 解决方案 | 状态 |
|------|---------|---------|------|
| [问题描述] | 🔴/🟡/💡 | [处理方式] | 已解决/进行中/未解决 |

## 明日计划
- [ ] [计划 1]
- [ ] [计划 2]

## Token 使用统计
- **模型：** Gemma / Qwen
- **预估 Token：** 输入 [X]K，输出 [Y]K
```

### E.2 周总结模板

```markdown
# Weekly Summary — YYYY-WXX

## 本周完成
- ✅ [任务 1]
- ✅ [任务 2]

## 本周进展
- 新增代码：[X] 行
- 修改文件：[Y] 个
- 完成模块：[Z] 个

## 遇到的问题
- 🟡 [问题 1] — 状态：[已解决/进行中]
- 🔴 [问题 2] — 状态：[受阻]

## Token 周报
- 总对话次数：[N] 次
- 本地模型使用：Gemma [X] 次，Qwen [Y] 次
- 云端模型使用：Claude [A] 次，GPT [B] 次
- 预估 Token 消耗：输入 [X]M，输出 [Y]M

## 下周计划
- [ ] [计划 1]
- [ ] [计划 2]
```

---

## 附录 F：Apple Native Project 模板

### F.1 AGENTS.md Apple 专用章节

```markdown
## Apple 平台特定规则

### SwiftUI 规范
- 使用 @StateObject 管理 ViewModel 生命周期
- 避免在 View 的 init 中执行副作用
- 复杂列表使用 LazyVStack/LazyVGrid 优化性能

### 架构模式
- 默认使用 MVVM
- ViewModel 使用 @MainActor 确保主线程安全
- Service 层使用 Protocol 抽象便于测试

### Apple HIG 遵循
- 最小触摸目标 44x44pt
- 支持 Dynamic Type（从 .caption 到 .largeTitle）
- 深色模式必须适配
- VoiceOver 标签覆盖所有交互元素

### 性能标准
- 启动时间 < 400ms（冷启动）
- 列表滚动 60fps
- 内存使用 < 200MB（前台）

### 代码审查检查点
□ 是否避免了强制解包（!）
□ 是否正确处理了 async/await 取消
□ 是否使用了合适的 @MainActor 标注
□ 是否支持了深色模式和 Dynamic Type
```

### F.2 Apple 项目 PROJECT_CONTEXT.md 附加字段

```markdown
## Apple 平台信息
- **最低 iOS 版本：** iOS 17.0
- **目标设备：** iPhone / iPad / Mac (Catalyst)
- **Swift 版本：** 5.9+
- **Xcode 版本：** 15.0+
- **App Store 类别：** [工具 / 生产力 / 社交 / ...]

## Apple 特有约束
- [ ] 需要 HealthKit 权限
- [ ] 需要推送通知 (APNs)
- [ ] 需要 CloudKit 同步
- [ ] 需要 App Groups（Widget 通信）
```

---

## 附录 G：Game Project 模板

### G.1 游戏项目 AGENTS.md 专用章节

```markdown
## 游戏项目特定规则

### 游戏循环
- 固定时间步长（Fixed Timestep）为主循环模式
- 渲染与逻辑分离
- 帧率目标：60fps（移动端 30fps）

### 对象管理
- 使用对象池（Object Pool）管理频繁创建/销毁的对象
- 场景管理器（Scene Manager）统一控制场景切换
- 资源异步加载，避免卡顿

### AI Agent 开发流程
- 先设计 Game Design Document (GDD) → 存入 PRD/
- 再实现原型（Prototype）→ 验证核心玩法
- 逐步添加系统（Combat → AI → UI → Audio → Polish）

### 性能标准
- Draw Call < 500（移动端 < 200）
- 内存 < 500MB（移动端 < 300MB）
- 加载时间 < 3秒（移动端 < 5秒）
```

### G.2 游戏项目目录结构

```
Project/
├── AGENTS.md
├── PROJECT_CONTEXT.md
├── MODEL_CONFIG.md
│
├── PRD/
│   ├── gdd-overview.md        # Game Design Document
│   ├── combat-system.md
│   ├── ai-system.md
│   └── ui-system.md
├── ARCHITECTURE/
│   ├── game-engine.md
│   ├── asset-pipeline.md
│   └── performance-budget.md
├── SOURCE/
│   ├── Core/
│   │   ├── GameLoop
│   │   └── SceneManager
│   ├── Systems/
│   │   ├── Combat/
│   │   ├── AI/
│   │   └── UI/
│   ├── Entities/
│   └── Utilities/
├── ASSETS/
│   ├── sprites/
│   ├── audio/
│   ├── animations/
│   └── prefabs/
├── TESTS/
│   ├── playtests/
│   └── unit-tests/
├── DEVLOG/
├── CONTINUE/
│   └── decision-log/
└── ARCHIVE/
```

---

## 与补充章节的关系

- **Prompt 模板**：附录 B 为 S01 的速查卡片版
- **Continue 模板**：附录 C 是 AGENTS.md §3 的模板实例化
- **Decision 模板**：附录 D 是 AGENTS.md §14 的模板实例化
- **DevLog 模板**：附录 E 是 AGENTS.md §4 的模板实例化
- **Apple/Game 模板**：附录 F/G 为不同项目类型提供专用配置
