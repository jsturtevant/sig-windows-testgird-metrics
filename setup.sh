#!/usr/bin/env bash

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -rg | --resource-group )
    shift; resourcegroup=$1
    ;;
  -t | --gh-token )
    shift; ghtoken=$1
    ;;
  -gh | --gh-account )
    shift; ghaccount=$1
    ;;
  -l | --location )
    shift; location=$1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

location=${location:-westus2}
resourcegroup=${resourcegroup:-"sig-windows-testgrid-metrics"}
ghtoken=${ghtoken:?"github access token is required with workflow permissions"}
ghaccount=${ghaccount:?"github account is required"}

az group create --name $resourcegroup --location $location
az staticwebapp create \
    -n $resourcegroup \
    -g $resourcegroup \
    -s https://github.com/${ghaccount}/sig-windows-testgird-metrics \
    -l $location \
    --api-location api \
    -b main \
    --app-artifact-location "dist" \
    --token ${ghtoken}
