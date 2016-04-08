# Set the base image to Ubuntu
FROM    ubuntu

# File Author / Maintainer
MAINTAINER phillipliu

# Update the repository
RUN apt-get update



# Install Node.js and other dependencies

RUN apt-get -y install curl

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN apt-get -y install git python build-essential nodejs



# Install nodemon

RUN npm install -g nodemon pm2


RUN npm install -g yo bower grunt-cli generator-meanjs express generator-angular-fullstack 

# Bundle app source
RUN mkdir /home/app/
COPY . /home/app/


WORKDIR /home/app/
# Install app dependencies

RUN  npm install

RUN bower install --allow-root


EXPOSE 80:80
EXPOSE 443:443
EXPOSE 9000:9000



RUN echo "\n##############################\n1. Create a new user with adduser, 'su' into  that user.\n2. 'yo meanjs' to scaffold your app in the current directory.\n3. Start mongo in the background (e.g. 'mongod &')\n##############################\n"
