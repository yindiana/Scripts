install_portainer () {
echo "portainer will be install"
docker pull portainer/portainer-ce
echo "portainer was install"
}

run_portainer () {
echo "Portainer will be launch in port 9000"
docker run -d -p 9000:9000 -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
echo "Portainer is running in port 9000"
}

install_portainer && run_portainer
