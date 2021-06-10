# docker-ffmpeg
 Docker FFMPEG in Alpine Linux

## Arguments File
 Arguments are passed to FFMPEG via the /args file.  If this file is not included, the docker will exit.
 - Note: Be sure to mount any needed directories for input and output files
 - For a list of available codecs use -codecs
 
### Basic Transcode
```
-i /input/input.mkv \
-c:v libx264 \
-b:v 4M \
-vf scale=1280:720 \
-c:a copy \
/output/output.mkv
```

