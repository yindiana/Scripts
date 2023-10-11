#---------------------------------------------------
#Author : yindiana.fr |yndiana.contact@gmail.com
#Creation date : 11/10/2023
#Update date :
#Update : 
#Description : tool for music downloading
#---------------------------------------------------

#prerequis : python -m pip install pytube
#            python -m pip install re
#créez un dossier nommé "audio" dans le même répertoire que votre script pour stocker les fichiers audio au format MP3
#---------------------------------------------------

from pytube import YouTube
import re

def telecharger_audio_youtube(url):
    try:
        print("Recherche de la vidéo en cours...")
        yt = YouTube(url)
        titre_video = re.sub(r'\W+', '_', yt.title)  # Remplace les caractères non alphanumériques par des underscores
        
        print("Téléchargement de l'audio de", titre_video + " en cours...")
        stream = yt.streams.filter(only_audio=True, file_extension='mp4').first()
        stream.download(output_path='audio', filename=str(titre_video))
        print("Téléchargement terminé. Le fichier audio est enregistré sous :", titre_video + ".mp3")
    
    except Exception as e:
        print("Une erreur est survenue :", e)

# Demander à l'utilisateur d'entrer l'URL de la vidéo YouTube
url_audio_youtube = input("Entrez le(s) URL(s) de la musique YouTube (séparés par des virgules) : ").split(",")

for urls in url_audio_youtube :
    telecharger_audio_youtube(urls)