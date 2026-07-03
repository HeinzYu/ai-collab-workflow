# ai-collab-workflow 技能优化执行方案

> **基于**: `ai-collab-workflow-vs-project-analysis.md` + `check-compliance-analysis.md` 两份报告的交叉梳理
> **制定日期**: 2026-07-02
> **评估对象**: ai-collab-workflow v1.8（SKILL.md） + check-compliance.sh

---

## 一、两份报告发现的问题交叉矩阵

### 1.1 报告来源概览

| 报告 | 定位 | 评估对象 | 发现改进点 |
|------|------|---------|-----------|
| **ai-collab-workflow-vs-project-analysis** | 五维度对比分析 | 标准框架 vs 森林之子项目自有文档体系 | 5 条 SKILL.md 改进建议（H/M/L 优先级） |
| **check-compliance-analysis** | 合规检查脚本分析 | check-compliance.sh 的四阶段检查逻辑 | 6 个优化方向（P0-P5 优先级） |

### 1.2 问题交叉映射

```
check-compliance 提出的问题                  vs-analysis 提出的问题
──────────────────────────────────────     ──────────────────────────────
                                            
Dir 1 (P0): 功能等价性检查        ←──→     §6.1 (H): Shell Mode / 功能等价检测
  "脚本只检查标准框架文件是否                "合并模式应检测项目自有文档，
   存在，不识别等价物"                       自动跳过对应的标准文件创建"
                                          
Dir 2 (P1): 集成到初始化流程        ✗       (仅 check-compliance 提出，vs-analysis 未涉及)
  "初始化时调用脚本，根据评分
   决定策略"
                                          
Dir 3 (P2): 语义理解检查            ✗       (仅 check-compliance 提出，vs-analysis 未涉及)
  "grep 关键词太刚性，应支持
   正则和多语言变体"
                                          
Dir 4 (P3): 可选插件嵌入            ✗       (仅 check-compliance 提出，vs-analysis 未涉及)
  "技能流程末尾可选运行合规检查"
                                          
Dir 5 (P4): 动态趋势追踪            ✗       (仅 check-compliance 提出，vs-analysis 未涉及)
  "记录历史评分，显示趋势"
                                          
Dir 6 (P5): 触发指令                ✗       (仅 check-compliance 提出，vs-analysis 未涉及)
  "/check-compliance 命令"
                                          
✗ (仅 vs-analysis 提出)             §6.2 (H): 游戏项目差异化内容
                                    "AGENTS.md 模板仍是 App 开发语言，
                                     缺少 Tick/回放/资产管道等概念"
                                          
✗ (仅 vs-analysis 提出)             §6.3 (M): Always Load 自定义
                                    "永久层文件固定为3个，不支持
                                     项目自有的多文件永久层"
                                          
✗ (仅 vs-analysis 提出)             §6.4 (M): Context Budget Guide
                                    "无内建上下文预算指南，
                                     项目体系的 S/M/L 三级实践值得吸纳"
                                          
✗ (仅 vs-analysis 提出)             §6.5 (L): 已验证知识固化
                                    "经过多次对话验证的设计决策散落
                                     在各文档中，应自动提取为不可变约束"
```

### 1.3 重合发现

| 重合主题 | check-compliance 来源 | vs-analysis 来源 | 统一后名称 |
|---------|---------------------|-------------------|-----------|
| 功能等价检测 | Dir 1 (P0) | §6.1 (H) | **Shell Mode + 功能等价检测** |
| Context Budget | 脚本中检查关键词 | §6.4 (M) | **Context Budget Guide 嵌入技能** |
| Verified Constraints | 脚本中检查关键词 | §6.5 (L) | **已验证知识固化机制** |

---

## 二、统一优化项清单（按优先级排序）

### P0 级：必须实现（两份报告高度一致的刚性缺陷）

#### P0-1: Shell Mode + 功能等价检测

**来源**: vs-analysis §6.1 (HIGH) + check-compliance Dir 1 (P0)
**核心问题**: 当前框架在 Merge Mode 中假设目标项目会接受完整的标准目录结构。真实项目中，项目自有文档体系（如 AI_CONTEXT_MAP.md、AI_PROGRESS_MAP.md、技术文件框架/）在功能上等价于标准文件（PROJECT_CONTEXT.md、ARCHITECTURE/），但框架不识别。同理，check-compliance.sh 只做二元文件存在性检查，不识别功能等价物。

**改动范围**: 两个文件
- **SKILL.md** — Merge Mode 章节 (L133-L185)
- **check-compliance.sh** — 所有 `check_file_exists()` 调用

**实施步骤**:

```
Step 1 — SKILL.md: 在 Merge Mode "Per-file merge rules" 中新增功能等价关系表
Step 2 — SKILL.md: 在 Merge Mode 增加 "Shell Mode" 子章节
Step 3 — check-compliance.sh: 改造 check_file_exists() 为 check_function_exists()
Step 4 — check-compliance.sh: 为每个标准文件定义等价文件列表
Step 5 — 联调：Shell Mode 创建 → check-compliance.sh 评分正常
```

**功能等价映射表**:

| 标准文件 | 功能等价物 | 检测信号 |
|---------|-----------|---------|
| `PROJECT_CONTEXT.md` | `AI_CONTEXT_MAP.md` | 包含 "任务路由" 或 "Context Map" 关键词 + 有 P0/P1/P2 优先级标注 |
| `PROJECT_CONTEXT.md`（进度部分） | `AI_PROGRESS_MAP.md` | 包含模块完成度百分比 + 验证状态 + N1-Nxx 任务编号 |
| `ARCHITECTURE/` | `技术文件框架/` | 包含 E2/E3/E4/E5/E6 命名的工程规格文件 |
| `PRD/` | `森林文档/` 或任意包含 `PRD_` 前缀的文件 | 包含功能需求描述 |
| `TESTING/` | 代码中的测试文件（如 `*smoke test*`） | 不创建新目录，在 AGENTS.md 中标注 |

**具体代码变更 — SKILL.md**:

在现有 "Per-file merge rules" 表格 (L174-L184) 后追加：

```markdown
### Functional Equivalence Detection (功能等价检测 — NEW in v1.9)

When adding the workflow to an existing project, TRAE MUST also scan for
**functionally equivalent files** before creating any standard file:

| Standard File/Folder | Equivalent Signals | If Found |
|---------------------|-------------------|----------|
| `PROJECT_CONTEXT.md` | `AI_CONTEXT_MAP.md` (with P0/P1/P2 markers) | Skip PROJECT_CONTEXT.md; reference AI_CONTEXT_MAP.md in AGENTS.md §3 |
| `PROJECT_CONTEXT.md` (progress section) | `AI_PROGRESS_MAP.md` (with N1-Nxx IDs) | Skip progress section; reference in AGENTS.md |
| `ARCHITECTURE/` | `技术文件框架/` or any `工程规格/` dir with E-prefixed files | Skip ARCHITECTURE/; reference in AGENTS.md |
| `PRD/` | `PRD_`-prefixed files in any directory | Skip PRD/; reference actual PRD paths |
| `TESTING/` | Test files existing in source tree | Skip TESTING/; note in AGENTS.md |

### Shell Mode (外壳模式)

When **≥2 functional equivalents** are detected, TRAE enters **Shell Mode**:

- ONLY create: AGENTS.md, MODEL_CONFIG.md, REFERENCES.md, DEVLOG/, CONTINUE/
- DO NOT create: PROJECT_CONTEXT.md, PRD/, ARCHITECTURE/, TESTING/, DEPLOYMENT/
- AGENTS.md §3 (Always Load) dynamically lists project-owned files instead of standard ones

Present to user:
```
检测到此项目已有完善的文档体系：
  - AI_CONTEXT_MAP.md → 替代 PROJECT_CONTEXT.md（任务路由 14 类 + 行号精度）
  - AI_PROGRESS_MAP.md → 替代进度追踪（23+ 模块 + N1-N35 编号）
  - 技术文件框架/ → 替代 ARCHITECTURE/（E2-E6 工程规格）

我建议用"外壳模式"，只补充流程层文件：
  ✓ 新增: AGENTS.md, MODEL_CONFIG.md, REFERENCES.md, DEVLOG/, CONTINUE/
  ✗ 跳过: PROJECT_CONTEXT.md, PRD/, ARCHITECTURE/, TESTING/, DEPLOYMENT/

请问是否接受？
```
```

**具体代码变更 — check-compliance.sh**:

在脚本头部增加等价物映射配置：

```bash
# ── Functional Equivalence Mapping (NEW in v2.0) ─────────
# Format: "standard_file|equivalent1|equivalent2|..."
# check_function_exists() checks any of these
declare -A EQUIVALENCE_MAP
EQUIVALENCE_MAP["PROJECT_CONTEXT.md"]="AI_CONTEXT_MAP.md|AI_PROGRESS_MAP.md"
EQUIVALENCE_MAP["ARCHITECTURE/tech-stack.md"]="技术文件框架/E2-*.md"
EQUIVALENCE_MAP["PRD/"]="森林文档/PRD_*.md"

check_function_exists() {
    local standard="$1"
    local description="$2"
    CORE_TOTAL=$((CORE_TOTAL + 1))

    # 1. Try standard file
    if [ -f "${PROJECT_DIR}/${standard}" ] || [ -d "${PROJECT_DIR}/${standard}" ]; then
        echo -e "  ${GREEN}✓${NC} ${BOLD}${standard}${NC} — ${description}"
        CORE_PASSED=$((CORE_PASSED + 1))
        return 0
    fi

    # 2. Try equivalents
    local equivalents="${EQUIVALENCE_MAP[${standard}]:-}"
    if [ -n "${equivalents}" ]; then
        IFS='|' read -ra EQ_FILES <<< "${equivalents}"
        for eq in "${EQ_FILES[@]}"; do
            # Support wildcard matching
            if compgen -G "${PROJECT_DIR}/${eq}" > /dev/null 2>&1; then
                echo -e "  ${GREEN}✓${NC} ${BOLD}${standard}${NC} [等价: ${eq}] — ${description}"
                CORE_PASSED=$((CORE_PASSED + 1))
                return 0
            fi
        done
    fi

    # 3. Not found
    echo -e "  ${RED}✗${NC} ${BOLD}${standard}${NC} — ${description} ${RED}[缺失]${NC}"
    return 1
}
```

**验证标准**:
- [ ] Shell Mode 正确识别 ≥2 个功能等价物并自动降级
- [ ] check-compliance.sh 对 AI_CONTEXT_MAP.md 项目评出正确分数（不因"缺失 PROJECT_CONTEXT.md"扣分）
- [ ] Shell Mode 输出的合并计划清晰标注"已跳过"和"需新增"
- [ ] 原有 Merge Mode 行为不受影响（无等价物时仍走全量合并）

---

### P1 级：强烈建议（两份报告各自提出的高价值改进）

#### P1-1: 游戏项目类型差异化内容

**来源**: vs-analysis §6.2 (HIGH)
**核心问题**: 当前技能虽然声明支持 Unity/Unreal 游戏项目，但 AGENTS.md 模板内容仍是通用的 App 开发语言。在项目类型检测表中，Unity/Unreal 行只有一行简单适配（"Tech stack → Unity/C# or Unreal/C++"），缺少游戏开发特有的概念。

**改动范围**: SKILL.md 一处
- "Non-Apple App Project Adaptation" 章节 (L188-L239)

**实施步骤**:

```
Step 1: 在项目类型检测表中扩展 Unity/Unreal 行
Step 2: 新增 "Game Project Specific Sections" 子章节
Step 3: 新增游戏专属对话职责类型
Step 4: 更新 Conversation Strategy 表格
```

**具体代码变更**:

在 "Project Type Detection" 表中，Unity/Unreal 行（L203）扩展为：

```
| `.cs` + `.unity` 场景文件 | **Unity Game** | Tech stack → "Unity/C#";
   新增游戏专属 AGENTS.md 模板章节:
     - §G1: Tick vs Frame 驱动概念
     - §G2: 确定性回放 (Deterministic Replay)
     - §G3: 头显/无头模式 (Headless Simulation)
     - §G4: 资产管道 (Asset Pipeline);
   对话职责类型新增: SimulationCore / AssetGen / ShaderDev / LevelDesign |
| `.cpp` + `.uproject` | **Unreal Game** | Tech stack → "Unreal/C++";
   同上，C++ 版本的游戏专属章节 |
```

在 "Conversation Strategy" 的 "Single Conversation Responsibility Types" 表格（L978-L986）后追加游戏专属行：

```
| **SimCore Dev** | Implement simulation core logic (Tick, ECS, UtilityAI) | UI/rendering changes |
| **Asset Gen** | Generate/import 3D models, textures, audio | Gameplay logic changes |
| **Shader Dev** | Write/modify Unity Shaders or Unreal Materials | Non-rendering code |
| **Level Design** | Scene layout, terrain, lighting, navmesh | Core gameplay systems |
```

在 "Non-Apple adaptations checklist" 中（L207-L216），追加游戏项目专项：

```
6. When project type is Game:
   - AGENTS.md §G1-G4 → game-specific chapters (Tick/Frame, Deterministic Replay, 
     Headless Mode, Asset Pipeline)
   - Conversation types → add SimCore/AssetGen/ShaderDev/LevelDesign
   - DEPLOYMENT/ → rename to BUILD/ (build pipeline instead of app store)
   - PRD/ → add game design document templates (GDD)
   - TESTING/ → add PlayMode + EditMode test templates (Unity) or 
     Automation Test templates (Unreal)
```

**验证标准**:
- [ ] Unity 项目检测（.cs + .unity）触发游戏专属 AGENTS.md 模板
- [ ] Unreal 项目检测（.cpp + .uproject）触发游戏专属 C++ 模板
- [ ] 生成的 AGENTS.md 包含 §G1-G4 游戏专属章节
- [ ] 对话职责类型包含 SimCore/AssetGen/ShaderDev/LevelDesign
- [ ] 非游戏项目不受影响

---

#### P1-2: 游戏项目差异化内容 + 动态永久层（带上下文预算保护）

**来源**: vs-analysis §6.2 (H) + §6.3 (M)
**核心问题**: 当前技能对游戏项目缺乏差异化支持（缺少动画、音频、资源文件检查）；永久层文件列表固定，无法根据项目自有文档动态调整。

**⚠️ 关键修正 — 防止永久层膨胀挤占上下文窗口**:

> **用户关切（已确认）**: "这个永久层的文件会不会随着项目推进而越来越大，在本地模型环境下每次对话中会挤占可用上下文输入输出和对话空间？"
> 
> **回答**: 是的，如果不加限制，确实会。以下是修正方案：

**动态永久层调度机制（新增）**：

| 档位 | 上下文窗口 | 永久层预算上限 | 策略 |
|------|-----------|--------------|------|
| T1 (≤16GB) | 16K tokens | ≤8KB（50%） | 仅加载 P0 文件（AGENTS.md + MODEL_CONFIG.md + [PROJECT_CONTEXT_FILE]） |
| T2 (17-32GB) | 24K tokens | ≤15KB（60%） | 加载 P0 + 首个 P1 文件（如 AI_CONTEXT_MAP.md），AI_PROGRESS_MAP.md 降级为 Stable Layer |
| T3 (33-48GB) | 32K tokens | ≤20KB（60%） | 加载 P0 + 全部 P1 文件（≤3个），超出部分降级为 Stable Layer |
| T4 (49-64GB) | 48K tokens | ≤30KB（60%） | 加载 P0 + 全部 P1 文件，部分 P2 按需加载 |
| T5 (≥65GB) | 64K+ tokens | ≤50KB（75%） | 全量加载，剩余空间可容纳对话历史 |

**调度算法（初始化时执行）**：

```
Step 1: 检测所有项目自有核心文件（AI_CONTEXT_MAP.md, AI_PROGRESS_MAP.md 等）
Step 2: 估算每个文件的 token 消耗（按 KB × 1.5 安全系数）
Step 3: 根据 T1-T5 档位确定永久层预算上限
Step 4: 按优先级（P0 > P1 > P2）填充永久层，直到预算耗尽
Step 5: 超出预算的文件自动降级为 "Stable Layer"（按需加载，非永久层）
Step 6: 在 AGENTS.md §3 中标注每个文件的优先级和状态（永久层 / Stable Layer）
```

**具体代码变更 — Context Lifecycle Layers 表格修改**:

将 L839 行的永久层示例从固定改为动态（带预算标注）：

```
| **Permanent** | Project lifetime | Every session | Human decides removal |
  [Dynamically resolved during init, subject to Context Budget]:
  - AGENTS.md (always, P0)
  - MODEL_CONFIG.md (always, P0)
  - [Project-owned context docs] (e.g., AI_CONTEXT_MAP.md, priority-sorted)
  - [Budget-limited: excess files → Stable Layer] |
```

**具体代码变更 — File Read/Write Order 修改**:

在 "Reading Order" (L1065-L1070) 中增加动态条目和预算标注：

```
### Reading Order (each new conversation, subject to Context Budget)
1. AGENTS.md §3 → reads [Budget-Limited Permanent File List]
2. MODEL_CONFIG.md (before each conversation)
3. [Project-owned context map] → AI_CONTEXT_MAP.md or equivalent (P0/P1)
4. [Budget-permitted progress tracker] → AI_PROGRESS_MAP.md (if budget allows, else Stable Layer)
5. Current working document (PRD, engineering spec, etc.)
6. Related CONTINUE/ summaries (when continuing existing features)

> Note: If total permanent layer exceeds Context Budget, lower-priority files
> are demoted to Stable Layer (on-demand loading only). See AGENTS.md §3 for details.
```

**具体代码变更 — AGENTS.md 模板增加 §3 占位符（带预算状态）**:

在 AGENTS.md 生成模板中增加可配置的 "永久层文件列表"（带预算状态标注）：

```markdown
## §3 每次对话必读文件（永久层，受 Context Budget 限制）

以下文件在每次新对话开始时自动加载：

| 优先级 | 状态 | 文件 | Token 预算 | 说明 |
|--------|------|------|-----------|------|
| P0 | ✅ 永久层 | `AGENTS.md` | ~3KB | 本文件 |
| P0 | ✅ 永久层 | `MODEL_CONFIG.md` | ~2KB | 模型配置与路由策略 |
| P0 | ✅ 永久层 | `[PROJECT_CONTEXT_FILE]` | ~5KB | [由初始化时自动检测填充] |
| P1 | ⚠️ [Budget 允许则永久层，否则 Stable Layer] | `[PROJECT_PROGRESS_FILE]` | ~8KB | [由初始化时自动检测填充] |
| P1 | ⚠️ [同上] | `[PROJECT_CONSTITUTION_FILE]` | ~5KB | [由初始化时自动检测填充，如无则跳过] |

> 以上文件列表由 ai-collab-workflow 初始化时自动检测并填入。
> 受 Context Budget 限制，超出预算的文件降级为 Stable Layer（按需加载）。
> 用户可手动添加/移除永久层文件。

### 档位与预算对照表
| 你的硬件档位 | 上下文窗口 | 永久层预算上限 | 预计可加载文件数 |
|-------------|-----------|--------------|----------------|
| T1 (≤16GB) | 16K tokens | ≤8KB | 2-3 个 (P0 only) |
| T2 (17-32GB) | 24K tokens | ≤15KB | 3-4 个 (P0 + 部分 P1) |
| T3 (33-48GB) | 32K tokens | ≤20KB | 4-5 个 (P0 + 全部 P1) |
| T4 (49-64GB) | 48K tokens | ≤30KB | 5-7 个 (P0 + P1 + 部分 P2) |
| T5 (≥65GB) | 64K+ tokens | ≤50KB | 7+ 个 (全量加载) |
```

**验证标准**:
- [ ] AGENTS.md §3 支持动态解析永久层文件列表（受 Context Budget 限制）
- [ ] 初始化时自动检测 AI_CONTEXT_MAP.md 并根据预算决定加载策略
- [ ] 初始化时自动检测 AI_PROGRESS_MAP.md 并根据预算决定加载策略（超出则降级为 Stable Layer）
- [ ] T1-T2 档位自动限制永久层大小（≤8KB / ≤15KB）
- [ ] 用户可手动添加/移除永久层文件（不受自动检测影响）
- [ ] File Read/Write Order 支持动态加载顺序和预算标注
- [ ] 超出预算的文件正确降级为 Stable Layer（按需加载）

**关键行为**:
- T1 用户：永久层仅包含 P0 文件（AGENTS.md + MODEL_CONFIG.md + PROJECT_CONTEXT_FILE），AI_PROGRESS_MAP.md 自动降级为 Stable Layer
- T2 用户：永久层包含 P0 + 首个 P1 文件，第二个及以后的 P1 文件降级为 Stable Layer
- T3+ 用户：可加载全部 P0 + P1 文件，P2 文件按需降级
- 所有档位：用户手动添加的文件始终保留在永久层（不受预算限制）

---

#### P1-3: 合规检查脚本集成到技能初始化流程

**来源**: check-compliance-analysis Dir 2 (P1)
**核心问题**: 当前技能初始化时 AI 手动检查文件存在性，没有量化评分。check-compliance.sh 可以提供合规评分作为决策依据。

**改动范围**: SKILL.md 一处
- Merge Mode 章节 (L133-L185)

**实施步骤**:

```
Step 1: 在 Merge Mode 流程中增加 "Optional: Run Compliance Check" 步骤
Step 2: 定义基于评分的初始化策略
Step 3: 在输出中显示合规评分和改进建议
```

**具体代码变更**:

在 Merge Mode Step 2（目录扫描）和 Step 3（展示计划）之间插入：

```markdown
**Step 2.5 — Optional: Run Compliance Check:**
After inventorying existing files, TRAE MAY run `check-compliance.sh` (if present):

```bash
bash check-compliance.sh . all
```

Based on the score:
| Score | Strategy |
|-------|----------|
| ≥80% | High compliance. Only supplement truly missing files. Suggest Shell Mode if equivalents detected. |
| ≥60% | Basic compliance. Supplement missing core files + optimize existing ones. |
| ≥40% | Partial compliance. Recommend regenerating the standard framework, preserving existing source code. |
| <40% | Low compliance. Full initialization recommended. Merge existing docs where possible. |

When check-compliance.sh is NOT present, TRAE proceeds with manual inspection as before.
```

**验证标准**:
- [ ] 脚本存在时，初始化流程自动调用并获得评分
- [ ] 不同评分段（≥80% / ≥60% / ≥40% / <40%）触发不同的初始化策略
- [ ] 脚本不存在时，正常降级为手动检查
- [ ] 输出中包含合规评分和具体改进建议

---

### P2 级：锦上添花（提升精度和灵活性）

#### P2-1: Context Budget Guide 嵌入技能

**来源**: vs-analysis §6.4 (MEDIUM)
**核心问题**: 当前技能没有内建的 Context Budget Guide。森林之子项目实践出了 Small/Medium/Large 三级预算指南（15-25KB / 30-50KB / 50-70KB），这是一个有价值的实践。

**改动范围**: SKILL.md 一处
- "全局物理硬件与内存红线" 章节中 (L244-L483)

**实施步骤**:

```
Step 1: 在 "Circuit Breaker Isolation Thresholds" 后新增 "Context Budget Guide" 子章节
Step 2: 定义 Small/Medium/Large 三级预算
Step 3: 与 T1-T5 策略联动
Step 4: 提供任务级预算示例
```

**具体代码变更**:

在 L456（"When token budget is exceeded:"）之后插入：

```markdown
### Context Budget Guide (上下文预算指南 — NEW in v1.9)

When loading documents for a specific task, TRAE MUST estimate and respect the
context budget. This guide maps task size → recommended KB range → file loading strategy.

| Task Budget Tier | KB Range | Typical Task | Loading Strategy |
|-----------------|----------|-------------|------------------|
| **Small** | 15-25 KB | Single method fix, config change, typo | Load 1 file, exact line range only |
| **Medium** | 30-50 KB | New component, refactor single module | Load PRD section (line range) + 1-2 reference files |
| **Large** | 50-70 KB | New feature across modules, architecture refactor | Load PRD + engineering specs (line ranges) + data model excerpt |

**Budget calculation formula:**
```
Estimated Load = file_size × (lines_needed / total_lines) + reference_file_sizes
```

If Estimated Load exceeds the current tier's token budget, TRAE MUST:
1. Narrow the line range further
2. Split the task into sub-steps (each fitting within budget)
3. Ask user for more precise file paths

**T1-T5联动：**
| Tier | Small Task Budget | Medium | Large |
|------|-------------------|--------|-------|
| T1 (≤16GB) | As table above | Not recommended — split task | ❌ Not available |
| T2 (17-32GB) | As table above | As table above | Split into 2+ Medium tasks |
| T3 (33-48GB) | As table above | As table above | As table above |
| T4 (49-64GB) | As table above | As table above | As table above (80KB extended) |
| T5 (≥65GB) | As table above | As table above | As table above (100KB extended) |

**初始化时按项目规模自动调整：**
| Project Scope | Default Budget Tier |
|---------------|-------------------|
| `"mvp"` | Small only (15-25KB); skip Medium/Large |
| `"small"` | Small + Medium (15-50KB) |
| `"full"` | All three tiers (15-70KB) |
```

**验证标准**:
- [ ] Context Budget Guide 在初始化时根据项目规模自动设置
- [ ] Small/Medium/Large 三级预算值合理
- [ ] T1-T5 联动正确（低内存禁止 Large 任务）
- [ ] 超预算时 TRAE 自动窄化范围或拆分任务

---

#### P2-2: check-compliance.sh 语义匹配增强

**来源**: check-compliance-analysis Dir 3 (P2)
**核心问题**: check-compliance.sh 使用 `grep -qi "keyword"` 进行精准关键词匹配，不理解语义等价（如 "L1/L2/L3" 和 "永久层/稳定层/工作层" 等价）。

**改动范围**: check-compliance.sh 一处
- 所有 `grep -qi` 检查

**实施步骤**:

```
Step 1: 为每个检查项定义多个关键词变体（中/英文）
Step 2: 使用正则表达式进行更灵活的匹配
Step 3: 支持中文和英文关键词的等价匹配
```

**具体代码变更**:

将现有的单关键词匹配改为多变体匹配。例如 `check_context_layers()` (L132-L173)：

```bash
# 优化前:
grep -qi "L1" "${PROJECT_DIR}/PROJECT_CONTEXT.md"

# 优化后: 增加脚本级辅助函数
check_semantic_match() {
    local file="$1"
    local pattern="$2"  # 竖线分隔的多变体模式
    local description="$3"
    
    IFS='|' read -ra VARIANTS <<< "${pattern}"
    for variant in "${VARIANTS[@]}"; do
        if grep -qi "${variant}" "${PROJECT_DIR}/${file}" 2>/dev/null; then
            echo -e "    ${GREEN}✓${NC} 内容包含: ${description} [匹配: ${variant}]"
            return 0
        fi
    done
    
    echo -e "    ${YELLOW}⚠${NC} 内容缺失: ${description}"
    return 1
}

# 使用示例:
check_semantic_match "PROJECT_CONTEXT.md" \
    "L1\|永久层\|permanent layer\|项目记忆\|project memory" \
    "Context 分层标识 (L1/永久层)"
check_semantic_match "PROJECT_CONTEXT.md" \
    "L2\|稳定层\|stable layer\|任务上下文\|task context" \
    "Context 分层标识 (L2/稳定层)"
check_semantic_match "PROJECT_CONTEXT.md" \
    "L3\|工作层\|working layer\|临时数据\|temporary data" \
    "Context 分层标识 (L3/工作层)"
```

同样的逻辑应用于:
- AGENTS.md 关键词检查（L107-L120）
- Context Budget Guide 检查
- Verified Immutable Constraints 检查
- 维护指令检查（L165）

**验证标准**:
- [ ] 中文 "永久层" 和英文 "permanent layer" 均能匹配
- [ ] "L1" 和 "永久层" 等价匹配成功
- [ ] 语义匹配不影响精确匹配的性能
- [ ] 所有语义变体列表完整且合理

---

#### P2-3: check-compliance.sh 可选插件化

**来源**: check-compliance-analysis Dir 4 (P3)
**核心问题**: 脚本是独立工具，用户需要手动执行。应嵌入技能流程中，作为可选步骤。

**改动范围**: 两个文件
- SKILL.md — 多处增加脚本调用引导
- check-compliance.sh — 增加退出码和 JSON 输出模式

**实施步骤**:

```
Step 1: check-compliance.sh 增加 --json 输出模式
Step 2: check-compliance.sh 增加退出码映射（0=≥80%, 1=≥60%, 2=≥40%, 3=<40%）
Step 3: SKILL.md 的 Quick Reference 增加 /check-compliance 命令
Step 4: SKILL.md 的 Auto-Trigger Actions 增加合规检查触发
```

**具体代码变更 — check-compliance.sh**:

```bash
# ── 新增: JSON 输出模式 ───
if [ "${3:-}" = "--json" ]; then
    print_json_summary() {
        total_score=$(( (total_passed * 100) / max_score ))
        cat <<EOF
{
  "score": ${total_score},
  "level": "$([ ${total_score} -ge 80 ] && echo 'high' || [ ${total_score} -ge 60 ] && echo 'basic' || [ ${total_score} -ge 40 ] && echo 'partial' || echo 'low')",
  "core":    {"passed": ${CORE_PASSED},  "total": ${CORE_TOTAL}},
  "context": {"passed": ${CONTEXT_PASSED}, "total": ${CONTEXT_TOTAL}},
  "hardware":{"passed": ${HARDWARE_PASSED},"total": ${HARDWARE_TOTAL}},
  "maintenance":{"passed": ${MAINTENANCE_PASSED},"total": ${MAINTENANCE_TOTAL}},
  "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
EOF
    }
    # Exit code mapping
    if [ ${total_score} -ge 80 ]; then exit 0
    elif [ ${total_score} -ge 60 ]; then exit 1
    elif [ ${total_score} -ge 40 ]; then exit 2
    else exit 3
    fi
fi
```

**具体代码变更 — SKILL.md Quick Reference**:

在 Quick Reference 表格（L1092-L1111）中追加：

```
| Check compliance | "/check-compliance" → run check-compliance.sh; "/check-compliance --detail" → detailed report |
| Auto-fix gaps | "/check-compliance --fix" → auto-generate missing core files |
```

**验证标准**:
- [ ] `check-compliance.sh . all --json` 输出有效 JSON
- [ ] 退出码 0/1/2/3 正确映射到四个合规等级
- [ ] /check-compliance 命令被 SKILL.md Quick Reference 收录
- [ ] Auto-Trigger Actions 中包含合规检查触发

---

### P3 级：长期优化（维护和体验改进）

#### P3-1: 已验证知识固化机制

**来源**: vs-analysis §6.5 (LOW)
**核心问题**: 经过多次对话后，某些设计决策和工程约定已经是"验证过的真理"，但它们散落在各个文档中。后续对话重复验证这些约束，浪费上下文。

**改动范围**: SKILL.md 两处
- "Module Summary Mechanism" 章节 (L758-L772)
- "Decision Log Management" 章节 (L775-L802)

**实施步骤**:

```
Step 1: 在 Module Summary Mechanism 中增加 "提取已验证约束" 步骤
Step 2: 在 Decision Log Management 中增加 "约束升级为不可变" 流程
Step 3: 在 AGENTS.md 模板中增加 "§X 已验证的不可变约束" 占位符
Step 4: 定义约束复审周期（季度检查）
```

**具体代码变更**:

在 "Module Summary Mechanism" 的 Actions（L764-L771）中追加：

```
4. Extract Verified Immutable Constraints:
   When generating CONTINUE/<module>-summary.md, TRAE MUST also scan for:
   - Architectural decisions that survived 3+ review cycles without change
   - Design patterns that were consistently applied across modules
   - Technical constraints proven by compilation/testing success
   
   If ≥3 verified decisions are found for this module, write them to:
   `AGENTS.md §X Verified Immutable Constraints`
   
   Format:
   ```markdown
   ### VIC-001: [Constraint Title]
   - **Module:** [source module]
   - **Verified:** YYYY-MM-DD (after [N] review cycles, [M] test passes)
   - **Rule:** [one-sentence immutable constraint]
   - **Rationale:** [why this cannot change without major redesign]
   - **Next Review:** YYYY-MM-DD (+90 days)
   ```
```

**验证标准**:
- [ ] 模块完成后自动提取设计决策并写入 AGENTS.md §X
- [ ] 后续对话正确引用已验证约束，无需重复验证
- [ ] 季度复审触发约束有效性检查
- [ ] 用户可手动推翻/更新已验证约束

---

#### P3-2: check-compliance.sh 动态趋势追踪

**来源**: check-compliance-analysis Dir 5 (P4)
**核心问题**: 当前脚本每次运行输出当前评分，没有历史趋势。无法判断项目合规性是在改善还是恶化。

**改动范围**: check-compliance.sh 一处
- `print_summary()` 函数

**实施步骤**:

```
Step 1: 在脚本中增加读写 .compliance_history 文件的能力
Step 2: 每次运行时追加当前评分到历史文件
Step 3: 读取上次评分并计算趋势
Step 4: 在输出中显示趋势箭头和变化量
```

**具体代码变更**:

```bash
# ── Trend Tracking (NEW in v2.1) ───
COMPLIANCE_HISTORY="${PROJECT_DIR}/.compliance_history"

record_and_trend() {
    local current_score=$1
    local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    
    # Read last score
    local prev_score=""
    local prev_date=""
    if [ -f "${COMPLIANCE_HISTORY}" ]; then
        prev_score=$(tail -1 "${COMPLIANCE_HISTORY}" | awk '{print $1}')
        prev_date=$(tail -1 "${COMPLIANCE_HISTORY}" | awk '{print $2}')
    fi
    
    # Append current
    echo "${current_score} ${timestamp}" >> "${COMPLIANCE_HISTORY}"
    
    # Show trend
    if [ -n "${prev_score}" ] && [ -n "${prev_date}" ]; then
        local diff=$((current_score - prev_score))
        if [ ${diff} -gt 0 ]; then
            echo -e "  ${GREEN}趋势: ↑ +${diff}%${NC} (上次: ${prev_score}%, ${prev_date})"
        elif [ ${diff} -lt 0 ]; then
            echo -e "  ${RED}趋势: ↓ ${diff}%${NC} (上次: ${prev_score}%, ${prev_date})"
        else
            echo -e "  ${YELLOW}趋势: → 持平${NC} (上次: ${prev_score}%, ${prev_date})"
        fi
    fi
}
```

**验证标准**:
- [ ] 每次运行追加评分到 .compliance_history
- [ ] 趋势箭头正确（↑ 上升 / ↓ 下降 / → 持平）
- [ ] .compliance_history 格式可读且不爆炸增长
- [ ] 首次运行无历史时显示 "首次检查，无历史记录"

---

#### P3-3: 合规检查自然语言指令嵌入

**来源**: check-compliance-analysis Dir 6 (P5)
**核心问题**: 用户需要手动运行脚本。应支持对话中触发，且使用自然语言而非命令行格式。

**改动范围**: SKILL.md 一处
- "Quick Reference: All Interaction Commands" 表格

**实施步骤**:

```
Step 1: 在 Quick Reference 表格中增加合规检查自然语言指令（4种场景）
Step 2: 在 Auto-Trigger Actions 中增加合规检查触发时机
Step 3: 确保所有指令使用自然语言表达（非 /command 格式）
```

**具体代码变更**:

在 Quick Reference 表格（L1092-L1111）后追加：

```markdown
| 场景 | 用户自然语言指令示例 | 说明 |
|------|-------------------|------|
| **检查项目合规状态** | "检查一下项目的合规情况" 或 "当前项目符合标准框架吗？" | 运行 check-compliance.sh，显示总评分（0-100%）和缺失文件列表 |
| **查看详细报告** | "显示详细的合规检查报告" 或 "帮我看看项目文档缺哪些部分" | 分阶段（核心文件 / Context 生命周期 / 硬件自适应 / 维护机制）展示详细报告 |
| **自动修复缺失** | "帮我补齐缺失的合规文件" 或 "自动修复项目文档缺口" | 自动检测并生成缺失的核心文件，显示修复前后的评分对比 |
| **查看历史趋势** | "看看合规评分的历史变化" 或 "显示项目文档的改进趋势" | 读取 .compliance_history，展示评分趋势箭头（↑ 上升 / ↓ 下降 / → 持平） |
```

在 "Auto-Trigger Actions" 表格（L1029-L1041）中追加：

```markdown
| 用户询问合规状态（自然语言） | 运行 check-compliance.sh，显示评分 + 趋势 + 改进建议 |
| 用户请求自动修复（自然语言） | 检测并生成缺失核心文件，重新运行检查，显示修复前后对比 |
| 完成重要模块后（自动检测） | 可选运行合规检查，提示用户是否更新评分 |
```

**验证标准**:
- [ ] 用户使用自然语言（如"检查一下项目的合规情况"）可触发脚本运行并显示评分
- [ ] 用户使用自然语言（如"显示详细的合规检查报告"）可触发分阶段详细报告
- [ ] 用户使用自然语言（如"帮我补齐缺失的合规文件"）可触发自动修复并显示修复前后对比
- [ ] 用户使用自然语言（如"看看合规评分的历史变化"）可触发历史趋势查看
- [ ] 所有指令不使用 `/command` 格式，完全采用自然语言对话风格
- [ ] 完成重要模块后，系统可自动提示用户是否运行合规检查

**关键设计原则**:
- 不使用 `/check-compliance` 等命令行格式，避免用户记忆特殊语法
- 支持多种自然语言表达（如"检查一下" / "帮我看看" / "显示"等）
- 与现有启动语风格一致（如"当前项目的开发进度如何？"/ "显示当前项目健康仪表板"）

---

## 三、实施路线图

### Phase 1: P0 级（最高优先级，3 天）

| 编号 | 改动项 | 目标文件 | 预计改动行 | 依赖 |
|------|-------|---------|-----------|------|
| P0-1-SKILL | Shell Mode + 功能等价映射表 | SKILL.md L133-L185 | ~80 行新增 | 无 |
| P0-1-SCRIPT | check_function_exists() 改造 | check-compliance.sh | ~40 行替换 | 无 |

**Phase 1 完成标准**:
- [ ] SKILL.md Merge Mode 支持 Shell Mode 和功能等价检测
- [ ] check-compliance.sh 正确评分 AI_CONTEXT_MAP.md / AI_PROGRESS_MAP.md 项目
- [ ] 森林之子项目使用 Shell Mode 初始化后，合规评分 ≥80%
- [ ] 版本号升级至 v1.9

### Phase 2: P1 级（强烈建议，4 天）

| 编号 | 改动项 | 目标文件 | 预计改动行 | 依赖 | 状态 |
|------|-------|---------|-----------|------|------|
| P1-1 | 游戏项目差异化内容 | SKILL.md L188-L239 + L978-L986 | ~60 行新增 | 无 | ✅ 已完成 |
| P1-2 | Always Load 自定义 | SKILL.md L835-L854 + L1063-L1078 | ~40 行修改 | P0-1 | ✅ 已完成 |
| P1-3 | 合规脚本初始化集成 | SKILL.md L133-L185 | ~30 行新增 | P0-1 | ✅ 已完成 |

**Phase 2 完成标准**:
- [x] Unity/Unreal 项目初始化生成游戏专属 AGENTS.md 模板 (§G1-G4 + HC-014~HC-017)
- [x] AGENTS.md §3 永久层支持动态多文件 + T1-T5 预算映射 + 6步调度算法
- [x] 初始化流程中可选运行合规检查并获得评分驱动策略
- [x] 版本号升级至 v1.9.2

### Phase 3: P2 级（锦上添花，2 天）

| 编号 | 改动项 | 目标文件 | 预计改动行 | 依赖 |
|------|-------|---------|-----------|------|
| P2-1 | Context Budget Guide | SKILL.md L456 之后 | ~50 行新增 | 无 |
| P2-2 | 脚本语义匹配增强 | check-compliance.sh | ~50 行替换 | P0-1-SCRIPT |
| P2-3 | 脚本可选插件化 | SKILL.md + check-compliance.sh | ~40 行新增 | P1-3 |

**Phase 3 完成标准**:
- [ ] Context Budget Guide 在初始化时根据项目规模自动设置
- [ ] 语义匹配识别中文/英文关键词变体
- [ ] check-compliance.sh 支持 --json 输出
- [ ] 版本号升级至 v1.9.2

### Phase 4: P3 级（长期优化，3 天）

| 编号 | 改动项 | 目标文件 | 预计改动行 | 依赖 |
|------|-------|---------|-----------|------|
| P3-1 | 已验证知识固化 | SKILL.md L758-L802 | ~40 行新增 | 无 |
| P3-2 | 动态趋势追踪 | check-compliance.sh | ~30 行新增 | P2-3 |
| P3-3 | /check-compliance 指令 | SKILL.md L1092-L1111 | ~15 行新增 | P2-3 |

**Phase 4 完成标准**:
- [ ] 模块完成后自动提取已验证约束并写入 AGENTS.md
- [ ] .compliance_history 趋势正确追踪
- [ ] /check-compliance 命令可在对话中触发
- [ ] 版本号升级至 v1.9.3

---

## 四、风险评估与缓解措施

### 风险 1: Shell Mode 误判（中等概率，高影响）

**描述**: P0-1 的功能等价检测可能将不完整的自有文档误判为等价物，导致标准文件未创建而自有文档也不够用。

**缓解措施**:
- 功能等价检测设置 ≥2 个信号（如 AI_CONTEXT_MAP.md 必须包含 P0/P1/P2 标注才算"合格等价物"）
- Shell Mode 进入前必须用户确认
- 提供 `--force-full` 覆盖选项

### 风险 2: 游戏项目检测误判（低概率，低影响）

**描述**: P1-1 的游戏项目检测可能将非游戏 C# 项目误判为 Unity 游戏项目。

**缓解措施**:
- 同时检测 .cs + .unity 文件（双重信号）
- 允许用户手动覆盖项目类型
- 提供 "强制使用标准模板" 的选项

### 风险 3: check-compliance.sh JSON 输出与 Shell 兼容性（低概率，低影响）

**描述**: P2-3 新增的 --json 模式在旧版 bash（<4.0）上可能不工作。

**缓解措施**:
- 检查 bash 版本，<4.0 时降级为纯文本模式
- JSON 模式不是默认行为，需要显式指定 --json

---

## 五、预期效果总览

| 指标 | 当前 (v1.8) | Phase 1 后 (v1.9) | Phase 2 后 (v1.9.2) | Phase 4 后 (目标) |
|------|-----------|-----------|-----------|-----------|
| Merge Mode 灵活性 | 低（固定目录结构） | 高（Shell Mode） | 高 | 高 |
| 游戏项目支持 | 低（通用模板） | 低 | **高（§G1-G4 + HC-014~HC-017 + 专属职责类型）** | 高 |
| 自有文档尊重 | 低（不识别等价物） | 高（功能等价检测） | 高 | 高 |
| 永久层灵活性 | 低（固定3文件） | 低 | **高（T1-T5 动态调度 + 6步算法 + 预算保护）** | 高 |
| Context Budget | 无 | 无 | **高（S/M/L 三级 + T1-T5 联动）** | 高 |
| 合规检查自动化 | 无 | 中（独立脚本） | **高（初始化集成 + 评分驱动策略）** | 高（对话触发+趋势） |
| 森林之子合规评分 | ~25% | ≥80% | ≥90% | ≥95% |

---

**方案制定**: TRAE Agent
**数据来源**: `ai-collab-workflow-vs-project-analysis.md` (406 行) + `check-compliance-analysis.md` (266 行) + `SKILL.md` v1.8 (1131 行) + `check-compliance.sh` (330 行)
**项目路径**: `/Users/heinzheydrich/Downloads/AI制作项目/模型测试/.trae/skills/ai-collab-workflow/`
