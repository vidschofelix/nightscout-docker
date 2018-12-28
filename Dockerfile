
FROM node:8.11.1
MAINTAINER Ben West <bewest@gmail.com>

# TODO
# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/

RUN mkdir -p /opt/app

WORKDIR /opt/app
RUN git clone git://github.com/nightscout/cgm-remote-monitor.git /opt/app
RUN cd /opt/app &&  git checkout ${DEPLOY_HEAD-master}
RUN cd /opt/app && npm install
RUN cd /opt/app && npm run postinstall
RUN cd /opt/app && npm run env
EXPOSE 1337

CMD ["node", "server.js"]
