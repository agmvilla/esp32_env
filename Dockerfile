FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install git wget flex bison gperf python-setuptools cmake ninja-build ccache libffi-dev libssl-dev python3 python3-pip python3-setuptools

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

RUN mkdir ~/esp && \
    cd ~/esp && \
    git clone -b release/v4.2 --recursive https://github.com/espressif/esp-idf.git

RUN cd ~/esp/esp-idf && ./install.sh

CMD ["bash"]
