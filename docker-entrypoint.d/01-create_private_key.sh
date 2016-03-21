#!/bin/bash

if test -n "${PRIVATE_KEY}"; then
  echo -e "${PRIVATE_KEY}" > /root/.ssh/id_rsa
  chmod 0600 /root/.ssh/id_rsa
fi
