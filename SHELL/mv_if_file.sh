#/bin/bash
path_in= #entrez le dossier des fichiers à déplacer, exemple : "/opt/tests/test1/"
path_out= #entrez le dossier où ils seront deplacer, exemple : "/opt/tests/test2/"
if_file_exist=`ls -l "$path_in" | wc -l`

function mv_if_file()
{
        if [[ $if_file_exist -gt 1 ]]
        then
                mv $path_in/* $path_out
        fi
}

mv_if_file
