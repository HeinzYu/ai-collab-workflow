#!/bin/bash
# install.sh — 智能安装脚本

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/skills/ai-collab-workflow"

# 检测目标 Agent
if [ -d "$HOME/.claude" ]; then
    DEST="$HOME/.claude/skills/ai-collab-workflow"
    AGENT_NAME="Claude Code"
elif [ -d "$HOME/.trae" ]; then
    DEST="$HOME/.trae/skills/ai-collab-workflow"
    AGENT_NAME="TRAE"
else
    echo "未检测到支持的 Agent 环境。"
    echo "可用环境: Claude Code (~/.claude), TRAE (~/.trae)"
    exit 1
fi

echo "正在为 $AGENT_NAME 安装 ai-collab-workflow 至: $DEST ..."
mkdir -p "$DEST"

if [ -d "$SKILL_SRC" ]; then
    # 使用 cp -a 保持属性，并处理目录复制逻辑
    cp -a "$SKILL_SRC/." "$DEST/"
    echo "✅ 安装成功！现在您可以在 $AGENT_NAME 中使用 ai-collab-workflow 了。"
else
    echo "❌ 错误: 找不到技能源文件 $SKILL_SRC"
    exit 1
fi
