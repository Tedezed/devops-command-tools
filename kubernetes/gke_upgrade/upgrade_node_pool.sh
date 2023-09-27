#!/bin/bash
# upgrade_node_pool
# By Tedezed

usage ()
{
cat <<EOF
upgrade_node_pool: Automation synchronize version of node pools with GKE master.

Usage: bash upgrade_node_pool.sh -p renault-georeporting -k renault-georeporting -z europe-west1-b
EOF
exit 2
}

while getopts ":p:k:z:h" OPTIONS; do
    case "${OPTIONS}" in
        p) PROJECT=${OPTARG} ;;
        k) CLUSTER=${OPTARG} ;;
        z) ZONE=${OPTARG} ;;
        h) usage ;;
        *) usage ;;
    esac
done

for node_pool in $(gcloud container clusters describe ${CLUSTER} --project=${PROJECT} --zone=${ZONE} --format=json | jq .nodePools[].name -r)
do
 echo y | gcloud container clusters upgrade ${CLUSTER} --project ${PROJECT} --zone ${ZONE} --node-pool ${node_pool}
 while true
  do
    if [ "$(gcloud container clusters describe ${CLUSTER} --project=${PROJECT} --zone=${ZONE} --format=json | jq .status -r)" == "RUNNING" ]
    then
      break
    fi
    sleep 1
  done
done
