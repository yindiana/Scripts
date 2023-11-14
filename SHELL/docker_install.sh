#!/bin/bash
#Variables
docker_check=$(systemctl status docker)
script_dl=$(curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh)
user_creation=$(useradd -c “docker admin user” -s /bin/bash dockeradm)
no_sudo_user=$(sudo usermod -aG docker dockeradm)
test_output=$(echo $?)

#Installations
$docker_check
if [[ $test_output != 0 ]]
then
    $script_dl
    grep -i dockeradm /etc/passwd
    if [[ $test_output != 0 ]]
    then
        $user_creation && $no_sudo_user
    else
        echo "le user existe déjà"
        exit
    fi
else
    echo "docker est déjà installé"
    exit
fi
