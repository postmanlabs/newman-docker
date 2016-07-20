#!/bin/bash

set -e;

echo    "";
echo    "      ,-————,";
echo    "     / _____ \\";
echo    "    ( | >   | )";
echo    "     \\   —   /";
echo    "      \`—————‘";
echo    "";

echo "Newman Docker Tests";

# run infra tests
npm run test-infra;

# run docker tests
npm run test-docker;
