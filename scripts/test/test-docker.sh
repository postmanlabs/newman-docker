#!/bin/bash

# stop on first error
set -e;

echo -e "\n\n\033[93mBuilding docker images...\033[0m";
npm run docker-build;

echo -e "\n\n\033[93mTesting docker images...\033[0m";
npm run docker-test;
