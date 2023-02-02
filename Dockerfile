FROM nginx:latest

RUN apt-get -y update && apt-get -y install git

RUN git clone https://github.com/damatechguy27/gameapps.git && rm -rf /usr/share/nginx/html/* && cp -rf gameapps/KiwiStory/* /usr/share/nginx/html

RUN rm -rf gameapps/

#COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080:80
#CMD [ "apache2ctl","-D","FOREGROUND"]
CMD exec nginx -g "daemon off;"
