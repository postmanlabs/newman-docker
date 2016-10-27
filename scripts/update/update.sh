#!/bin/bash

# A simple script to automagically bump the newman-docker image version to the latest counterpart from npmjs.org

# Stop on first error
set -e;

echo "Determining the latest version of Newman from npmjs.org...";

CURRENT_VERSION=$npm_config_package_version;
LATEST_VERSION=$(npm show newman version);

if [ -z $CURRENT_VERSION ]; then
	CURRENT_VERSION=$(grep "\"version\":\ " package.json | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+" | cat);
fi

if [ $CURRENT_VERSION = $LATEST_VERSION ]; then
	echo "The current version is the latest";
	exit 0;
fi

git grep -l $CURRENT_VERSION | xargs sed -i 's/$CURRENT_VERSION/$LATEST_VERSION/g' images/**/*.*;
echo "Bumped newman-docker version to v$LATEST_VERSION";
