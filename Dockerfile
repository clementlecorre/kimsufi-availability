FROM debian
MAINTAINER cl3m3nt
RUN apt-get update && apt-get -y install curl wget jq
COPY bin /kimsufi
WORKDIR /kimsufi
CMD ["bash", "run.sh"]
