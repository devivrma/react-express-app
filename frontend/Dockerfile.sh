FROM node:10-alpine as build-step

WORKDIR /src

COPY package.json /src
COPY yarn.lock /src 

RUN npm install

COPY . /src

CMD ["yarn", "start"]
