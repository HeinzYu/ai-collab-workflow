# SUPPLEMENTARY — 补充章节总览

> 本章为 ChatGPT 方案（AI-Development-Workflow.md）中有价值概念的详细实现，以补充章节形式融入现有系统。
> 这些章节在 AGENTS.md 和 PROJECT_CONTEXT.md 中已有简要引用，此处提供完整深度内容。

---

## 目录

| 编号 | 文件名 | 对应原章节 | 说明 |
|------|--------|-----------|------|
| S01 | `S01-prompt-engineering.md` | §8 Prompt Engineering Standard | 推荐/禁止Prompt模板、大型任务/Refactor/Review/Design Prompt全套模板库 |
| S02 | `S02-trae-best-practices.md` | §15 TRAE Best Practice | Rules/Memory/Workspace/Worktree/Context/Tool Call/Conversation 深度指南 |
| S03 | `S03-model-switching-decision-tree.md` | §13 Model Switching Strategy | 完整决策树：Gemma/Qwen/云端Claude/GPT的切换条件、上下文窗口约束检查、网络状态自适应 |
| S04 | `S04-long-term-project-strategy.md` | §16 Long-term Project Strategy | 3个月/半年/1年策略：AI如何持续理解项目、跨月恢复协议深度版、知识衰减曲线管理 |
| S05 | `S05-omlx-best-practices.md` | §14 oMLX Best Practice | Context/Memory/SSD Cache/Profile/Benchmark/Runtime/Memory Guard 完整指南 |
| S06 | `S06-agent-task-granularity.md` | §7 Agent Task Granularity | 任务粒度决策指南：不要做什么/应该怎么做、Apple App完整分解示例（分析→建模→UI→网络→动画→可访问性→测试→审查） |
| S07 | `S07-appendices.md` | 附录A-G | 目录模板/Prompt模板/Continue模板/Decision模板/DevLog模板/Apple Native Project模板/Game Project模板 |

---

## 使用方式

1. **新对话开始时**：TRAE 读取 AGENTS.md §1-15 了解基本规则
2. **遇到具体场景时**：根据 §10 快速参考指令中的场景描述，跳转到对应补充章节
3. **深度操作时**：补充章节提供完整的决策树、流程图和模板，可直接复制使用

### 快速跳转索引

| 场景 | 主文档章节 | 补充章节 |
|------|-----------|---------|
| "使用什么Prompt" | AGENTS.md §10 | S01-prompt-engineering.md |
| "如何配置TRAE" | AGENTS.md §6, §7 | S02-trae-best-practices.md |
| "该用哪个模型" | AGENTS.md §6, MODEL_CONFIG.md | S03-model-switching-decision-tree.md |
| "项目超过1个月怎么办" | PROJECT_CONTEXT.md §9 | S04-long-term-project-strategy.md |
| "本地模型性能调优" | MODEL_CONFIG.md | S05-omlx-best-practices.md |
| "任务怎么拆分" | AGENTS.md §7 | S06-agent-task-granularity.md |
| "需要模板文件" | STRUCTURE.md | S07-appendices.md |

---

## 与现有系统的关系

```
AI-Development-Workflow.md（ChatGPT方案 - 目录大纲）
    │
    ├── AGENTS.md（核心规则，始终详细）
    │   └── 引用补充章节：§11-15 有简要说明，详细见 SUPPLEMENTARY/
    │
    ├── PROJECT_CONTEXT.md（项目目标与架构）
    │   └── 引用补充章节：§9 有简要说明，详细见 SUPPLEMENTARY/
    │
    └── SUPPLEMENTARY/（补充章节 - 按需深度阅读）
        ├── S01-prompt-engineering.md
        ├── S02-trae-best-practices.md
        ├── S03-model-switching-decision-tree.md
        ├── S04-long-term-project-strategy.md
        ├── S05-omlx-best-practices.md
        ├── S06-agent-task-granularity.md
        └── S07-appendices.md
```
