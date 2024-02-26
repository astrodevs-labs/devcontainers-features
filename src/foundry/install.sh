#!/bin/sh
set -e

echo "Activating feature 'foundry'"

# Install foundryup

su $_REMOTE_USER -c "curl -L https://foundry.paradigm.xyz |  /bin/bash"

# If $COMMIT is equal to "latest"
if [ "$COMMIT" = "latest" ]; then
  su $_REMOTE_USER -c '$HOME/.foundry/bin/foundryup'
else
  if ! command -v cargo &> /dev/null
  then
    echo "Rust toolchain could not be found, installing it"
    su $_REMOTE_USER -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
    su $_REMOTE_USER -c 'export PATH=$HOME/.cargo/bin:$PATH && $HOME/.foundry/bin/foundryup -C $COMMIT'
  else
    su $_REMOTE_USER -c '$HOME/.foundry/bin/foundryup -C $COMMIT'
  fi
fi