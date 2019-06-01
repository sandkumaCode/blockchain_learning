FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install locales

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -qq wget unzip build-essential cmake gcc libcunit1-dev libudev-dev

RUN apt-get update && \
        apt-get install -y software-properties-common vim curl
        #add-apt-repository ppa:deadsnakes/ppa
        #add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update -y

RUN apt-get install -y build-essential  python3-pip  && \
        apt-get install -y git

# update pip
RUN python3 -m pip install pip --upgrade && \
        python3 -m pip install wheel



#RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

RUN apt-get -y install build-essential libssl-dev
#RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
#RUN ./install_nvm.sh
# nodejs stuff
#RUN mkdir /usr/local/nvm
#ENV NVM_DIR /usr/local/nvm
#ENV NPM_PATH /root/.nvm/versions/node/v8.16.0/bin/npm
#ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
#ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
ENV NVM_DIR="${HOME}/.nvm"

ENV NODE_VERSION 8
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install 8 \
    && nvm on \
    && nvm use 8


#ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
#ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
#ENV PATH $PATH:$NPM_PATH

#RUN export NVM_DIR="${HOME}/.nvm"
#[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh" \
#[ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

#RUN nvm install 8
#RUN nvm use 8
#RUN apt-get install -y nodejs npm

RUN apt-get -y install apt-transport-https ca-certificates

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
#RUN apt-get -y install unzip

RUN npm install -g composer-cli@0.19
RUN npm install -g composer-rest-server@0.19
RUN npm install -g generator-hyperledger-composer@0.19
RUN npm install -g yo
RUN npm install -g composer-playground@0.19


RUN mkdir fabric-dev-servers_install && cd fabric-dev-servers_install

RUN curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
RUN tar -xvf fabric-dev-servers.tar.gz

RUN cd fabric-dev-servers
ENV export FABRIC_VERSION=hlfv11
RUN ./downloadFabric.sh

WORKDIR /fabric-dev-servers_install

CMD /fabric-dev-servers_install/startFabric.sh
