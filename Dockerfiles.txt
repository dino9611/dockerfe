# base image
FROM nginx 

WORKDIR /usr/share/nginx/html
# kiri soruce kanan target / destination aka workdir
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY build/ . 

EXPOSE 80

CMD ["nginx","-g","daemon off;"]