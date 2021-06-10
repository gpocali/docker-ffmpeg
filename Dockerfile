FROM linuxserver/ffmpeg:latest

run apt-get install -y tzdata

COPY ./docker-ffmpeg /bin/docker-ffmpeg

RUN chmod +x /bin/docker-ffmpeg

ENTRYPOINT ["/bin/docker-ffmpeg"]
