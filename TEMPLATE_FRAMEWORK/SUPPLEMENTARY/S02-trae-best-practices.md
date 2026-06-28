# S02 — TRAE Best Practice

> 对应 ChatGPT 方案 §15。针对 TRAE Agent 的深度使用指南，涵盖 Rules/Memory/Workspace/Worktree/Context/Tool Call/Conversation 七大维度。

---

## 1. Rules（规则系统）

### 1.1 .trae/rules/ 目录结构

```
Project/
└── .trae/
    └── rules/
        ├── project_rules.md      # 项目特定规则（始终加载）
        ├── coding_standards.md   # 代码规范（按需加载）
        └── workflow_rules.md     # 工作流规则（按需加载）
```

**project_rules.md 应包含：**
- 项目类型标识（Apple App / Game / Design System）
- 必须遵循的架构模式
- 禁止使用的技术或模式
- 代码风格约定（命名、注释、文件组织）
- 测试要求

**coding_standards.md 应包含：**
- Swift/SwiftUI 代码规范（参考Apple官方指南）
- 文件命名约定
- 函数/变量命名规则
- 注释规范（何时需要、何时不需要）
- 错误处理模式

**workflow_rules.md 应包含：**
- 开发流程各阶段的要求
- PRD→Architecture→Source→Testing的转换规则
- 文档更新时机和格式要求

### 1.2 Rules 编写最佳实践

| 原则 | 说明 | 反例 |
|------|------|------|
| **具体可执行** | 规则必须是可以检查的 | "写出好代码"（模糊） |
| **有例外说明** | 必要时注明例外情况 | "永远不要使用全局变量"（无例外） |
| **引用来源** | 规则应可追溯至标准或决策日志 | 无出处的"我认为应该..." |
| **与AGENTS.md一致** | Rules不得与AGENTS.md冲突 | 在Rules中定义与AGENTS.md不同的规则 |

**合格示例**：
```markdown
## 文件命名
- SwiftUI View文件以View结尾，如 LoginView.swift
- ViewModel文件以ViewModel或VM结尾，如 AuthViewModel.swift
- Service文件以Service或Manager结尾，如 NetworkService.swift
- 例外：系统框架已有命名约定的文件（如 AppDelegate.swift）保持原名

## 注释规范
- 公开API必须添加文档注释（///）
- 私有函数无需注释，除非逻辑复杂（>20行）或包含业务规则
- 禁止无意义的注释（如 "// 创建变量"）
```

---

## 2. Memory（记忆系统）

### 2.1 TRAE内置记忆 vs 外部记忆

```
TRAE Memory Architecture
├── 内置记忆（会话级）
│   ├── 当前对话的上下文窗口内容
│   └── 随对话轮数增加而累积的状态
│   └── 会话结束后丢失（除非写入外部记忆）
│
├── .trae/memory/（项目级持久化）
│   ├── project-knowledge.md      # 项目核心知识
│   ├── decisions/                # 重要决策记录
│   └── patterns/                 # 已确认的设计模式
│
└── 文件系统（项目全周期）
    ├── AGENTS.md                  # 永久层（始终加载）
    ├── PROJECT_CONTEXT.md         # 项目核心信息
    └── CONTINUE/                  # 稳定层（按需加载）
```

### 2.2 .trae/memory/ 目录使用指南

**project-knowledge.md** — 项目核心知识（约200-500字）：
```markdown
# Project Knowledge

## 项目概述
[2-3句话描述项目]

## 关键技术决策
1. [决策1及其理由，引用decision-log/]
2. [决策2及其理由]

## 已知限制和约束
1. [平台/技术/业务约束]

## 常用开发模式
1. [已验证有效的开发流程]
```

**decisions/** — 重要决策记录（从AGENTS.md §14决策日志同步）：
```
.decisions/
├── 2025-01-15-auth-strategy.md
├── 2025-01-20-data-persistence.md
└── ...
```

**patterns/** — 已确认的设计模式：
```
.patterns/
├── mvvm-implementation.md        # 本项目MVVM实现方式
├── error-handling.md             # 错误处理模式
└── navigation-patterns.md        # 导航模式
```

### 2.3 Memory 更新策略

| 触发条件 | 行动 |
|---------|------|
| 新对话开始 | TRAE 读取 .trae/memory/project-knowledge.md + AGENTS.md |
| 做出重要决策 | 同步到 .trae/memory/decisions/ + CONTINUE/decision-log/ |
| 确认有效模式 | 写入 .trae/memory/patterns/ |
| 月度维护时 | 审查并更新 project-knowledge.md（清理过时信息） |

---

## 3. Workspace（工作空间管理）

### 3.1 标准Workspace结构

```
Project/
├── .trae/                          # TRAE配置和规则
│   ├── rules/                      # 项目规则
│   └── memory/                     # 项目记忆
├── TEMPLATE_FRAMEWORK/             # 模板框架（始终详细）
│   ├── AGENTS.md                   # 全局规则
│   ├── PROJECT_CONTEXT.md          # 项目信息
│   ├── MODEL_CONFIG.md             # 模型配置
│   └── ...
├── PRD/                            # 功能需求文档
├── ARCHITECTURE/                   # 技术架构文档
├── SOURCE/                         # 源代码（实际代码文件）
├── TESTS/                          # 测试文件
├── DESIGN/                         # 设计资源
├── ASSETS/                         # 大文件存储（doc/PDF/Figma）
├── DEVLOG/                         # 开发日志
├── CONTINUE/                       # 模块总结和决策日志
├── ARCHIVE/                        # 归档文件
└── REFERENCES.md                   # 大文件索引
```

### 3.2 Workspace 维护规则

| 操作 | 频率 | TRAE自动执行 |
|------|------|-------------|
| 检查核心文件完整性 | 每次对话开始 | 自动检查AGENTS.md、PROJECT_CONTEXT.md、MODEL_CONFIG.md是否存在 |
| 更新模块状态 | 模块完成时 | 自动更新PROJECT_CONTEXT.md中的"已开发模块"列表 |
| 清理临时文件 | 月度维护 | 清理>30天的临时层文件（§12.2） |
| 更新REFERENCES.md | 新增大文件时 | 自动添加索引条目 |

### 3.3 Workspace 健康检查清单

```
□ AGENTS.md 存在且可读取（<2000行）
□ PROJECT_CONTEXT.md 的"最后更新"日期在近7天内
□ MODEL_CONFIG.md 中的模型配置未超过30天未审查
□ PRD/ 目录下的文件与PROJECT_CONTEXT.md中的模块列表一致
□ CONTINUE/ 中每个已完成模块都有对应的总结文件
□ DEVLOG/ 中没有超过14天的空白期（项目运行>30天时）
□ .trae/rules/project_rules.md 与AGENTS.md无冲突
```

---

## 4. Worktree（多工作树）

### 4.1 何时使用Worktree

| 场景 | 是否使用Worktree | 说明 |
|------|-----------------|------|
| 并行开发两个不相关模块 | ✅ 推荐 | 如同时开发"登录"和"设置"，避免互相干扰 |
| 大版本重构 | ✅ 推荐 | 在主分支上继续日常开发，在Worktree中安全尝试重构 |
| 实验性功能验证 | ✅ 推荐 | 不影响主分支，失败无成本 |
| 小型功能迭代 | ❌ 不需要 | 直接在主分支开发，减少管理开销 |
| Bug紧急修复 | ❌ 不推荐 | 直接在主分支修复，快速部署 |

### 4.2 Worktree 使用规范

```bash
# 创建功能Worktree（以"登录模块开发"为例）
git worktree add ../project-login login-branch

# 在Worktree中开发
cd ../project-login
# ... 开发工作 ...
git add .
git commit -m "feat: implement login module"

# 完成后合并回主分支
cd ../project
git merge ../project-login/login-branch

# 清理已合并的Worktree
git worktree remove ../project-login
git branch -d login-branch
```

### 4.3 Worktree 与TRAE的协作

| 操作 | TRAE行为 |
|------|---------|
| 用户说"在独立分支上尝试X" | TRAE 建议创建Worktree并说明原因 |
| 用户说"继续开发Y模块"（X已在Worktree中） | TRAE 自动切换到正确的Worktree目录 |
| 用户说"合并X到主分支" | TRAE 执行merge并更新PROJECT_CONTEXT.md |
| Worktree中发生错误 | TRAE 记录到DEVLOG/，建议回退或修复 |

---

## 5. Context（上下文管理深度版）

### 5.1 Context生命周期操作手册

详见 AGENTS.md §11，此处补充实际操作指南。

#### 5.1.1 永久层维护

```
操作：定期审查永久层文件质量

触发条件：季度审计时（每90天）

检查清单：
□ AGENTS.md 是否仍准确反映项目规则？（>100行变更时审查）
□ PROJECT_CONTEXT.md 的项目概述是否仍准确？
□ MODEL_CONFIG.md 的模型配置是否需要更新？

行动：如有变更，在PROJECT_CONTEXT.md的"变更记录"中记录
```

#### 5.1.2 稳定层维护

```
操作：管理已完成模块的持久化

触发条件：模块完成时 + 月度维护

检查清单：
□ 已完成模块是否有CONTINUE/总结？
□ 相关决策日志是否已记录到CONTINUE/decision-log/？
□ PROJECT_CONTEXT.md中的模块状态是否更新？

行动：补充缺失的总结或决策日志
```

#### 5.1.3 工作层维护

```
操作：管理当前开发中的模块

触发条件：每次对话开始

检查清单：
□ 当前模块的PRD是否最新？
□ DevLog是否有最近记录？
□ 上下文使用率是否在安全范围内（<80%）？

行动：如PRD已过时，提醒用户先更新PRD再开始开发
```

#### 5.1.4 临时层维护

```
操作：清理超过30天的DevLog

触发条件：月度维护（§12.2）

行动：
1. 扫描DEVLOG/中所有文件
2. 找出创建日期超过30天的条目
3. 标记为"可弃"（不立即删除）
4. 在PROJECT_CONTEXT.md中记录清理摘要

注意：标记为"可弃"的文件保留到季度审计时物理删除
```

#### 5.1.5 可弃层维护

```
操作：物理删除或归档超过90天的文件

触发条件：季度审计（§12.3）

行动：
1. 扫描标记为"可弃"的文件
2. 评估是否有后续引用价值
3. 无价值的文件物理删除
4. 有历史价值的文件移动到ARCHIVE/

输出：季度审计报告中的"文件清理记录"部分
```

### 5.2 Context Explosion 预防策略

| 信号 | 预防措施 | TRAE行动 |
|------|---------|---------|
| 对话轮数 >20轮 | 提醒用户生成中间总结 | 建议"生成当前进度的模块总结" |
| Token使用 >70%安全上限 | 主动检查未记录的决策 | 提醒"是否有关键决策需要记录？" |
| Token使用 >80%安全上限 | 自动触发上下文溢出处理 | 建议开启新对话，保存进度到CONTINUE/ |
| 文件变更 >15个 | 建议拆分为子任务 | "当前涉及[X]个文件，建议拆分为[Y]个子任务" |

---

## 6. Tool Call（工具调用最佳实践）

### 6.1 工具选择决策树

```
用户请求 → 需要什么操作？
    │
    ├── 读取文件内容 → Read工具
    ├── 搜索代码/文本 → Grep / SearchCodebase
    ├── 查找文件路径 → Glob / LS
    ├── 修改文件内容 → SearchReplace（小改动）/ Write（重写整个文件）
    ├── 创建目录结构 → RunCommand（mkdir等）
    ├── 执行构建/测试 → RunCommand
    ├── 查看项目结构 → LS / Task（复杂探索）
    └── 调用外部服务 → run_mcp（MCP工具）
```

### 6.2 Tool Call 效率优化

| 场景 | 低效做法 | 高效做法 |
|------|---------|---------|
| 读取多个文件 | 逐个Read调用 | 批量Read，一次调用读取相关文件 |
| 搜索多个关键词 | 多次Grep调用 | 使用正则表达式一次匹配 |
| 探索项目结构 | 逐层LS进入子目录 | 使用Task工具一次性全面探索 |
| 修改分散的文件 | 逐个SearchReplace | 合理分组，减少调用次数 |

### 6.3 Tool Call 安全规范

| 规则 | 说明 |
|------|------|
| **不执行未确认的破坏性操作** | 删除文件、覆盖重要配置前必须确认 |
| **不提交代码除非明确要求** | git commit/push 仅在用户明确要求时执行 |
| **不安装未声明的依赖** | 引入新库前确认PROJECT_CONTEXT.md中已记录 |
| **不修改核心文件除非必要** | AGENTS.md、PROJECT_CONTEXT.md 的修改需用户确认 |

---

## 7. Conversation（对话管理深度版）

### 7.1 对话生命周期完整流程图

```
对话开始（第0轮）
    │
    ▼
加载永久层（AGENTS.md + PROJECT_CONTEXT.md + MODEL_CONFIG.md）
    │
    ▼
检查维护状态（周/月/季是否逾期？）→ 如逾期，提醒用户
    │
    ▼
展示项目健康仪表板（§10）
    │
    ▼
第1轮：确认当前工作模块和目标
    │
    ▼
第2-N轮：执行具体任务
    │   ├── 每10轮检查上下文使用率（§13.5）
    │   ├── 每完成一个子任务，记录到DEVLOG/
    │   └── 遇到决策点，生成decision-log条目
    │
    ▼
最后3轮：
    ├── 生成/更新CONTINUE/总结（§3）
    ├── 追加DEVLOG/日志（§4）
    └── 更新PROJECT_CONTEXT.md中的模块状态
    │
    ▼
对话结束 → 标记为"已完成"或"需继续"
```

### 7.2 对话轮数与Token使用监控表

| 阶段 | 轮数范围 | Token使用率 | TRAE行动 |
|------|---------|------------|---------|
| **健康区** | 1-15轮 | <60% | 正常执行任务 |
| **关注区** | 15-25轮 | 60%-75% | 每5轮检查一次上下文使用率 |
| **警告区** | 25-30轮 | 75%-85% | 提醒用户是否有关键决策未记录 |
| **危险区** | >30轮或>85% | >85% | 建议开启新对话，保存当前进度到CONTINUE/ |

### 7.3 对话结束检查清单

在每次对话结束前，TRAE 应执行：

```
□ 当前模块的DEVLOG/日志已更新
□ 如有重要决策，已生成decision-log条目
□ PROJECT_CONTEXT.md中的模块状态已更新
□ 上下文使用率是否<80%？如否，建议开启新对话
□ 向用户展示"本次工作完成摘要"
□ 如模块已完成，提醒生成CONTINUE/总结
```

---

## 8. TRAE配置速查表

| 配置项 | 推荐值 | 配置文件 |
|--------|-------|---------|
| 单次对话最大轮数 | 30轮（建议25轮内结束） | AGENTS.md §13.2 |
| 单次对话Token上限 | 模型安全上限的80% | AGENTS.md §7.1 |
| 文件变更上限 | 20个文件/次 | AGENTS.md §7.2 |
| 代码新增上限 | 500行/次 | AGENTS.md §7.2 |
| 周维护提醒阈值 | >7天未执行 | AGENTS.md §12.5 |
| 月维护提醒阈值 | >30天未执行 | AGENTS.md §12.5 |
| 季度维护提醒阈值 | >90天未执行 | AGENTS.md §12.5 |

---

## 9. 与补充章节的关系

- **Prompt模板**：S01-prompt-engineering.md 提供如何编写有效Prompt
- **模型切换**：S03-model-switching-decision-tree.md 决定用哪个模型执行
- **任务粒度**：S06-agent-task-granularity.md 决定如何拆分任务
- **长期策略**：S04-long-term-project-strategy.md 决定跨月/跨年的项目管理
- **oMLX实践**：S05-omlx-best-practices.md 优化本地模型性能
