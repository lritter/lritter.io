#!/usr/bin/env bash

# Deploys the omg.lol profile (web page) from repo sources. The /web endpoint
# resets any field you omit, so content, css, and head MUST be sent together —
# otherwise a content-only POST wipes the custom <head> and CSS.
WEBDIR=web
CONTENT_FILE=${WEBDIR}/profile.txt
CSS_FILE=${WEBDIR}/css.css
HEAD_FILE=${WEBDIR}/head.html

changed_files=$(git diff --name-only HEAD^..HEAD | grep "^${WEBDIR}/")

if [[ ${COMMIT_MESSAGE} =~ DEPLOY=.*web.* ]]; then
  echo "Forcing deploy"
elif [[ -z ${changed_files} ]]; then
  echo -e "\n*** No changes to ${WEBDIR}/ detected.\n"
  exit 0
fi

CONTENT=$(cat "./${CONTENT_FILE}")
CSS=$(cat "./${CSS_FILE}")
HEAD=$(cat "./${HEAD_FILE}")

jq -n --arg content "$CONTENT" --arg css "$CSS" --arg head "$HEAD" \
  '{publish: true, content: $content, css: $css, head: $head}' \
  | curl -i -X POST -H 'Content-type: application/json' -H "Authorization: Bearer $WEBLOG_API_KEY" -d @- https://api.omg.lol/address/${ADDRESS}/web
