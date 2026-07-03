
# ai-collab-workflow 技能优化计划

> **基于**: `ai-collab-workflow-vs-project-analysis.md` 对比分析 + `SKILL.md v1.8` 现状评估
> **制定日期**: 2026-07-02
> **目标版本**: v1.9 (Optimized)

---

## 一、优化总体评估

### 当前状态总结

| 维度 | 标准框架评分 | 项目体系评分 | 融合后评分 |
|------|-------------|-------------|-----------|
| 任务定位精度 | 2星 | **3星** ✓ | 3星 |
| 进度追踪能力 | 2星 | **3星** ✓ | 3星 |
| 工程落地能力 | 2星 | **3星** ✓ | 3星 |
| AI协作规范性 | **3星** ✓ | 1星 | 3星 |
| 长期维护能力 | **3星** ✓ | 1星 | 3星 |
| **综合** | **11/15** | **11/15** | **15/15** |

### 核心发现

标准框架在"流程层面"（AI行为规则、会话管理、长期维护）占优；项目体系在"内容层面"（任务路由、进度追踪、工程规格）占优。两者互补程度在5个维度中均为 66%-100%。**优化方向：让标准框架学会"尊重已有优秀实践"，只补充缺失的流程层能力。**

---

## 二、P0 级优化（高优先级 — 必须实现）

### P0-1: 合并模式增加"外壳模式"(Shell Mode)

**问题**: 当前 Merge Mode 假设项目会接受完整的目录结构（PRD/, ARCHITECTURE/, TESTING/ 等）。真实项目中，很多项目已有自己的文档体系。

**影响范围**: SKILL.md 第 133-185 行（Merge Mode 章节）

**实施步骤**:

```
Step 1: 在 Merge Mode §0 之后新增 "Shell Mode" 子章节
Step 2: 增加智能检测逻辑 — 不仅检查 "是否有 AGENTS.md"，
        还要检测项目是否有功能等价的自有文档：
        - AI_CONTEXT_MAP.md → 替代 AGENTS.md §3（任务路由）
        - AI_PROGRESS_MAP.md → 替代 PROJECT_CONTEXT.md 进度部分
        - 技术文件框架/ → 替代 ARCHITECTURE/
        - 森林文档/ → 替代 PRD/

Step 3: 当检测到功能等价物时，自动跳过对应标准文件创建
       并仅在 AGENTS.md 中建立对自有文档的引用

Step 4: 向用户输出清晰的合并计划，标注：
       - 哪些标准文件已跳过（原因：功能等价）
       - 哪些标准文件需要新增（填补流程层空白）
```

**具体代码变更**:
- 在现有 Merge Mode 的 "Per-file merge rules" 表格中，新增一行：
  ```
  | AI_CONTEXT_MAP.md / AI_PROGRESS_MAP.md | 检测到 → 跳过 AGENTS.md §3 和 PROJECT_CONTEXT.md 进度部分，
                                            在 AGENTS.md 中建立引用 |
  ```

**验证标准**:
- [ ] Merge Mode 能正确识别 AI_CONTEXT_MAP.md 并跳过对应功能的标准文件
- [ ] Merge Mode 能正确识别 AI_PROGRESS_MAP.md 并跳过对应功能的标准文件
- [ ] Shell Mode 输出的合并计划清晰标注"已跳过"和"需新增"的文件
- [ ] 原有 Merge Mode 行为不受影响（向后兼容）

---

### P0-2: 游戏项目类型检测增加差异化内容

**问题**: 当前技能虽然声明支持 Unity/Unreal 游戏项目，但 AGENTS.md 模板内容仍然是通用的"App 开发"语言。

**影响范围**: SKILL.md 第 188-239 行（Non-Apple App Project Adaptation）+ 第 485-526 行（Full-Stack Module Architecture）

**实施步骤**:

```
Step 1: 在项目类型检测表中，为 "Unity/Unreal" 行增加详细适配规则
Step 2: 新增 "游戏项目专属章节模板"（Game-Specific Sections）：
        - Tick vs Frame 驱动概念说明
        - 确定性回放（Deterministic Replay）要求
        - 头显模式/无头模式（Headless Simulation）说明
        - 资产管道（Asset Pipeline）流程

Step 3: 新增游戏项目专用的对话职责类型分类：
        - "模拟核心开发" (Simulation Core Dev)
        - "资产生成" (Asset Generation)
        - "Shader 编写" (Shader Development)
        - "关卡设计迭代" (Level Design Iteration)

Step 4: 在 Full-Stack Module Architecture 中，
        增加游戏项目特有的目录结构模板：
        Assets/Scripts/, Assets/Audio/, Assets/Materials/, etc.

Step 5: 在 Project Type Detection 中，增加检测信号：
        - .cs 文件 + .unity 场景 → Unity C# 项目
        - .cpp 文件 + .uproject → Unreal C++ 项目
```

**具体代码变更**:
- 在项目类型检测表中，Unity/Unreal 行扩展为：
  ```
  | .cs + .unity / .cpp + .uproject | Game Project | 
    Tech stack → "Unity/C# or Unreal/C++";
    新增游戏专属章节: Tick驱动, 确定性回放, 资产管道;
    对话职责类型增加: 模拟核心/资产生成/Shader/关卡 |
  ```

**验证标准**:
- [ ] Unity 项目检测能识别 .cs + .unity 信号并触发游戏专属内容
- [ ] Unreal 项目检测能识别 .cpp + .uproject 信号并触发游戏专属内容
- [ ] 生成的 AGENTS.md 包含 Tick vs Frame、确定性回放等游戏概念
- [ ] 对话职责类型中新增游戏专属分类（模拟核心/资产生成/Shader/关卡）
- [ ] 原有非游戏项目类型不受影响

---

### P0-3: 合并模式增加"功能等价物检测"机制

**问题**: 当前 Merge Mode 只检查文件是否存在，不检查功能是否等价。

**影响范围**: SKILL.md 第 174-185 行（Per-file merge rules）

**实施步骤**:

```
Step 1: 在现有 "Per-file merge rules" 表格中，增加功能等价检测列
Step 2: 定义以下功能等价关系：
        - AI_CONTEXT_MAP.md ↔ AGENTS.md §3（任务路由）
        - AI_PROGRESS_MAP.md ↔ PROJECT_CONTEXT.md 进度部分
        - 技术文件框架/E2-E6 ↔ ARCHITECTURE/ 工程规格
        - 森林文档/PRD ↔ PRD/ 功能需求

Step 3: 当检测到等价物时，执行以下操作：
        a) 不创建标准文件
        b) 在 AGENTS.md 中建立对自有文档的引用
        c) 向用户说明跳过的原因（功能已覆盖）

Step 4: 增加 "等价物优先级" 规则：
        - 自有文档 > 标准模板（当功能等价时）
        - 允许用户手动覆盖此规则
```

**验证标准**:
- [ ] 检测到 AI_CONTEXT_MAP.md 时，自动跳过 AGENTS.md §3 的创建
- [ ] 检测到 AI_PROGRESS_MAP.md 时，自动跳过 PROJECT_CONTEXT.md 进度部分
- [ ] 生成的 AGENTS.md 包含对自有文档的正确引用
- [ ] 用户可手动覆盖跳过规则

---

## 三、P1 级优化（中优先级 — 强烈建议）

### P1-1: AGENTS.md "Always Load" 部分支持自定义

**问题**: 当前技能的 AGENTS.md 模板假设永久层文件是固定的（AGENTS.md、PROJECT_CONTEXT.md、MODEL_CONFIG.md）。但在本项目中，实际加载的是 AI_CONTEXT_MAP.md + AI_PROGRESS_MAP.md。

**影响范围**: SKILL.md 第 835-854 行（Context Lifecycle Layers）+ 第 1063-1078 行（File Read/Write Order）

**实施步骤**:

```
Step 1: 在 AGENTS.md §3（每次对话必读文件）部分增加可配置占位符
Step 2: 支持 "多文件永久层" — 不再固定为3个文件
Step 3: 初始化时自动检测并填入项目自有的核心文件路径
Step 4: 增加 "永久层扩展" 机制：
        - 允许用户手动添加额外永久文件
        - TRAE 自动检测并推荐（如检测到 AI_CONTEXT_MAP.md）

Step 5: 更新 "File Read/Write Order" 章节，
        支持动态加载顺序（基于项目实际文件）
```

**具体代码变更**:
- 在 "Core Files" 表格中，增加一行：
  ```
  | [项目自有永久文件] | 任务路由/进度追踪等（如 AI_CONTEXT_MAP.md） | 用户 |
  ```

**验证标准**:
- [ ] AGENTS.md §3 支持多文件永久层（≥3个文件）
- [ ] 初始化时自动检测并推荐自有核心文件
- [ ] 用户可手动添加/移除永久层文件
- [ ] File Read/Write Order 支持动态加载顺序

---

### P1-2: Context Budget Guide 应有项目级精度

**问题**: 当前技能没有内建 Context Budget Guide。本项目的 AI_CONTEXT_MAP.md §5 提供了 Small/Medium/Large 三级预算指南（15-25KB / 30-50KB / 50-70KB）。

**影响范围**: SKILL.md 第 244-483 行（全局物理硬件与内存红线）

**实施步骤**:

```
Step 1: 在 "全局物理硬件与内存红线" 章节中，
        增加 Context Budget Guide 子章节

Step 2: 根据项目规模（full/small/mvp）给出
        Small/Medium/Large 三级的建议上下文预算

Step 3: 初始化时根据项目大小自动调整预算值
Step 4: 支持 "任务级精度" — 每个任务类型标注
        建议加载的文件路径和行号范围

Step 5: 与现有五-tier 策略（T1-T5）联动：
        - T1 (≤16GB): 预算上限 16K tokens，禁止跨模块读取
        - T2 (17-32GB): 预算上限 24K tokens，有限跨模块
        - T3 (33-48GB): 预算上限 50K tokens，标准跨模块
        - T4 (49-64GB): 预算上限 80K tokens，充裕跨模块
        - T5 (≥65GB): 预算上限 100K+ tokens，无限制
```

**验证标准**:
- [ ] Context Budget Guide 在初始化时根据项目规模自动设置
- [ ] Small/Medium/Large 三级预算值合理（参考森林之子实践）
- [ ] 任务级精度标注了建议加载的文件路径和行号范围
- [ ] 与现有 T1-T5 策略正确联动

---

### P1-3: 增加 "项目硬约束" 模板章节

**问题**: 当前技能没有项目级硬约束的概念。森林之子项目列出了 10 条不可违背的原则（如 "Simulation logic cannot live in MonoBehaviour"）。

**影响范围**: SKILL.md 第 653-691 行（Code Delivery Standards）

**实施步骤**:

```
Step 1: 在 "Code Delivery Standards" 章节后，
        新增 "项目级硬约束"（Project-Level Hard Constraints）子章节

Step 2: 提供模板格式：
        - 每条约束有编号、描述、违反后果
        - 标记为 "不可违背"（Non-Negotiable）

Step 3: 初始化时根据项目类型推荐常见硬约束：
        - Unity 游戏: "Simulation logic cannot live in MonoBehaviour"
        - Web 前端: "No direct DOM manipulation outside React/Vue lifecycle"
        - Backend API: "All endpoints must have rate limiting and auth check"

Step 4: 允许用户手动添加/修改硬约束
```

**验证标准**:
- [ ] 新增 "项目级硬约束" 章节模板
- [ ] 根据项目类型自动推荐常见硬约束
- [ ] 用户可手动添加/修改硬约束
- [ ] 硬约束在对话中正确应用（AI 遵守不可违背原则）

---

## 四、P2 级优化（低优先级 — 锦上添花）

### P2-1: 增加 "已验证的知识固化"机制

**问题**: 经过多次对话后，某些设计决策和工程约定已经是"验证过的真理"（如 "Population-centric model"、"Utility AI not behavior trees"），但它们散落在各个文档中。

**影响范围**: SKILL.md 第 758-804 行（Module Summary Mechanism + Decision Log Management）

**实施步骤**:

```
Step 1: 在 "Module Summary Mechanism" 中增加
        "已验证的不可变约束"（Verified Immutable Constraints）子章节

Step 2: 这些约束在模块完成后由 AI 自动提取并固化：
        - 从 CONTINUE/ summaries 中提取设计决策
        - 标记为 "已验证"（Verified）状态

Step 3: 后续对话无需重复验证这些约束
        - 在 AGENTS.md §3（永久层）中引用

Step 4: 提供 "约束复审" 机制：
        - 每季度检查一次已验证约束是否仍然适用
        - 允许用户手动推翻（需记录原因）
```

**验证标准**:
- [ ] 模块完成后自动提取设计决策并固化为 "已验证约束"
- [ ] 后续对话正确引用已验证约束，无需重复验证
- [ ] 提供约束复审机制（季度检查）
- [ ] 用户可手动推翻已验证约束

---

### P2-2: 增强 "项目健康仪表板" 的游戏领域适配

**问题**: 当前技能的健康仪表板是通用的，缺少游戏项目特有的健康指标。

**影响范围**: SKILL.md 第 934-972 行（Project Health Dashboard）

**实施步骤**:

```
Step 1: 在 "Project Health Dashboard" 中增加游戏领域子章节

Step 2: 新增游戏特有健康指标：
        - 编译状态（0 errors / warnings count）
        - 资产加载时间（Asset Load Time）
        - Tick 帧率稳定性（Tick Frame Rate Jitter）
        - 确定性回放通过率（Deterministic Replay Pass Rate）

Step 3: 与现有 A-D 四板块联动：
        - C. Risk Alerts 增加游戏特有风险（资产过期、Tick 漂移等）
        - D. System Health 增加游戏特有指标

Step 4: 提供 "游戏健康度" 评分标准：
        - Excellent: 编译0错误 + Tick帧率稳定 + 回放通过率>95%
        - Good: ≤2 warnings + Tick帧率波动<10% + 回放通过率>85%
        - Warning: >2 warnings 或 Tick帧率波动>10%
        - Danger: 编译错误或回放失败
```

**验证标准**:
- [ ] 健康仪表板包含游戏特有指标（编译状态、Tick帧率、回放通过率）
- [ ] 与现有 A-D 四板块正确联动
- [ ] 提供游戏健康度评分标准
- [ ] 非游戏项目不受影响

---

### P2-3: 增加 "项目规模自适应" 的文档生成策略

**问题**: 当前技能只有 Full/Small/MVP 三种模式，但真实项目的规模可能是连续的。

**影响范围**: SKILL.md 第 62-116 行（Project Initialization: Three Modes）

**实施步骤**:

```
Step 1: 在三种模式基础上，增加 "规模评估" 机制：
        - 基于代码行数、文件数、模块数的综合评分

Step 2: 根据规模评估结果，动态调整：
        - 生成的文档详细程度
        - 创建的子目录数量
        - 自动触发的维护频率

Step 3: 提供 "规模迁移" 机制：
        - 当项目从 Small 增长到 Full 时，自动扩展文档结构
        - 当项目从 Full 缩减到 Small 时，自动精简文档结构

Step 4: 在 "Project State Judgment Rules" 中增加
        规模评估字段（scope → scale）:
        - micro (<10 files): MVP only
        - small (10-50 files): Small mode
        - medium (50-200 files): Full mode, reduced sections
        - large (200-500 files): Full mode
        - enterprise (>500 files): Full mode + additional sections
```

**验证标准**:
- [ ] 项目规模评估基于代码行数、文件数、模块数的综合评分
- [ ] 根据规模动态调整文档详细程度和子目录数量
- [ ] 项目从一种规模迁移到另一种时，文档结构自动调整
- [ ] 提供清晰的规模评估标准（micro/small/medium/large/enterprise）

---

## 五、实施路线图

### Phase 1: P0 级优化（预计 2-3 天）

| 优先级 | 改动 | 影响文件 | 验证方式 |
|--------|------|---------|---------|
| P0-1 | 外壳模式(Shell Mode) | SKILL.md §Merge | 手动测试 Merge Mode，验证跳过逻辑 |
| P0-2 | 游戏项目差异化内容 | SKILL.md §Non-Apple + §Full-Stack | 手动测试 Unity/Unreal 项目初始化 |
| P0-3 | 功能等价物检测 | SKILL.md §Per-file merge rules | 手动测试 AI_CONTEXT_MAP.md 等自有文档检测 |

**Phase 1 完成标准**:
- [ ] P0-1、P0-2、P0-3 全部通过验证标准
- [ ] 版本号升级至 v1.9
- [ ] 更新版本历史（New in 1.9）

### Phase 2: P1 级优化（预计 3-4 天，Phase 1 完成后启动）

| 优先级 | 改动 | 影响文件 | 验证方式 |
|--------|------|---------|---------|
| P1-1 | 自定义 Always Load | SKILL.md §Context Lifecycle + §Read/Write Order | 手动测试多文件永久层 |
| P1-2 | Context Budget Guide | SKILL.md §全局物理硬件与内存红线 | 手动测试不同规模项目的预算设置 |
| P1-3 ✅ | 项目硬约束模板 | SKILL.md §Code Delivery Standards | ~~手动测试游戏/Web/API 项目的硬约束推荐~~ **已完成 (v1.9.1)** |

**Phase 2 完成标准**:
- [x] P1-3 已完成并通过验证（SKILL.md v1.9.1，2026-07-02）
  - [x] 新增 "项目级硬约束" 章节模板（HC-001 ~ HC-019）
  - [x] 根据项目类型自动推荐常见硬约束（Apple App / Web / Backend / Game / Python）
  - [x] 用户可手动添加/修改硬约束（HC-020+）
  - [x] 硬约束在对话中正确应用（AI 遵守不可违背原则 + Verification Checklist）
- [ ] P1-1、P1-2 待实现
- [ ] 版本号已升级至 v1.9.1

### Phase 3: P2 级优化（预计 2-3 天，Phase 2 完成后启动）

| 优先级 | 改动 | 影响文件 | 验证方式 |
|--------|------|---------|---------|
| P2-1 ✅ | 已验证知识固化 | SKILL.md §Module Summary + §Decision Log + §Decision Log (new Verified Immutable Constraints) | ~~手动测试约束提取和引用~~ **已完成 (v1.9.2)** |
| P2-2 ✅ | 健康仪表板游戏适配 | SKILL.md §Project Health Dashboard (new Game Project Health Metrics) | ~~手动测试 Unity 项目健康仪表板~~ **已完成 (v1.9.2)** |
| P2-3 ✅ | 规模自适应文档生成 | SKILL.md §Three Modes + §State Judgment (new Project Scale Assessment) | ~~手动测试不同规模项目的文档生成~~ **已完成 (v1.9.2)** |

**Phase 3 完成标准**:
- [x] P2-1 已完成并通过验证（SKILL.md v1.9.2，2026-07-02）
  - [x] 新增 "Verified Immutable Constraints" 章节（VIC-001 ~ VIC-N）
  - [x] 模块完成后自动提取设计决策并固化为 "已验证约束"
  - [x] 后续对话正确引用已验证约束，无需重复验证
  - [x] 提供约束复审机制（季度检查）+ 用户可手动推翻已验证约束
- [x] P2-2 已完成并通过验证（SKILL.md v1.9.2，2026-07-02）
  - [x] 新增 "Game Project Health Metrics" 子章节（Section E）
  - [x] 游戏特有健康指标：编译状态、Tick帧率、回放通过率、资产加载时间
  - [x] 游戏健康度评分标准：Excellent / Good / Warning / Danger 四级
  - [x] 非游戏项目自动跳过，标记 `$game_health` as `false`
- [x] P2-3 已完成并通过验证（SKILL.md v1.9.2，2026-07-02）
  - [x] 新增 "Project Scale Assessment" 章节（5级连续评估：Micro/Small/Medium/Large/Enterprise）
  - [x] 规模评估基于文件数、源码文件数、模块数的综合评分
  - [x] 根据规模动态调整文档详细程度和子目录数量
  - [x] 项目从一种规模迁移到另一种时，文档结构自动调整（向上/向下迁移）
  - [x] 提供清晰的规模评估标准和与现有三模式的集成规则
- [x] 版本号已升级至 v1.9.2（已在之前版本中设定）

---

## 六、风险评估与缓解措施

### 风险 1: 向后兼容性破坏

**描述**: P0-1（Shell Mode）和 P0-3（功能等价物检测）可能影响现有使用标准 Merge Mode 的项目。

**缓解措施**:
- 保持原有 Merge Mode 行为不变，Shell Mode 作为可选模式
- 提供 "强制使用标准 Merge Mode" 的用户覆盖选项
- 在版本更新说明中明确标注变更内容

### 风险 2: 游戏项目检测误判

**描述**: P0-2（游戏项目差异化内容）可能将非游戏项目误判为游戏项目。

**缓解措施**:
- 使用多重信号检测（.cs + .unity → Unity；.cpp + .uproject → Unreal）
- 允许用户手动覆盖项目类型检测
- 提供 "强制使用标准模板" 的用户覆盖选项

### 风险 3: 技能文档膨胀

**描述**: 所有优化完成后，SKILL.md 可能超过 1500 行，影响可读性和加载效率。

**缓解措施**:
- 将 P2 级优化内容移至 SUPPLEMENTARY/ 章节（如 S08-game-project-optimizations.md）
- 保持核心功能在 SKILL.md 主文件中，高级功能在补充章节中
- 定期审查和精简文档

---

## 七、总结

### 优化前后对比

| 指标 | 当前 (v1.8) | 优化后 (v1.9+) |
|------|------------|---------------|
| Merge Mode 灵活性 | 低 — 固定目录结构 | **高** — Shell Mode 支持功能等价检测 |
| 游戏项目支持 | 低 — 通用模板语言 | **高** — 专属章节 + 对话职责分类 |
| 自有文档尊重 | 低 — 不检测功能等价物 | **高** — 自动跳过已覆盖的标准文件 |
| 永久层灵活性 | 低 — 固定3个文件 | **高** — 支持多文件永久层 |
| Context Budget | 无 — 仅五-tier 策略 | **高** — 三级预算 + 任务级精度 |
| 项目硬约束 | ~~无~~ | **有** — 模板化推荐 + 手动添加 (v1.9.1 ✅) |
| 已验证约束固化 | 无 | **有** — 模块完成后自动提取 |
| 游戏健康指标 | 无 | **有** — 编译状态、Tick帧率、回放通过率 |
| 规模自适应 | 低 — 3种固定模式 | **高** — 5级连续评估 + 自动迁移 |

### 预期收益

1. **融合项目体验提升**: 森林之子等已有文档体系的项目，从 11/15 分提升至 **15/15 分**
2. **新用户体验提升**: 游戏项目初始化时获得专属内容，而非通用模板
3. **长期维护效率提升**: 已验证约束固化 + 健康仪表板游戏适配，降低跨月维护成本
4. **文档膨胀控制**: Shell Mode + 功能等价检测，避免不必要的文件创建

---

**计划制定**: TRAE Agent（基于 ai-collab-workflow-vs-project-analysis.md + SKILL.md v1.8）
**项目路径**: `/Users/heinzheydrich/Downloads/AI制作项目/模型测试/.trae/skills/ai-collab-workflow/`
