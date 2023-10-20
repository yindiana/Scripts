#!/bin/bash
#yindiana.fr
#created in 2023/10/05
#description : this script stop and delete your portainer container, then download the new version and run it

echo "Enter your portainer_id = ";
echo "if you don't have it, close the script and run command 'docker ps' before run the script"
read portainer_id;
docker stop $portainer_id;
if [[ $? -eq 0 ]]
then
        echo "Portainer is stopped";
        docker rm $portainer_id;
        if [[ $? -eq 0 ]]
        then
                echo "Old version of portainer is deleted";
                docker pull portainer/portainer-ce;
                if [[ $? -eq 0 ]]
                then
                        echo "New version of portainer was downloaded and will be run";
                        docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce;
                        if [[ $? -eq 0 ]]
                        then
                                echo "Portainer was updated !"
                        fi
                fi
        fi
fi
exit
