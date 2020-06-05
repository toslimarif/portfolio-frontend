# STEP 1: Build the Angular App
FROM node:12-alpine as builder

LABEL maintainer="ariftoslim@gmail.com"

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build


# STEP 2: Host it through nginx
FROM nginx:alpine
COPY --from=builder /app/dist/toslimarif /usr/share/nginx/html

EXPOSE 80
