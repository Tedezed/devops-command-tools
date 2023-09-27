# Upgrade clusters GKE

1. The first step is to consult the breaking changes and the [deprecation guide](https://kubernetes.io/docs/reference/using-api/deprecation-guide/) before the update. In this example we will take the step from version v1.24 to v1.27. 

2. Between these versions we can see the version change of:
    - CronJob from `batch/v1beta1` to `batch/v1`.
    - HorizontalPodAutoscaler from `autoscaling/v2beta1` to `autoscaling/v2`.

3. Where we run the script `kind_api_version_upgrade.sh` to see the changes:

```
bash kind_api_version_upgrade.sh -k CronJob:batch/v1,HorizontalPodAutoscaler:autoscaling/v2 -p /home/user/git/source-destination
```

5. The script goes through all the yaml files and updates the ones it considers necessary. It currently uses kube-convert which is not a final version, so the changes you make should be taken as a guideline, see path `/home/user/git/source-destination`.

6. Once the changes in the repository are prepared, we can proceed to update the cluster.

7. Look for the section Release channel/Version and click in UPGRADE AVAILABLE, select the version until you get the final version.

> **WARNING!** The credentials and ip of the master node can be modified.

8. Once we have the master node in the version you want, in this case version 1.27, proceed with the node pools.

9. To match the node pool with the master version automatically we will use the  script `upgrade_node_pool.sh`:

```
bash upgrade_node_pool.sh -p google-project-name -k gke-cluster-name -z europe-west1-b
```
