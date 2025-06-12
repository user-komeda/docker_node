FROM almalinux:minimal

ENV NODE_VERSION=20.15.0

WORKDIR /temp_build
RUN microdnf -y install tar make gcc xz python3 unzip  g++  findutils && microdnf clean all && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" && tar -xf "node-v$NODE_VERSION.tar.xz" && curl -OL https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip && unzip ninja-linux && unzip && mv ninja /usr/bin && cd "node-v$NODE_VERSION" && ./configure --ninja && make && make install && make clean && rm -rf /temp_build && curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg && microdnf install -y  yarn && microdnf clean all

