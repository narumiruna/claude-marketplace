#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
source_dir="$repo_root/skills/"

targets=("$HOME/.codex/skills/")

if ! command -v rsync >/dev/null 2>&1; then
  os_name=$(uname -s 2>/dev/null || echo "unknown")
  case "$os_name" in
    Darwin)
      echo "Error: rsync not found. Install it with 'brew install rsync' on macOS." >&2
      ;;
    Linux)
      echo "Error: rsync not found. Install it with your package manager (e.g., 'sudo apt-get install rsync', 'sudo dnf install rsync', or 'sudo pacman -S rsync')." >&2
      ;;
    *)
      echo "Error: rsync not found. Install it with your system package manager." >&2
      ;;
  esac
  exit 1
fi

for target in "${targets[@]}"; do
  mkdir -p "$target"
  rsync -a --delete \
    --exclude ".git/" \
    --exclude "__pycache__/" \
    "$source_dir" "$target"
done

echo "Synced $source_dir to:"
printf '  - %s\n' "${targets[@]}"
