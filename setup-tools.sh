#!/usr/bin/env bash
set -e

curl -fLo cs.gz https://github.com/coursier/coursier/releases/download/v2.1.0-M5-18-gfebf9838c/cs-x86_64-pc-linux.gz
gzip -d cs.gz
chmod +x cs
curl -fLo scala-cli.gz https://github.com/VirtusLab/scala-cli/releases/download/v0.1.3/scala-cli-x86_64-pc-linux.gz
gzip -d scala-cli.gz
chmod +x scala-cli
mkdir -p ~/bin
mv cs scala-cli ~/bin
export PATH="$HOME/bin:$PATH"
echo "Run"
echo "  export PATH=\"\$HOME/bin:\$PATH\""
