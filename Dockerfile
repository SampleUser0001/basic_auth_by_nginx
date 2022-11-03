FROM nginx:latest

RUN apt update && apt -y upgrade
RUN apt install -y apache2-utils

