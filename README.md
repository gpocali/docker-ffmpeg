# docker-ffmpeg
 Docker FFMPEG based on linuxserver/ffmpeg

## Config Directory
 - /config is used as the working directory for FFMPEG.  
 - If an input file is detected we will run FFmpeg as that user/group so the output file will match it's permissions.
 - The image supports Hardware acceleration on x86 pay close attention to the variables for the examples below.

## Arguments File
 Arguments are passed to FFMPEG via the /args file.  If this file is not included, the docker will exit.
 
### Basic Transcode
```
-i /config/input.mkv \
-c:v libx264 \
-b:v 4M \
-vf scale=1280:720 \
-c:a copy \
/config/output.mkv
```

### Hardware accelerated (VAAPI)
 Must be run with '--device=/dev/dri:/dev/dri'.
```
-vaapi_device /dev/dri/renderD128 \
-i /config/input.mkv \
-c:v h264_vaapi \
-b:v 4M \
-vf 'format=nv12|vaapi,hwupload,scale_vaapi=w=1280:h=720' \
-c:a copy \
/config/output.mkv
```

### Nvidia Hardware accelerated
 Must be run with '--runtime=nvidia'.
```
-hwaccel nvdec \
-i /config/input.mkv \
-c:v h264_nvenc \
-b:v 4M \
-vf scale=1280:720 \
-c:a copy \
/config/output.mkv
```
