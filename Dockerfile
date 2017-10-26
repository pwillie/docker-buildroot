FROM debian:stretch

ENV BR_VERSION 2017.08

RUN apt-get update -q && apt-get install -y -q \
    bash \
    bc \
    binutils \
    build-essential \
    bzip2 \
    ca-certificates \
    cpio \
    debianutils \
    file \
    g++ \
    gcc \
    git \
    gzip \
    libncurses5-dev \
    locales \
    make \
    patch \
    perl \
    python \
    rsync \
    sed \
    tar \
    unzip \
    wget \
 && rm -rf /var/lib/apt/lists/*

RUN sed -i "s/^# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen && update-locale LANG=en_US.UTF-8

RUN useradd -m builder -d /buildroot

USER builder

WORKDIR /buildroot

RUN wget -qO- http://buildroot.org/downloads/buildroot-$BR_VERSION.tar.gz \
 | tar xz  --strip 1

