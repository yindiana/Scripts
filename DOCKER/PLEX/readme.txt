1/ créer un dossier partagé NFS sur le serveur
2/ créer un user et un groupe qui pourra accéder au dossier sur le serveur via le script Scritps/LINUX/user_&_group_add.sh
3/ Sur le serveur client, lancer les scripts :
  Scritps/LINUX/user_&_group_add.sh pour créer le même user que sur le serveur
  Scritps/LINUX/montage_nfs_client.sh pour faire le montage du dossier NFS
4/ lancer le docker-compose.yml
