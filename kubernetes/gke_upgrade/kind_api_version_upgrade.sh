#!/bin/bash
# kind_api_version_upgrade
# By Tedezed

usage ()
{
cat <<EOF
kind_api_version_upgrade: Automation to update kubernetes yaml files in a path to a specific version.

Usage: bash kind_api_version_upgrade.sh -k CronJob:batch/v1,HorizontalPodAutoscaler:autoscaling/v2 -p /home/user/git/projects_gke
Example: apiVersion: batch/v1beta1 and kind: CronJob ---> apiVersion: batch/v1, kind: CronJob


EOF
exit 2
}

while getopts ":k:p:h" OPTIONS; do
    case "${OPTIONS}" in
        k) KIND_VERSION_INPUT=${OPTARG} ;;
        p) PATH_TO_FIND=${OPTARG} ;;
        h) usage ;;
        *) usage ;;
    esac
done

for kind_version in $(echo $KIND_VERSION_INPUT | tr ',' ' ')
do
    kind=$(echo "$kind_version" | cut -d ':' -f1)
    version=$(echo "$kind_version" | cut -d ':' -f2)
    echo "Kind: $kind $version"
    files_to_change=$(egrep -R "$kind" $PATH_TO_FIND | cut -d ':' -f1 | egrep 'yml|yaml')
    for file_yaml in $files_to_change
    do
        echo "  Upgrade file: $file_yaml"
        kubectl-convert -f $file_yaml --output-version $version \
            | grep -v 'status: {}' \
            | grep -v 'terminationMessagePath: /dev/termination-log' \
            | grep -v 'terminationMessagePolicy: File' \
            | grep -v 'schedulerName: default-scheduler' \
            | grep -v 'securityContext: {}' \
            | grep -v 'terminationGracePeriodSeconds: 30' \
            | grep -v 'restartPolicy: OnFailure' \
            | grep -v 'dnsPolicy: ClusterFirst' > /tmp/kubectl-convert-tmp
        mv /tmp/kubectl-convert-tmp $file_yaml
    done
done

exit 0
