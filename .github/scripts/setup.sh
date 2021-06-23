#!/bin/bash

# shellcheck disable=SC2129

main() {
  BRANCH_OR_TAG="$(echo "${GITHUB_REF}" | sed 's/refs\/heads\///g' | sed 's/refs\/tags\///g')"
  PROJECT_NAME="role-homebrew-retry"
  WORKFLOW_URL="$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID"
  echo "BRANCH_OR_TAG=${BRANCH_OR_TAG}" >> "$GITHUB_ENV"
  echo "WEBHOOK_URL=${WEBHOOK_URL}" >> "$GITHUB_ENV"
  echo "PROJECT_NAME=${PROJECT_NAME}" >> "$GITHUB_ENV"
  echo "NOTIFICATION=${PROJECT_NAME} [<${WORKFLOW_URL}|${BRANCH_OR_TAG}>]" >> "$GITHUB_ENV"
  echo "USERNAME=osx-provisioner" >> "$GITHUB_ENV"
}

main

# Create Empty Results File
touch /tmp/results.yml
