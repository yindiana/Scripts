#installlation du client
sudo apt install nfs-common

#creation du point de montage
echo "entrez le path du point de montage nfs
read pointdemontage
sudo mkdir -p $pointdemontage

#montage du point NFS
echo "entrez l'IP du point de montage NFS"
read ip_serveur_nfs
echo "entrez le path du dossier partagé sur le point de montage NFS"
read $nom_partage_nfs
sudo mount -t nfs $ip_serveur_nfs:/nom_partage_nfs $pointdemontage
