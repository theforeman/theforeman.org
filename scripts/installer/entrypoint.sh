#!/bin/bash

if [ -x "$(command -v scl_source)" ]; then
  source scl_source enable tfm
fi

exec "$@"
