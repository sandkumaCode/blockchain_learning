FROM node:8
ENV NPM_CONFIG_LOGLEVEL warn
ARG VERSION=latest
RUN apt-get install -y make gcc g++ python git libc6-compat && \
    su -c "npm config set prefix '/home/composer/.npm-global'" - composer && \
    su -c "npm install --production -g pm2 composer-playground@${VERSION} composer-wallet-redis composer-wallet-cloudant composer-wallet-ibmcos" - composer && \
    su -c "npm cache clean --force" - composer && \

ENV PATH /home/composer/.npm-global/bin:$PATH

# Run in the composer users home directory.
WORKDIR /home/composer

#RUN npm install -g composer-cli@0.19
#RUN npm install -g composer-rest-server@0.19
#RUN npm install -g generator-hyperledger-composer@0.19
#RUN npm install -g yo
#RUN npm install -g composer-playground@0.19

COPY . .

#WORKDIR /fabric-dev-servers_install

CMD tail -f /dev/null