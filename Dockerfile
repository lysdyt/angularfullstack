FROM willchen90/angular-fullstack
MAINTAINER phillipliu

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

RUN apt-get update 

#RUN apt-get install -y mongodb-org
RUN apt-get install -y mongodb-org git python build-essential curl
RUN service mongod start

RUN mkdir -p /data/db


RUN npm install -g yo bower grunt-cli generator-meanjs express generator-angular-fullstack 

RUN mkdir /home/product/

WORKDIR /home/product/

COPY package.json /home/product/
RUN npm install
COPY * /home/product/
RUN bower install --allow-root


EXPOSE 80:80
EXPOSE 443:443
EXPOSE 9000:9000



RUN echo "\n##############################\n1. Create a new user with adduser, 'su' into  that user.\n2. 'yo meanjs' to scaffold your app in the current directory.\n3. Start mongo in the background (e.g. 'mongod &')\n##############################\n"
