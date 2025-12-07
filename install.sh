#!/bin/zsh

# シンボリックリンクを貼るスクリプト

# dotfilesリポジトリの場所
DOTPATH=~/dotfiles

# .gitで終わるパスを除外
setopt no_match
for f in ${DOTPATH}/.??*~${DOTPATH}/.git; do
  # Windows対応: AppDataとvscodeの設定ファイルは除外
  [[ "$f" == "${DOTPATH}/AppData" ]] && continue
  [[ "$f" == "${DOTPATH}/vscode" ]] && continue

  # シンボリックリンクを作成
  ln -snfv "$f" "$HOME"
done
