#!/usr/bin/env bash

set -u

INPUT="$(cat)"

# --------------------------------------------------
# Claude event
# --------------------------------------------------

EVENT="$(printf '%s' "$INPUT" |
  grep -o '"hook_event_name":"[^"]*"' |
  cut -d'"' -f4)"

NOTIFICATION_TYPE="$(printf '%s' "$INPUT" |
  grep -o '"notification_type":"[^"]*"' |
  cut -d'"' -f4)"

# --------------------------------------------------
# Only work inside tmux
# --------------------------------------------------

if [ -z "${TMUX:-}" ]; then
  exit 0
fi

# Claude Code 所在的 pane
PANE="$TMUX_PANE"

if [[ -z "$PANE" ]]; then
  exit 0
fi

# 从 Claude 所在 pane 获取 session / window
TARGET="$(tmux display-message -p -t "$PANE" '#S:#I')"
WINDOW_NAME="$(tmux display-message -p -t "$PANE" '#W')"
SESSION="$(tmux display-message -p -t "$PANE" '#S')"
CURRENT="$(tmux display-message -p '#S:#I')"

# --------------------------------------------------
# Notification message
# --------------------------------------------------

case "$EVENT" in

Notification)
  case "$NOTIFICATION_TYPE" in
  permission_prompt)
    TITLE="Claude Code"
    MESSAGE="🔐 ${SESSION} / ${WINDOW_NAME}: 需要确认"
    ;;

  idle_prompt)
    TITLE="Claude Code"
    MESSAGE="⌨️ ${SESSION} / ${WINDOW_NAME}: 等待输入"
    ;;

  *)
    exit 0
    ;;
  esac
  ;;

Stop)
  TITLE="Claude Code"
  MESSAGE="✅ ${SESSION} / ${WINDOW_NAME}: 任务完成"
  ;;

StopFailure)
  TITLE="Claude Code"
  MESSAGE="❌ ${SESSION} / ${WINDOW_NAME}: 执行出错"
  ;;

*)
  exit 0
  ;;
esac

# --------------------------------------------------
# Mark tmux window
# --------------------------------------------------

# 在目标 tmux window 上设置通知标记
if [[ "$CURRENT" != "$TARGET" ]]; then
  tmux set-window-option -t "$TARGET" @claude_notify 1
fi

# --------------------------------------------------
# Windows Toast
# --------------------------------------------------

powershell.exe -NoProfile -Command "
Import-Module BurntToast;
New-BurntToastNotification -Text '$TITLE', '$MESSAGE'
" >/dev/null 2>&1 &
