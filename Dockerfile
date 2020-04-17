# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt-get update
RUN apt-get install debmirror gpg ubuntu-archive-keyring -y

RUN mkdir /mirrorkeyring
RUN gpg --no-default-keyring --keyring /mirrorkeyring/trustedkeys.gpg --import /usr/share/keyrings/ubuntu-archive-keyring.gpg

COPY ./mirrorbuild.sh /usr/bin/mirrorbuild.sh
RUN chmod -x /usr/bin/mirrorbuild.sh
