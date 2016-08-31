# /bin/bash

# Diffusion youtube / facebook avec ffmpeg

# Configurer youtube / facebook avec con una resolucion minima.

VBR="400k"        # Bitrate del video
FPS="30"          # FPS del video
QUAL="medium"     # Preset de calidad FFMPEG

RTMP_URL="rtmp://x.rtmp.youtube.com/live2"            # URL de base RTMP (receptor)
#RTMP_URL="rtmp://rtmp-api.facebook.com:80/rtmp"

SOURCE="rtsp://stream.net:0000/live"         # Source UDP

KEY="xxxx-xxxx-xxxx-xxxx"          # Clave para la transmision

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -framerate $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 256k -bufsize 6000k \
    -f flv "$RTMP_URL/$KEY"

 

