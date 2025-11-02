
set -eu
BIOME_JSON="tmp/biome.json"

# 出力先ディレクトリを確実に作成
mkdir -p "$(dirname "$BIOME_JSON")"

# Biome実行（終了コードに関わらず続行してJSON解析を試みる）
npm run --silent biome:ci >"$BIOME_JSON" 2>/dev/null || true
echo "$(cat $BIOME_JSON)"

# JSONが正常に生成されていることを確認。jqで検証
if ! jq -e . <"$BIOME_JSON" >/dev/null 2>&1; then
  echo "error: Biome出力から正しいJSONを抽出できませんでした。"
  exit 1
fi