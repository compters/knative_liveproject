FROM node:17.3.0-stretch-slim

WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY index.js .

ENV PORT 8080
CMD [ "node", "index.js" ]