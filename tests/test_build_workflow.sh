#!/bin/bash

#TODO: 
#  - Add tests for the build workflow

#authorize the github cli with GitHub token
gh auth login --with-token $GITHUB_TOKEN

#run semantic versioning test
gh workflow run ./.github/workflows/tag-check.yml \
  -f tag=0.0.1

#run non-semantic versioning test
gh workflow run ./.github/workflows/tag-check.yml \
  -f tag=@databox/react-monorepo-benchmark@0.0.1 \
  -f extract_semver_from_tag=true
