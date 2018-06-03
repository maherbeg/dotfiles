FROM ubuntu:18.04


RUN apt-get clean -y && apt-get -y update && apt-get -y upgrade && \
  apt-get -y update && apt-get install -y mkvtoolnix ffmpeg  && \
apt-get clean -y

WORKDIR /app
COPY ./mkvdts.sh /app

ENTRYPOINT ["mkvdts.sh", "--new", "--no-dts"]
