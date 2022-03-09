FROM nginx:1.21-alpine

COPY ./content/index.html /usr/share/nginx/html/index.html