
set -eu

# tmp/biome.jsonのdiagnostics.pathとdiagnostics.messageを元にissue本文を生成

# Example of output markdown file
# ```md
# ## Lint Errors
# - src/index.ts: This variable unused is unused.
# ```

JSON_PATH="tmp/biome.json"
REPORT_PATH="tmp/biome_report.md"

if [ ! -f "$JSON_PATH" ]; then
echo "error: $JSON_PATH が見つかりません"
exit 1
fi

if ! jq -e . <"$JSON_PATH" >/dev/null 2>&1; then
echo "error: $JSON_PATH は不正なJSONです"
exit 1
fi

COUNT=$(jq -r '.diagnostics // [] | length' "$JSON_PATH")

{
if [ "$COUNT" -eq 0 ]; then
echo "No lint errors found."
else
echo "## Lint Errors" > "$REPORT_PATH"
jq -r '
.diagnostics // [] | .[] |
  ("- " + ((.location.path // .path) // "UNKNOWN_PATH") + ": " + ((.message // "") | gsub("\r?\n"; " ")))
' "$JSON_PATH"
fi
} >>"$REPORT_PATH"