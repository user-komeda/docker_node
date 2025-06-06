FROM almalinux:minimal

ENV NODE_VERSION 20.15.0
RUN microdnf -y install tar make gcc xz python3 unzip  g++
# Install packages needed to build gems 
RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz"
RUN  ls
RUN tar -xf "node-v$NODE_VERSION.tar.xz"
RUN curl -OL https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip && unzip ninja-linux && unzip && mv ninja /usr/bin
RUN cd "node-v$NODE_VERSION" && ./configure --ninja && make && make install
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg && microdnf install -y  yarn
