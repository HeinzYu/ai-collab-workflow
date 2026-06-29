# Full-Stack Project Rules & AI Behavior Guidelines

## ⚠️ 全局物理硬件与内存红线 (Device-Adaptive OOM Prevention)
- **硬件自适应感知 (CRITICAL)**: 
  - 本项目采用本地双模型工作流，对运行内存极其敏感。
  - AI 代理在首次运行或执行大上下文任务前，**必须首先读取当前系统环境（System Env/Terminal）自动感知当前主机的物理统一内存（Unified Memory）大小**。
- **动态检索深度与断路阈值 (Adaptive Scoping)**:
  - **若当前设备内存 <= 32GB**: 必须采取极致保守策略。**严格禁止**跨模块检索，单次对话上下文总量严禁超过 **24K tokens**。处理客户端任务时绝对不可读取后端，处理后端任务时不可读取客户端。
  - **若当前设备内存 == 48GB**: 保持标准平衡策略。单次上下文上限为 **50K tokens**，采用前/后端沙盒隔离（写 iOS 不读 api/，写 api/ 不读 Sources/）。
  - **若当前设备内存 >= 64GB**: 允许激进策略。单次上下文放宽至 **80K tokens**，允许合理的跨模块跨目录全局扫描（如 presets/）。
- **静态大目录物理黑名单**: 无论在何种设备上，**严禁**盲目递归扫描 `presets/` 目录，除非用户主动在当前对话框中将具体 preset 文件添加为上下文。

## 📂 模块目录与技术栈映射 (Module Architecture)

### 1. iOS 原生客户端 (Sources/AppComponents/)
- **技术栈**: iOS 16+ / SwiftUI 声明式布局 / TCA (The Composable Architecture) 状态管理。
- **规范**: 严格对齐 Apple HIG 规范；动效统一采用 `Animation.spring(damping: 0.7, duration: 0.3s)`；触觉反馈采用 `UIImpactFeedbackGenerator`；图片加载采用 `Nuke`。

### 2. 后端 API 服务 (api/)
- **技术栈**: Node.js / TypeScript / 异步路由控制器。
- **规范**: 必须包含完善的错误捕获机制（Try-Catch），返回标准的 JSON 格式响应。

### 3. 数据库层 (prisma/)
- **技术栈**: Prisma ORM / PostgreSQL。

## 🤖 智能双子星分工法则 (Model Routing)
- **事情 A（需求/设计/重构/Debug）**: 提示或引导用户切换至 **Gemma 4 (Thinking 模式)**。利用其多面思维链处理复杂的业务边界、HIG 核对、并发死锁及代码报错。
- **事情 B（全量代码编写/轰炸）**: 使用 **Qwen 3.6**。利用其高吞吐优势，根据既定文档，快速产出全量、闭合的代码文件。

## 📝 代码交付标准 (Output Standards)
- **严禁偷懒**: 必须输出结构完整、可直接编译/运行的代码。严禁使用 `// ... 保持原样` 或省略号进行伪代码截断。
- **文档沉淀**: 产品设计的阶段性产出（如异常文案、交互流程）必须本地持久化保存至 `交互流程/` 目录下。