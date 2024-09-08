#!/usr/bin/env bash

NOWFILE=./now/now.md

changed_files=$(git diff --name-only HEAD^..HEAD | grep "${NOWFILE#./}")
changed_files="${changed_files#"${changed_files%%[![:space:]]*}"}"
changed_files="${changed_files%"${changed_files##*[![:space:]]}"}"

if [[ ${COMMIT_MESSAGE} =~ DEPLOY=.*now.* ]]; then
  echo "Forcing deploy"
elif ! [[ ${changed_files} =~ ${NOWFILE} ]]; then
	echo -e "\n*** No changes to ${NOWFILE} detected.\n"
  exit 0
fi

cat $NOWFILE | jq -R -s '{content: . }' | curl -i -X POST -H 'Content-type: application/json' -H "Authorization: Bearer $WEBLOG_API_KEY" -d @- https://api.omg.lol/address/${ADDRESS}/now
