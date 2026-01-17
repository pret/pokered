#!/bin/sh
set -e

if ! git diff-index --quiet HEAD --; then
    echo 'Uncommitted changes detected:'
    git diff-index HEAD --
    return 1
fi
