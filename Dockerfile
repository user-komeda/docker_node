FROM almalinux:minimal

ENV NODE_VERSION 20.15.0
RUN microdnf -y install tar make gcc xz python3  g++
# Install packages needed to build gems 
RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz"
RUN  ls
RUN tar -xf "node-v$NODE_VERSION.tar.xz"
RUN cd "node-v$NODE_VERSION" && ./configure && make -j$(getconf _NPROCESSORS_ONLN) && make install
RUN npm install -g corepack
RUN corepack enable yarn
RUN yarn -v
