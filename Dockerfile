FROM node:16.14.0

WORKDIR /var/app/

ENV TZ=UTC
COPY .npmrc package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build
RUN npm install -g pm2

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
VOLUME [ "/var/app/log" ]
EXPOSE 8081