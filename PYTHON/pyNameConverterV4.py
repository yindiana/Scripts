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

def rename_files(directory_path):
    for filename in os.listdir(directory_path):
        if os.path.isfile(os.path.join(directory_path, filename)):
            new_filename = filename.lower().replace(" ", "_").replace("'", "_").replace('"', "_").replace("-", "_").replace(",","_")
            new_filepath = os.path.join(directory_path, new_filename)
            if os.path.exists(new_filepath) and new_filepath != os.path.join(directory_path, filename): #verifie si le fichier existe et s'il n'y a pas un autre fichier avec le même nom
                try:
                    #print(f"filename = {filename} ")
                    #print(f"new_filename = {new_filename} ")
                    os.remove(new_filepath) #supprime le fichier déjà présent
                    os.rename(os.path.join(directory_path, filename), os.path.join(directory_path, new_filename)) #renomme le fichier comme prevu
                except OSError as e:
                        print(f"Erreur lors de la suppression du fichier : {e}") #sort une erreur
                        continue
            else:
                os.rename(os.path.join(directory_path, filename), os.path.join(directory_path, new_filename))  #renomme le fichier comme prevu
            
if __name__ == "__main__":
    paths = input("Entrez les chemins des dossiers (séparés par des virgules) : ").split(',')
    
    for folder_path in paths:
        folder_path = folder_path.strip()
        if os.path.exists(folder_path) and os.path.isdir(folder_path):
            rename_files(folder_path)
            print(f"Renommage des fichiers dans le dossier {folder_path} terminé.")
        else:
            print(f"Le chemin du dossier {folder_path} n'est pas valide.")