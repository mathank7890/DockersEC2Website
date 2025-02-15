FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Green/Green.zip .
RUN unzip Green.zip
RUN mv Green/* .
RUN rm -rf Green Green.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
