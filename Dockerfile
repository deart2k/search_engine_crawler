FROM ubuntu:16.04
RUN apt-get update && apt-get install -y  python3-pip 
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
RUN pip3 install -r requirements.txt
ENV MONGO mongo
ENV MONGO_POR 27017
ENV RMQ_HOST rabbit
ENV RMQ_QUEUE urls
ENV RMQ_USERNAME guest
ENV RMQ_PASSWORD guest
ENV CHECK_INTERVAL -1
ENV EXCLUDE_URLS .*github.com
RUN chmod 0777 start.sh && chmod 0777 test.sh
CMD ["/app/start.sh"]
