#!/bin/bash

if [ ${MAKECATALOGS} = "true" ] || [ ${MAKECATALOGS} = "True" ] || [ ${MAKECATALOGS} = "TRUE" ]; then
    /munki/code/client/makecatalogs ${TARGET_DIR}
fi
