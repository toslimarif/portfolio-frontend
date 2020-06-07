# STEP 1: Build the Angular App
FROM node:12-alpine as builder

LABEL maintainer="ariftoslim@gmail.com"

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build


# STEP 2: Host it through nginx
FROM nginx:alpine
## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
## Copy custom configuration
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/dist/toslimarif /usr/share/nginx/html

EXPOSE 80
