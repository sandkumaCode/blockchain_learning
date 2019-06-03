FROM node:8

RUN npm install -g composer-cli@0.19
RUN npm install -g composer-rest-server@0.19
RUN npm install -g generator-hyperledger-composer@0.19
RUN npm install -g yo
RUN npm install -g composer-playground@0.19

COPY . .

WORKDIR /fabric-dev-servers_install

CMD tail -f /dev/null