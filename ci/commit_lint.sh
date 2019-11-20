#!/bin/bash
cd ci/exec || exit 1
npm install || exit 1
cd ../.. || exit 1

LAST_MERGE=$(git log --pretty=format:"%H" --merges -n 1)

ci/exec/node_modules/.bin/commitlint @commitlint/config-conventional --from "${LAST_MERGE}" --to HEAD --verbose --config "${CI_WORKING_DIR}/ci/exec/commitlint.config.js"
