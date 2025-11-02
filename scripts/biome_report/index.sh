
set -eu

echo "[1/2] Biomeの実行とJSON抽出"
./scripts/biome_report/run_biome.sh

echo "[2/2] Issue本文の生成"
./scripts/biome_report/generate_issue_body.sh

echo "success: Biome Lint Report generated"