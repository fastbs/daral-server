FROM node:latest
WORKDIR /usr/src/serv
COPY package*.json ./
COPY . .
RUN npm install
EXPOSE 3000
# CMD cd /usr/src/serv
CMD npm run start

