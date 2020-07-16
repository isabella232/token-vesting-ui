FROM  node:13.8.0
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npx truffle compile
EXPOSE 3000
CMD [ "npm","start" ]