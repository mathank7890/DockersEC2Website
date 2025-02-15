FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Sailor/Sailor.zip
RUN unzip Sailor.zip
RUN mv Sailor/* .
RUN rm -rf Sailor Sailor.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
