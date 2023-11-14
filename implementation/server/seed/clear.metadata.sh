#!/bin/bash
export SCRIPT_PATH=$(dirname -- "$( readlink -f -- "${BASH_SOURCE:-$0}"; )")
export DCAT_PATH=$SCRIPT_PATH/dcat
export LDES_SERVER_ADMIN_BASE="${LDES_SERVER_ADMIN_BASE:-http://localhost:8080}"

CATALOG_ID=$1

# Remove metadata for observations
curl --fail -X DELETE "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/views/by-time/dcat"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

curl --fail -X DELETE "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/views/by-page/dcat"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

curl --fail -X DELETE "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/views/by-location/dcat"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

curl --fail -X DELETE "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/dcat"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

# Remove catalog metadata
curl --fail -X DELETE "$LDES_SERVER_ADMIN_BASE/admin/api/v1/dcat/${CATALOG_ID}"
code=$?
if [ $code != 0 ] 
    then exit $code
fi
