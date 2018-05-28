FROM ubuntu:16.04

MAINTAINER Anatoly Galiulin <galiulin.anatoly@gmail.com>

RUN apt-get update

RUN apt-get install -y curl git bzip2 wget software-properties-common python-software-properties

# clang
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
 && apt-add-repository -y "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" \
 && apt-get update \
 && apt-get install -y clang-6.0 

# cmake
RUN curl https://cmake.org/files/v3.11/cmake-3.11.2-Linux-x86_64.sh -o /tmp/curl-install.sh \
      && chmod u+x /tmp/curl-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/curl-install.sh

RUN apt-get install -y make

RUN apt-get install -y libgmp-dev

RUN apt-get install -y openjdk-8-jdk maven

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ENV PATH="/usr/bin/cmake/bin:${PATH}"

ENV CC=/usr/bin/clang-6.0

ENV CXX=/usr/bin/clang++-6.0
