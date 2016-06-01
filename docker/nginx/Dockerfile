FROM nginx:1.11-alpine

WORKDIR /usr/share/nginx/html

ADD public .
ADD https://raw.githubusercontent.com/chartjs/Chart.js/master/dist/Chart.js .

ADD https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css assets/
ADD https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js assets/

RUN chmod -R +r assets
