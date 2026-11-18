#!/usr/bin/env bash
# Idempotent bootstrap for Wicked Sick cloud agents.
# Installs the C++ toolchain and fetches the default NNUE net.
# Safe to run more than once. Does not commit the net or any secret.
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

if command -v apt-get >/dev/null 2>&1; then
  if [ "$(id -u)" -eq 0 ]; then
    APT=(apt-get)
  elif command -v sudo >/dev/null 2>&1; then
    APT=(sudo -E apt-get)
  else
    echo "warning: apt-get is present but sudo is unavailable; skipping package install" >&2
    APT=()
  fi
  if [ "${#APT[@]}" -gt 0 ]; then
    "${APT[@]}" update
    "${APT[@]}" install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      clang \
      curl \
      expect \
      g++ \
      make \
      wget
  fi
else
  echo "warning: apt-get not found; assuming the C++ toolchain is already installed" >&2
fi

for tool in g++ clang++ make; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "error: required tool '$tool' is not on PATH" >&2
    exit 1
  fi
done

# Building and fetching the public default net need no credentials.
# If a later step grows a secret, read that named env var, warn, and continue.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Makefile `net` validates an existing file and skips the download.
make -C "$ROOT/src" net
