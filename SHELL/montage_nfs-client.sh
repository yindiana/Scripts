#installlation du client
sudo apt install nfs-common -y

#creation du point de montage
echo "entrez le path où sera monté le point NFS sur le client"
echo "Exemple : /ceci/est/un/point/de/montage"
read pointdemontage
sudo mkdir -p $pointdemontage

#montage du point NFS
echo "entrez l'IP du point de montage NFS"
echo "Exemple : 192.168.1.1"
read ip_serveur_nfs
echo "entrez le path du dossier partagé sur le serveur cible"
echo "Exemple : /export/mon-point-nfs"
read nom_partage_nfs
sudo mount -t nfs $ip_serveur_nfs:$nom_partage_nfs $pointdemontage
#verification
echo "vérifiez que le montage est fait"
df -h | grep $pointdemontage
showmount -a
showmount -e
showmount -d

#persistance avec le fstab
echo "$ip_serveur_nfs:$nom_partage_nfs $pointdemontage     nfs     auto,_netdev,,nofail        0 0" >> /etc/fstab
#verification
echo "vérifiez que la ligne a été ajoutée dans le fstab"
tail /etc/fstab

#source : https://www.tutos.eu/9011
