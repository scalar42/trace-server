FROM ubuntu:18.04
MAINTAINER scalar42
COPY net.sh /home/
RUN apt update && apt install -y iproute2
WORKDIR /home/
CMD ["/bin/bash", "/home/net.sh"]
