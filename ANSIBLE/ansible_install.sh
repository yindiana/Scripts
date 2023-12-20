
#/bin/bash

#Variables
test_python = python --version
become_sudo = sudo su -
os_version = apt-get
python_install = sudo $os_version install python3.7
pip_install = curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user

#Vérification des prérequis
if [ `whoami` == "root" ]
then
    echo "ok"
else
    echo "mettez-vous en root avant de continuer"
    echo "entrez votre mdp svp"
    $become_sudo
fi

$test_python
if [ $? != 0 ]
then
    echo "vous n'avez pas python installé, nous allons l'installer"
    #debian
    $python_install
    #RHEL
    #sudo yum install python37
    #SUZE
    #sudo zypper install python3-3.7

    #installation de pip
    $pip_install

    #https://docs.aws.amazon.com/fr_fr/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html
fi


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
