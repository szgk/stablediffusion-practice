FROM nvidia/cuda:12.0.0-cudnn8-devel-ubuntu20.04

WORKDIR /app

SHELL ["/bin/bash", "-c"]

# 日本語化
RUN apt-get update
RUN apt-get -y install language-pack-ja

RUN rm /etc/dpkg/dpkg.cfg.d/excludes && \
    apt-get --yes install man-db less && \
    rm -f /usr/bin/man && \
    dpkg-divert --quiet --remove --rename /usr/bin/man

# 環境変数
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
ENV LANG=ja_JP.UTF-8

# タイムゾーンの設問回避
RUN apt-get -y install tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt install -y software-properties-common

RUN apt install -y curl wget git

RUN apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6 libgl1-mesa-dev

# python3.10のインストール
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3.10 python3-pip
# pythonコマンド実行時3.10を動かす
RUN cp -rf /bin/python3.10 /bin/python3 && cp -rf /bin/python3.10 /bin/python
# pip install
RUN apt-get install python3.10-distutils -y
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py pip==20.0.2

RUN pip install notebook

CMD ["./entrypoint.sh"]