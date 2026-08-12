#!/usr/bin/env bash

# Deploys the omg.lol profile (web page) from repo sources. The /web endpoint
# resets any field you omit, so content, css, and head MUST be sent together —
# otherwise a content-only POST wipes the custom <head> and CSS.
WEBDIR=web
CONTENT_FILE=${WEBDIR}/profile.txt
CSS_FILE=${WEBDIR}/css.css
HEAD_FILE=${WEBDIR}/head.html

# Files changed across the whole push (github.event.before..HEAD), so a change
# in any commit of a multi-commit push is detected. Falls back to the last
# commit when there is no usable before-SHA.
ZERO=0000000000000000000000000000000000000000
if [[ -n ${BEFORE_SHA} && ${BEFORE_SHA} != "${ZERO}" ]] && git cat-file -e "${BEFORE_SHA}" 2>/dev/null; then
  range="${BEFORE_SHA}..HEAD"
else
  range="HEAD^..HEAD"
fi

changed_files=$(git diff --name-only ${range} | grep "^${WEBDIR}/")

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
