#!/bin/bash

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$TARGET_DIR/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone --no-checkout -b ${GIT_BRANCH} ${REPOSITORY} $TARGET_DIR
    cd $TARGET_DIR
    git fetch origin ${GIT_BRANCH}
    git fat init
else
    cd $TARGET_DIR
    git fetch origin ${GIT_BRANCH}
    git reset --hard
fi
