#---------------------------------------------------
#Author : yindiana.fr |yndiana.contact@gmail.com
#Creation date : 30/08/2023
#Update date : 03/09/2023
#Update : add of logs
#Description : tool for video downloading
#---------------------------------------------------

#prerequis : python -m pip install pytube
#            python -m pip install re
#---------------------------------------------------

from pytube import YouTube
import re

def telecharger_video_youtube(url):
    try:
        print("Recherche de la vidéo en cours...")
        yt = YouTube(url)
        titre_video = re.sub(r'\W+', '_', yt.title)  # Remplace les caractères non alphanumériques par des underscores
        
        print("lancement du téléchargement")
        stream = yt.streams.get_highest_resolution()
        
        print("Téléchargement", titre_video + " en cours...")
        stream.download(filename=str(titre_video + ".mp4"))
        print("Téléchargement terminé. Le fichier est enregistré sous :", titre_video + ".mp4")
    
    except Exception as e:
        print("Une erreur est survenue :", e)

# Demander à l'utilisateur d'entrer l'URL de la vidéo YouTube
url_video_youtube = input("Entrez le(s) URL(s) de la vidéo YouTube (séparés par des virgules) : ").split(",")

for urls in url_video_youtube :
        telecharger_video_youtube(urls)
