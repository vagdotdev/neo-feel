#!/usr/bin/env bash
# Install neo-feel for the user running this script.
#   ./install.sh           command + ~/.agents skill
#   ./install.sh --claude  also ~/.claude/skills/neo-feel
#   ./install.sh --cursor  also ~/.cursor/skills/neo-feel
#   ./install.sh --grok    also ~/.grok/skills/neo-feel
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
BIN="${HOME}/.local/bin"
mkdir -p "$BIN"
install -m 755 "$ROOT/neo-feel" "$BIN/neo-feel"

install_skill() {
  local dest="$1"
  mkdir -p "$dest"
  cp "$ROOT/SKILL.md" "$dest/SKILL.md"
  cp "$ROOT/neo-feel" "$dest/neo-feel"
  chmod 755 "$dest/neo-feel"
}

install_skill "${HOME}/.agents/skills/neo-feel"
case "${1:-}" in
  --claude) install_skill "${HOME}/.claude/skills/neo-feel" ;;
  --cursor) install_skill "${HOME}/.cursor/skills/neo-feel" ;;
  --grok) install_skill "${HOME}/.grok/skills/neo-feel" ;;
  "") ;;
  *) echo "usage: ./install.sh [--claude|--cursor|--grok]" >&2; exit 2 ;;
esac

echo "installed ${BIN}/neo-feel"
echo "if that directory is not on PATH: export PATH=\"\$HOME/.local/bin:\$PATH\""
