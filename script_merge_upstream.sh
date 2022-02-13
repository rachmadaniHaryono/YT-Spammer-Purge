#!/usr/bin/env bash
git checkout tmp
git reset --hard upstream/main
git checkout main -- .pre-commit-config.yaml pyproject.toml
pre-commit run --all-files
git add -u
git commit -m 'refactor: autoformat'
git checkout main
git merge tmp -m 'refactor: merge tmp' --strategy-options theirs
git push --force
