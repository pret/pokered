#!/bin/sh
set -e

# Report unnamed symbols
content="$(tools/unnamed.py -r . pokered.sym | head)"

curl -H 'Content-Type: application/json' -X POST "$DISCORD_WEBHOOK_URL" -d@- << EOF
{
    "username": "OK",
    "avatar_url": "https://i.imgur.com/38BQHdd.png",
    "content": "\`\`\`$(echo "$content" | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')\`\`\`"
}
EOF
