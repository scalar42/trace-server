FROM ubuntu:18.04
MAINTAINER scalar42
COPY ./ctr /home/ctr
RUN apt update && apt install -y iproute2
WORKDIR /home/ctr/
