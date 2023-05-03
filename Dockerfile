FROM node:14
WORKDIR /
RUN npm install
COPY . .
CMD ["node", "server.js"]
EXPOSE 80
