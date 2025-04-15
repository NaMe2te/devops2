FROM alpine:latest

RUN apk add --no-cache nginx && \
    mkdir -p /var/www/html && \
    mkdir -p /run/nginx && \
    chown -R nginx:nginx /var/www/html && \
    chown -R nginx:nginx /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY html /var/www/html

WORKDIR /var/www/html

USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]