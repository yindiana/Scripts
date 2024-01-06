1/ créer un dossier partagé NFS sur le serveur
2/ créer un user et un groupe qui pourra accéder au dossier sur le serveur cible via le script Scritps/SHELL/gestion_user_group.sh
3/ Sur le serveur client, lancer le script Scripts/DOCKER/QBITTORRENT/qbittorrent-config.sh qui lancera les scripts suivants :
  Scritps/SHELL/gestion_user_group.sh pour créer le même user que sur le serveur cible
  Scritps/SHELL/montage_nfs_client.sh pour faire le montage du dossier NFS
4/ lancer le script Scripts/DOCKER/SHELL/volume_creation qui se chargera de créer les volumes docker
#/opt/qbittorrent/config /opt/qbittorrent/downloads
5/ lancer le docker-compose.yml
