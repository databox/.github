#!/bin/bash

ref=$1

#TODO: 
#  - Add tests for the build workflow

#authorize the github cli with GitHub token
gh auth login --with-token $GITHUB_TOKEN

#run semantic versioning test
gh workflow run "build.yml" \
  -f tag="1.0.0" \
  -r $ref
