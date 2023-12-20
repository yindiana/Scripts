#/bin/bash

#Variables
virtualenv_install = apt install python-virtualenv sshpass
ansible_install = pip install ansible && ansible --version && xxx

#Installez le paquet python-virtualenv, ce qui permettra de créer des environnement de travail virtuel : virtualenv.
#Vous profiterez d’installer le paquet sshpass qui servira ultérieurement pour se connecter en SSH avec Ansible.
$virtualenv_install

#créez un simple utilisateur
echo "entrez le nom du user qui sera utilisé par ansible"
read useransible
echo "entrez son mdp"
read mdpansible
adduser $useransible -p $mdpansible

#Créez votre environnement de travail virtuel
echo "un environnement virtuel va être créé pour votre projet et on va y installer ansible"
echo "donnez un nom a ce nouveau projet"
read virtenv
virtualenv $virtenv

#activation du virtual env
echo "l'environnement virtuel a été créé, on va le lancer"
source $virtenv/bin/activate

#installation de ansible
echo "ansible va être installé"
$ansible_install

#verifier qu'on a les modules ansible, ansible-config et ansible-doc pour voir que c bien installé
