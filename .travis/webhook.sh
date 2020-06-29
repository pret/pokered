#!/bin/sh
set -e

root="$(readlink -e "$(dirname "$0")/..")"

# Report unnamed symbols
content="$("$root/tools/unnamed.py" -r "$root" "$root/pokered.sym" | head)"

curl -H 'Content-Type: application/json' -X POST "$POKERED_DISCORD_WEBHOOK_URL" -d@- << EOF
{
    "username": "$POKERED_DISCORD_WEBHOOK_USERNAME",
    "avatar_url": "$POKERED_DISCORD_WEBHOOK_AVATAR_URL",
    "content": "\`\`\`$(echo "$content" | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')\`\`\`"
}
EOF
