FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python git curl sudo build-essential
RUN curl -sSL https://deb.nodesource.com/setup_6.x | sudo bash -
RUN apt-get install -y nodejs
RUN npm -g install node-gyp grunt
RUN npm -g install javierprovecho/codebox
RUN mkdir -p /root/.codebox/packages
RUN codebox install
RUN rm -rf /root/.codebox/packages/ctags/node_modules/ctags/*
RUN git clone https://github.com/javierprovecho/node-ctags /root/.codebox/packages/ctags/node_modules/ctags/
WORKDIR /root/.codebox/packages/ctags/node_modules/ctags/
RUN node-gyp rebuild
RUN npm install
RUN grunt
WORKDIR /workspace
EXPOSE 8000
ENTRYPOINT ["/usr/bin/codebox", "run"]