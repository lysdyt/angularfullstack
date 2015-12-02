FROM willchen90/angular-fullstack
MAINTAINER phillipliu

RUN npm install -g yo bower grunt-cli generator-meanjs express generator-angular-fullstack 

RUN mkdir /home/app/

WORKDIR /home/app/

COPY package.json /home/app/
RUN npm install
COPY * /home/app/
RUN bower install --allow-root


EXPOSE 80:80
EXPOSE 443:443
EXPOSE 9000:9000



RUN echo "\n##############################\n1. Create a new user with adduser, 'su' into  that user.\n2. 'yo meanjs' to scaffold your app in the current directory.\n3. Start mongo in the background (e.g. 'mongod &')\n##############################\n"
