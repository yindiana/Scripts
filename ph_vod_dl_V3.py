#---------------------------------------------------
#Author : yindiana.fr |yndiana.contact@gmail.com
#Creation date : 30/08/2023
#Update date : 03/09/2023
#Update : add of logs
#Description : tool for video downloading
#---------------------------------------------------

#prerequis : python -m pip install yt-dlp
#            python -m pip install logging
#            python -m pip install datetime
#Possible MPEG-TS in MP4 container or malformed AAC timestamps. Install ffmpeg to fix this automatically :
    #https://phoenixnap.com/kb/ffmpeg-windows
#---------------------------------------------------

import yt_dlp
import logging
import datetime

# Configuration des logs
logging.basicConfig(filename='ph_vod_dl.log', level=logging.INFO, format='%(asctime)s - %(levelname)s: %(message)s')

def telecharger_video(url):
    try:
        #Logs infos 1/3
        logging.info("Debut du telechargement a : %s", datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        logging.info("Recherche de la video en cours...")

        # Créer un objet yt_dlp avec des options pour un téléchargement plus stable
        ydl_opts = {
            'quiet': True,  # Réduire la sortie verbale
            'format': 'best',  # Sélectionner le meilleur format disponible
            'outtmpl': '%(title)s.%(ext)s',  # Modèle pour le nom du fichier
        }
        
        #Logs infos 2/3
        logging.info("Lancement du telechargement")
        
        # Début du téléchargement
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info_dict = ydl.extract_info(url, download=False)
            video_title = info_dict.get('title', 'N/A')
            ydl.download([url])

        #Logs infos 3/3
        logging.info("Telechargement termine a : %s. Le fichier est enregistre sous : %s.mp4",
                     datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), video_title)
        logging.info("-----------------------------------------------------------")
    
    #Erreurs + logs erreurs
    except Exception as e:
        error_message = f"Une erreur est survenue : {e}"
        logging.error(error_message)
        print(error_message)

# Demander à l'utilisateur d'entrer l'URL de la vidéo YouTube
url_video = input("Entrez le(s) URL(s) de la vidéo YouTube (séparés par des virgules) : ").split(",")
print("Veuillez patientez svp ...")

for urls in url_video:
    telecharger_video(urls)