#!/bin/bash
set -e

if test -n "${GITHUB_USER}" && test -n "${GITHUB_PASSWORD}"; then
  cat << EOF > /root/.netrc
machine github.com
login ${GITHUB_USER}
password ${GITHUB_PASSWORD}

machine api.github.com
login ${GITHUB_USER}
password ${GITHUB_PASSWORD}
EOF
fi
