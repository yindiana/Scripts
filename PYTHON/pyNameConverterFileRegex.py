#-------------------------------------------------------
#Author : yindiana.fr |yndiana.contact@gmail.com
#Creation date : 28/08/2023
#Update date : 03/09/2023
#Update : add input for path rather than raw path in code
#         add multipath in input
#Description : tool for video rename files in snake_case
#-------------------------------------------------------

#Prerequis : python -m pip install os
#-------------------------------------------------------

import os
import re

def rename_files(directory_path):
    for filename in os.listdir(directory_path):
        if os.path.isfile(os.path.join(directory_path, filename)):
            new_filename = re.sub(r"\[www\.cpasbien\.pe\]_", "", filename)
            os.rename(os.path.join(directory_path, filename), os.path.join(directory_path, new_filename))
            
if __name__ == "__main__":
    paths = input("Entrez les chemins des dossiers (séparés par des virgules) : ").split(',')
    
    for folder_path in paths:
        folder_path = folder_path.strip()
        if os.path.exists(folder_path) and os.path.isdir(folder_path):
            rename_files(folder_path)
            print(f"Renommage des fichiers dans le dossier {folder_path} terminé.")
        else:
            print(f"Le chemin du dossier {folder_path} n'est pas valide.")