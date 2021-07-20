FROM node:16-alpine3.11

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD package* $APP_HOME/
RUN npm install

ADD . $APP_HOME

RUN rm -f /app/tmp/pids/server.pid

# Configure the main process to run when running the image
CMD ["npm", "run", "serve"]