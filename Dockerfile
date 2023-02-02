FROM nginx:latest

RUN apt-get -y update && apt-get -y install git

RUN git clone https://github.com/<yourrepo>.git && rm -rf /usr/share/nginx/html/* && cp -rf <repofolder>/<app you want>/* /usr/share/nginx/html

RUN rm -rf <repofolder>/

#COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080:80
#CMD [ "apache2ctl","-D","FOREGROUND"]
CMD exec nginx -g "daemon off;"
