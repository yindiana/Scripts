#!/bin/bash
#author : yindiana.fr
#creation date: 06/08/2023
#last modification : 06/08/2023

#git install
    #case debian
    apt-get install git                                             #install
    if [ $? != 0 ]                                                  #vcheck of install
    then
        echo "GIT can't be install"                                 #install is ko, exit
        exit
    else
        echo "GIT is installed"
        echo "Let's configure GIT"
    fi
    
    #case redhat

#git config
    echo "enter your git folder path for initialisation"
    read git_folder                                                 #folder of git
    cd $git_folder
    if [ $? != 0 ]                                                  #vcheck of folder name
        then
            echo "please verify your folder path or rights"         #can't acces the folder
            exit
    fi

    echo "enter your username"                                      #username
    read user_name

    echo "enter your email"                                         #user email
    read user_email

    git config --global user.name $user_name && git config --global user.email $user_email  #identity configuration

        #check of username and email
        echo "Check of your paramters..."

        echo "Is your name right $user_name ? (yes or no)"                         #check of name               
        read check_user_name
        echo "Is your email right $user_email ? (yes or no)"                       #check of email             
        read check_user_email
        
        if [ $check_user_name = no ]
        then
            echo "enter your username"                                      #username
            read user_name
            git config --global user.name $user_name

        fi

        if [ $check_user_email = no ]
        then
            echo "enter your email"                                         #user email
            read user_email
            git config --global user.email $user_email  #identity reconfiguration
        fi
    echo "Your identity is registered"

    #color configuratiion
    echo "GIT coloring improve readability"
    echo "Do you want configure git coloring ? (yes or no)"
    read user_color_choice
    if [ $user_color_choice = yes ]
    then
        echo "configuration of git color in progress"
        git config --global color.diff auto && git config --global color.status auto && git config --global color.branch auto
        echo "GIT coloration is done"
    fi

    #editor configuration (to do)
    # echo "By default, Git uses Vim as editor and Vimdiff as merge tool"
    # echo "Do you want to modify this parameter ? (yes or no)"

    #Local repo
        # echo "Select 1 to create a new project"
        # echo "Select 2 to clone a remote repository"
        # echo "Select 3 to exit"
        # read local_repo_choice
        # if [$local_repo_choice = 1 ]                                      #creation of a local repository
        # then
        #     echo "enter a local folder path to create a repository"
        #     read repo_folder
        #     cd $repo_folder
        #     git init
        #     echo "initialisation of your local repo in progress..."
        # elif [$local_repo_choice = 2 ]                                    #clone of a remote repository
        # then
            #...
        # elif [$local_repo_choice = 3 ]                                    #exit function
        # then
            # exit
        # fi
    
    #check of parameters
    echo "Congrats, GIT is installed and configured !"
    echo "This is your parameters :"
    git config --list
exit
