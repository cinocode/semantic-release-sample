#!/bin/bash
cd ci/exec || exit 1
npm install || exit 1
cd ../.. || exit 1

ci/exec/node_modules/.bin/semantic-release --no-ci
