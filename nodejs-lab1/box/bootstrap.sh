#!/usr/bin/env bash

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

which node npm >/dev/null &&
{ echo "Tools already installed"; exit 0; }

# install node.js
cd /opt
wget -q http://nodejs.org/dist/v0.10.15/node-v0.10.15-linux-x86.tar.gz
tar xvf node-v0.10.15-linux-x86.tar.gz
rm node-v0.10.15-linux-x86.tar.gz

sudo sh -c "cat > /etc/profile.d/node-init.sh" <<'EOF'
export NODEHOME=/opt/node-v0.10.15-linux-x86
export PATH=$PATH:$NODEHOME/bin
EOF
source /etc/profile.d/node-init.sh