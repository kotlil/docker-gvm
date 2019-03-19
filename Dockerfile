FROM ubuntu:18.04

ENV GVM_VERSION=master

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y  curl \
                        git \
                        mercurial \
                        make \
                        binutils \
                        bison \
                        gcc \
                        build-essential && \
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/${GVM_VERSION}/binscripts/gvm-installer) && \
    source /root/.gvm/scripts/gvm && \
    gvm install go1.4 -B && \
    gvm use go1.4 --default && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

COPY gvm.sh /bin/gvm.sh

ENTRYPOINT ["/bin/gvm.sh"]
