#!/usr/bin/env bash

NOWFILE=now/now.md

# Files changed across the whole push (github.event.before..HEAD), so a change
# in any commit of a multi-commit push is detected — not just the last commit.
# Falls back to the last commit when there is no usable before-SHA (new branch,
# force push, or a local run without BEFORE_SHA set).
ZERO=0000000000000000000000000000000000000000
if [[ -n ${BEFORE_SHA} && ${BEFORE_SHA} != "${ZERO}" ]] && git cat-file -e "${BEFORE_SHA}" 2>/dev/null; then
  range="${BEFORE_SHA}..HEAD"
else
  range="HEAD^..HEAD"
fi

changed_files=$(git diff --name-only ${range} | grep "^${NOWFILE}$")

if [[ ${COMMIT_MESSAGE} =~ DEPLOY=.*now.* ]]; then
  echo "Forcing deploy"
elif [[ -z ${changed_files} ]]; then
  echo -e "\n*** No changes to ${NOWFILE} detected.\n"
  exit 0
fi

cat ./${NOWFILE} | jq -R -s '{content: . }' | curl -i -X POST -H 'Content-type: application/json' -H "Authorization: Bearer $WEBLOG_API_KEY" -d @- https://api.omg.lol/address/${ADDRESS}/now
