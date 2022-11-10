FROM nginx:1.23
#ENV NGINX_PORT=8080
# Port used from Cloud Run
#ENV PORT=80
COPY docker_cloudrun/default.conf /etc/nginx/conf.d/default.conf
COPY build /usr/share/nginx/html
