#!/bin/bash
set -eo pipefail

mocha --recursive
eslint ./test
eslint ./lib
eslint ./ble-connector.js
