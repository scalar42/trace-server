FROM ubuntu:18.04
MAINTAINER scalar42
COPY ./src /home/src
RUN apt update && apt install -y iproute2
WORKDIR /home/src/
