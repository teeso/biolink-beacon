FROM ubuntu:16.04

RUN apt-get -y update
# It complains if apt-utils is not installed
RUN apt-get -y install apt-utils
RUN apt-get -y install python3
RUN apt-get -y install python3-pip

# For some reason version 8.1.1 installs, rather than version 9.0.1
RUN pip3 install --upgrade pip

RUN pip3 install Flask
RUN pip3 install ontobio
RUN pip3 install pymongo

# Copying files into Docker container
COPY main.py /home/main.py
COPY conf/config.yaml /home/conf/config.yaml

# Setting environment variables
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV FLASK_APP=/home/main.py

ENTRYPOINT ["flask", "run", "-h", "0.0.0.0"]
