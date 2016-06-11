FROM ubuntu:14.04

RUN apt-get -yqq update
RUN apt-get -yqq install python-pip python-dev nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

ADD app /opt/flask-app
WORKDIR /opt/flask-app

RUN npm install
RUN npm run build
RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "python", "./app.py" ]
