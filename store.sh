# /bin/bash

# Almacenamiento local recurso de video RTSP FLV ffmpeg

VBR="400k"         # Bitrate del video
FPS="30"           # FPS del video
QUAL="medium"      # Preset de calidad FFMPEG

SOURCE="rtsp://www.stream.net:0000/live"              # Source UDP (voir les annonces SAP)

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -framerate $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 256k -bufsize 6000k file.flv \
