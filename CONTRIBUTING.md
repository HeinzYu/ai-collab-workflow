# Contributing to ai-collab-workflow

感谢你考虑为 ai-collab-workflow 做贡献！无论是报告问题、提出改进建议还是提交代码，我们都非常欢迎。

*Thank you for considering contributing to ai-collab-workflow! Bug reports, feature suggestions, and code contributions are all welcome.*

---

## 行为准则 / Code of Conduct

本项目遵循贡献者公约。参与即表示你同意遵守其条款。  
*This project follows the Contributor Covenant. By participating, you agree to abide by its terms.*

基本规则 / *Basic rules*:
- 使用友好和包容的语言 / *Use welcoming and inclusive language*
- 尊重不同的观点和经验 / *Be respectful of differing viewpoints*
- 优雅地接受建设性批评 / *Accept constructive criticism gracefully*
- 关注对社区最有利的事情 / *Focus on what is best for the community*

---

## 如何贡献 / How to Contribute

### 报告 Bug / Reporting Bugs

如果你发现了 bug，请通过 GitHub Issues 提交，并包含以下信息：

*If you find a bug, please submit it via GitHub Issues with:*

- **标题 / Title**：简短描述问题 / *Brief description of the issue*
- **描述 / Description**：详细说明问题现象 / *Detailed explanation of what happened*
- **复现步骤 / Steps to reproduce**：
  1. 使用哪个版本的模板框架 / *Which version of the template*
  2. 执行了什么操作 / *What actions were taken*
  3. 预期结果 vs 实际结果 / *Expected vs actual result*
- **环境信息 / Environment**：AI Agent 类型、操作系统等 / *AI Agent type, OS, etc.*

### 提出功能建议 / Feature Suggestions

功能建议同样通过 GitHub Issues 提交：

*Feature suggestions are also submitted via GitHub Issues:*

- **描述你希望解决的问题** / *Describe the problem you want to solve*
- **描述你期望的解决方案** / *Describe your proposed solution*
- **描述你考虑过的替代方案** / *Describe alternatives you've considered*
- **如果是新增补充章节**，请参考 [SUPPLEMENTARY/README.md](TEMPLATE_FRAMEWORK/SUPPLEMENTARY/README.md) 的格式规范 / *For new supplementary chapters, refer to the format in SUPPLEMENTARY/README.md*

### 提交代码 / Submitting Code (Pull Request)

1. **Fork** 本仓库 / *Fork this repository*
2. **Clone** 你的 fork 到本地 / *Clone your fork locally*
3. 创建新分支 / *Create a new branch*：
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. 做出你的修改 / *Make your changes*
5. 确保你的修改符合规范 / *Ensure your changes follow the conventions*（见下文）
6. 提交并推送 / *Commit and push*：
   ```bash
   git commit -m "feat: add your feature description"
   git push origin feature/your-feature-name
   ```
7. 在 GitHub 上创建 Pull Request / *Create a Pull Request on GitHub*

---

## 开发规范 / Development Conventions

### Commit Message 规范 / Commit Message Convention

本项目使用 [Conventional Commits](https://www.conventionalcommits.org/) 规范：

```
<type>(<scope>): <description>

[optional body]
```

类型 / *Types*：
| 类型 | 说明 |
|------|------|
| `feat` | 新功能 / New feature |
| `fix` | Bug 修复 / Bug fix |
| `docs` | 文档更新 / Documentation |
| `style` | 格式调整（不影响代码逻辑）/ *Formatting (no logic change)* |
| `refactor` | 重构 / Refactoring |
| `chore` | 构建/工具变更 / *Build/tooling changes* |

示例 / *Examples*:
```
feat(supplementary): add S05 omLX best practices chapter
fix(template-guide): remove duplicate FAQ entries
docs(readme): add English translations
```

### 文件命名规范 / File Naming Convention

- 核心文件使用大写 + 下划线：`AGENTS.md`, `PROJECT_CONTEXT.md`, `MODEL_CONFIG.md`
- 补充章节使用 `S` 前缀 + 两位数字：`S01-prompt-engineering.md`
- 目录名全大写：`PRD/`, `CONTINUE/`, `SUPPLEMENTARY/`

### 文档编写规范 / Documentation Style

- 补充章节必须遵循现有格式：标题层级（`# → ## → ###`）、结构（概述 → 章节内容 → "与补充章节的关系"）
- 新增章节必须在 `SUPPLEMENTARY/README.md` 中更新目录表
- 如果章节引用其他文档，使用相对路径链接
- 中文内容可以保留，但关键术语建议附加英文原文（如 "Context 生命周期（Context Lifecycle）"）

*Supplementary chapters must follow the existing format: heading hierarchy, structure (Overview → Content → Related Chapters section).*
*New chapters must be added to the table of contents in SUPPLEMENTARY/README.md.*
*Chinese content may be kept, but key terms should include English equivalents.*

---

## 项目结构 / Project Structure

```
ai-collab-workflow/
├── README.md                  ← 项目首页 / Project homepage
├── LICENSE                    ← MIT 协议
├── CHANGELOG.md               ← 变更记录
├── CONTRIBUTING.md            ← 本文件 / This file
├── .gitignore
├── .github/
│   └── workflows/             ← CI 配置
├── AI-Development-Workflow.md ← 设计蓝图 / Design blueprint
└── TEMPLATE_FRAMEWORK/        ← 实际交付物 / Actual deliverable
    ├── AGENTS.md
    ├── PROJECT_CONTEXT.md
    ├── MODEL_CONFIG.md
    ├── ... (see STRUCTURE.md)
```

修改核心文件前，建议先阅读 `AI-Development-Workflow.md` 了解设计背景。  
*Before modifying core files, read AI-Development-Workflow.md to understand the design rationale.*

---

## 需要帮助？ / Need Help?

- **问题讨论**：在 GitHub Issues 中发起讨论 / *Open a discussion in GitHub Issues*
- **简单问题**：可以直接在 Issue 中用中文或英文提问 / *For simple questions, ask in Issues in Chinese or English*
- **设计决策**：参考 `AI-Development-Workflow.md` 了解框架的设计哲学 / *For design decisions, refer to AI-Development-Workflow.md*

---

感谢你的贡献！ 🎉  
*Thank you for your contribution!* 🎉
