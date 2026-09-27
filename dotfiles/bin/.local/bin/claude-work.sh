#!/bin/sh
export CLAUDE_CONFIG_DIR="$HOME/.claude-accounts/work"
exec claude "$@"
