#/bin/bash

#Variables
test_python = python --version
become_sudo = sudo su -
python_install_debian = sudo apt-get install python3.7
python_install_rhel = sudo yum install python37
python_install_suze = sudo zypper install python3-3.7
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
    #$python_install_rhel
    #SUZE
    #$python_install_suze

    #installation de pip
    $pip_install

    #https://docs.aws.amazon.com/fr_fr/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html
fi
