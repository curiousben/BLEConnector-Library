#!/bin/bash
set -eo pipefail

./node_modules/.bin/mocha --recursive
./node_modules/.bin/eslint ./test
./node_modules/.bin/eslint ./lib
./node_modules/.bin/eslint ./ble.js
