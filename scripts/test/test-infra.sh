#!/bin/bash

# stop on first error
set -e;

echo -e "\n\n\033[93mRunning infrastructure tests...\033[0m";
echo -e "\033[0m\033[2mmocha `mocha --version`\033[0m";

# run mocha tests
mocha test/infra/**/*.test.js --recursive;
