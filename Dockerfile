FROM node:10 AS builder

WORKDIR /usr/src/app
COPY . .
RUN npm install
CMD ["npm", "start"]

FROM node:10
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/index.js .
COPY --from=builder /usr/src/app/package.json .
CMD ["npm", "start"]