#!/bin/bash
# Install devops-command-tools
# By Tedezed

OPTION=$1
if [ -z "$OPTION" ]; then
    echo "[ERROR] Need input: --install or --uninstall"
    exit 1
fi

#ls ./* | grep -v "\.\/*"
list_scripts="
apt-http
dtags
entrypointd
gcloud_bucket_iam
gcloud_cold_disk
gcloud_cp_disk
gcloud_kill_disk
killgrep
kall
kcontext
kdelforce
kexec
kndefault
kscale
ksecret
outputlog
pomodoro
tarparts
trycommand
"

# ls -d */
list_install_docker="
apt-http/apt-http
docker/dtags
entrypointd/entrypointd
kubernetes/kall
kubernetes/kcontext
kubernetes/kdelforce
kubernetes/kexec
kubernetes/kexecronjob
kubernetes/kndefault
kubernetes/kscale
kubernetes/ksecret
logger/outputlog
tarparts/tarparts
trycommand/trycommand
"

if [ "$OPTION" == "--install" ]; then
    echo "[INFO] Dependency installation"
    # Kubernetes
    sudo apt-get install jq kubectl
    # Pomodoro
    sudo apt-get install pulseaudio-utils soxt

    echo "[INFO] Copy to /usr/bin/"
    sudo cp */* /usr/bin/
elif [ "$OPTION" == "--install-docker" ]; then
    for script in $list_install_docker;
    do
        dir_name=$(echo $script | cut -d '/' -f1)
        script_name=$(echo $script | cut -d '/' -f2)
        curl -SL https://raw.githubusercontent.com/Tedezed/devops-command-tools/master/$script \
            -o /usr/bin/$script_name
    done
elif [ "$OPTION" == "--uninstall" ]; then
    for script in $list_scripts;
    do
        if [ -f "/usr/bin/$script" ]; then
            echo "[INFO] Remove /usr/bin/$script"
            sudo rm -f /usr/bin/$script
        fi
    done
else
    echo "[ERROR] invalid input"
fi


