FROM node:20-alpine AS builder
WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --legacy-peer-deps

COPY . .

EXPOSE 3000
CMD ["npm", "run", "start"]
