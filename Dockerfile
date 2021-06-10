FROM alpine:latest

run apk add --no-cache tzdata ffmpeg

COPY ./docker-ffmpeg /bin/docker-ffmpeg

RUN chmod +x /bin/docker-ffmpeg

ENTRYPOINT ["/bin/docker-ffmpeg"]
