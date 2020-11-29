FROM node:12


RUN npm install --global pm2


COPY ./ ./
RUN rm -rf node_modules
RUN npm install

RUN NODE_ENV=production npm run build

EXPOSE 1337

RUN chmod +x ./start.sh

CMD ["./start.sh"]