# STEP 1: Build the Angular App
FROM node:latest as builder

MAINTAINER Toslim Arif

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build --prod


# STEP 2: Host it through nginx
FROM nginx:alpine
COPY --from=buider /app/dist/toslimarif /usr/share/nginx/html

EXPOSE 80
