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
dsearch
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
kexecroot
kndefault
kscale
ksecret
outputlog
pomodoro
tarparts
trycommand
"

if [ "$OPTION" == "--install" ]; then
    echo "[INFO] Copy to /usr/bin/"
    sudo cp */* /usr/bin/
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


