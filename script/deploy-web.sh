#!/usr/bin/env bash

WEBFILE=web/profile.txt

changed_files=$(git diff --name-only HEAD^..HEAD | grep "${WEBFILE#./}")
changed_files="${changed_files#"${changed_files%%[![:space:]]*}"}"
changed_files="${changed_files%"${changed_files##*[![:space:]]}"}"

if [[ ${COMMIT_MESSAGE} =~ DEPLOY=.*web.* ]]; then
  echo "Forcing deploy"
elif ! [[ ${changed_files} =~ ${WEBFILE} ]]; then
	echo -e "\n*** No changes to ${WEBFILE} detected.\n"
  exit 0
fi

cat ./${WEBFILE} | jq -R -s '{content: ., publish: true}' | curl -i -X POST -H 'Content-type: application/json' -H "Authorization: Bearer $WEBLOG_API_KEY" -d @- https://api.omg.lol/address/${ADDRESS}/web
