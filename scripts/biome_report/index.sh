#!/usr/bin/env zsh

set -u

echo "[1/2] Biomeの実行とJSON抽出"
./scripts/biome_report/run_biome.sh || {
  echo "error: Biomeの実行またはJSON抽出で失敗しました。"
  exit 1
}

echo "[2/2] Issue本文の生成"
./scripts/biome_report/generate_issue_body.sh
GEN_EXIT=$?
if [[ $GEN_EXIT -eq 2 ]]; then
  echo "success: run Biome"
  exit 0
elif [[ $GEN_EXIT -ne 0 ]]; then
  echo "error: Issue本文の生成に失敗しました。"
  exit 1
fi

echo "success"