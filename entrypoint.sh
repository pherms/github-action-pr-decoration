#!/bin/bash

set -e

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
	EVENT_ACTION=$(jq -r ".action" "${GITHUB_EVENT_PATH}")
	if [[ "${EVENT_ACTION}" != "opened" ]]; then
		echo "No need to run analysis. It is already triggered by the push event."
		exit
	fi
fi

curl --location  --header \"Authorization: Basic ${INPUT_LOGIN}\" --request GET \"${INPUT_HOST}/api/measures/component?component=${INPUT_PROJECTKEY}&metricKeys=violations,bugs,code_smells,reliability_rating,security_rating,security_review_rating,sqale_rating,vulnerabilities,security_hotspots\" -o \"result.json\"
