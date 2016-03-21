#!/bin/bash

LOCALREPO='/munki_repo'

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone ${REPOSITORY} $LOCALREPO
else
    cd $LOCALREPO
    git pull ${REPOSITORY}
fi
