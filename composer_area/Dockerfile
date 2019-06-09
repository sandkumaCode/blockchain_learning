FROM node:8-alpine
ENV NPM_CONFIG_LOGLEVEL warn
ARG VERSION=latest

RUN deluser --remove-home node && \
    addgroup -g 1000 -S composer && \
    adduser -u 1000  -S composer -s /bin/sh -D composer && \
    apk add --no-cache make gcc g++ python git libc6-compat && \
    su -c "npm config set prefix '/home/composer/.npm-global'" - composer && \
    su -c "npm install --production -g pm2 composer-playground@${VERSION} composer-wallet-redis composer-wallet-cloudant composer-wallet-ibmcos" - composer && \
    su -c "npm cache clean --force" - composer
#    && \
#    rm -rf /home/composer/.config /home/composer/.node-gyp /home/composer/.npm && \
#    apk del make gcc g++ python git

USER composer

# Run as the composer user ID.
USER composer

# Add global composer modules to the path.
ENV PATH /home/composer/.npm-global/bin:$PATH

# Run in the composer users home directory.
WORKDIR /home/composer

RUN npm install -g composer-cli
#@0.19
RUN npm install -g composer-rest-server
#@0.19
RUN npm install -g generator-hyperledger-composer
#@0.19
RUN npm install -g yo
RUN npm install -g composer-playground
#@0.19

#COPY . .
RUN mkdir fabric-dev-servers_install && cd fabric-dev-servers_install
COPY fabric-dev-servers_install/* ./fabric-dev-servers_install


#WORKDIR /fabric-dev-servers_install

CMD tail -f /dev/null