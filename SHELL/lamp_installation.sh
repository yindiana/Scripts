#!/bin/sh
#---------------------------------------------------
#Author : yindiana.fr |yndiana.contact@gmail.com
#Creation date : 17/10/2023
#Description : tool for install LAMP server in debian systems
#---------------------------------------------------

#prerequis : Have a debian system installed in your server

#function installation of most common php modules
php_module_installation () {
    echo "Most PHP scripts (CMS, forums, web applications of all kinds) use PHP modules to benefit from certain functionalities."
    echo "Do you to install the most common PHP modules ?"
    echo "Enter yes or no"
    if [[ $? = "yes" ]]
    then
        sudo apt install php-curl php-gd php-intl php-json php-mbstring php-xml php-zip
    else
        echo "PHP modules are not installed "
    fi
}

#installation of LAMP serveur (APACHE PHP MYSQL or MARIADB)
echo "This script will install APACHE PHP and a MySQL or MariaDB according to your choice"
echo "Which database do you want ?"
echo "Enter 1 for MySQL"
echo "Enter 2 for MariaDB"

if [[ $? = 1 ]]
then
    sudo apt install apache2 php libapache2-mod-php mysql-server php-mysql
    php_module_installation
elif [[ $? = 2 ]]
then
    sudo apt install apache2 php libapache2-mod-php mariadb-server php-mysql
    php_module_installation
else
    echo "I did not understand your choice, please restart the tool"
    exit
fi
