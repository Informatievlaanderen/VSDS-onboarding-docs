#!/bin/bash
export SCRIPT_PATH=$(dirname -- "$( readlink -f -- "${BASH_SOURCE:-$0}"; )")
export DCAT_PATH=$SCRIPT_PATH/dcat
export LDES_SERVER_ADMIN_BASE="${LDES_SERVER_ADMIN_BASE:-http://localhost:8080}"

# Create catalog metadata
CATALOG_ID=$(curl -s --fail -X POST "$LDES_SERVER_ADMIN_BASE/admin/api/v1/dcat" -H "Content-Type: text/turtle" -d "@$DCAT_PATH/catalog.ttl")
code=$?
if [ $code != 0 ] 
    then exit $code
fi
echo "Created catalog with ID: '${CATALOG_ID}'.\nPlease write down this GUID for clearing the metadata using './clear.metadata.sh'."

# Create metadata for observations
curl --fail -X POST "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/dcat" -H "Content-Type: text/turtle" -d "@$DCAT_PATH/observations.ttl"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

curl --fail -X POST "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/views/by-location/dcat" -H "Content-Type: text/turtle" -d "@$DCAT_PATH/observations.by-location.ttl"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

curl --fail -X POST "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/views/by-page/dcat" -H "Content-Type: text/turtle" -d "@$DCAT_PATH/observations.by-page.ttl"
code=$?
if [ $code != 0 ] 
    then exit $code
fi

curl --fail -X POST "$LDES_SERVER_ADMIN_BASE/admin/api/v1/eventstreams/observations/views/by-time/dcat" -H "Content-Type: text/turtle" -d "@$DCAT_PATH/observations.by-time.ttl"
code=$?
if [ $code != 0 ] 
    then exit $code
fi
