FROM nginx:1.11-alpine

WORKDIR /usr/share/nginx/html

ADD public .
ADD https://github.com/chartjs/Chart.js/releases/download/v2.4.0/Chart.js .

ADD https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css assets/
ADD https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js assets/

RUN chmod -R +r assets
