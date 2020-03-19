FROM ubuntu:18.04

ENV LANG C.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL C.UTF-8  
CMD locale-gen

#RUN adduser -D yavs-api
RUN apt update && apt full-upgrade -y
RUN apt install -y python3-flask


COPY . /root/yavs
RUN cd /root/yavs
#RUN chmod +x boot.sh
RUN /root/yavs/install.sh
WORKDIR /root/yavs

ENV FLASK_APP app.py

#RUN chown -R yavs-api:yavs-api ./
#USER yavs-api

EXPOSE 8000
CMD ["/bin/bash", "-c", "pwd"]
CMD ["/bin/bash", "-c", "gunicorn --bind=0.0.0.0:8000 app:app"]