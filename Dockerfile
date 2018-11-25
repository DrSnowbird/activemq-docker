FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## -------------------------------------------------------------------------------
## ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
## -------------------------------------------------------------------------------
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}
ENV PRODUCT_WORKSPACE=${HOME}/activemq-gui-workspace

## ----------------------------------------------------------------------------
## ---- To change to different Product version:! ----
## ----------------------------------------------------------------------------

## -- 0.) Product Provider and Name: -- ##
ARG PRODUCT_PROVIDER=${PRODUCT_PROVIDER:-activemq}
ENV PRODUCT_PROVIDER=${PRODUCT_PROVIDER}

ARG PRODUCT_NAME=${PRODUCT_NAME:-apache-activemq}
ENV PRODUCT_NAME=${PRODUCT_NAME}

ENV PRODUCT_EXE=${PRODUCT_EXE:-activemq}

## -- 1.) Version: -- ##
ARG PRODUCT_VERSION=${PRODUCT_VERSION:-5.15.7}
ENV PRODUCT_VERSION=${PRODUCT_VERSION}

## -- 2.) Product Type: -- ##
ARG PRODUCT_TYPE=${PRODUCT_TYPE:-activemq}

## -- 3.) Product Release: -- ##
ARG PRODUCT_RELEASE=${PRODUCT_RELEASE:-releases}

## -- 4.) Product Download Mirror site: -- ##
ARG PRODUCT_OS_BUILD=${PRODUCT_OS_BUILD}

## -- 5.) Product Download Mirror site: -- ##
# http://archive.apache.org/dist/activemq/5.15.7/apache-activemq-5.15.7-bin.tar.gz
ARG PRODUCT_MIRROR_SITE_URL=${PRODUCT_MIRROR_SITE_URL:-http://archive.apache.org}

## ----------------------------------------------------------------------------------- ##
## ----------------------------------------------------------------------------------- ##
## ----------- Don't change below unless Product download system change -------------- ##
## ----------------------------------------------------------------------------------- ##
## ----------------------------------------------------------------------------------- ##
## -- Product TAR/GZ filename: -- ##
#ARG PRODUCT_TAR=${PRODUCT_TAR:-apache-activemq-5.15.7-bin.tar.gz}
ARG PRODUCT_TAR=${PRODUCT_TAR:-${PRODUCT_NAME}-${PRODUCT_VERSION}-bin.tar.gz}

## -- Product Download route: -- ##
ARG PRODUCT_DOWNLOAD_ROUTE=${PRODUCT_DOWNLOAD_ROUTE:-dist/${PRODUCT_TYPE}/${PRODUCT_VERSION}}

## -- Product Download full URL: -- ##
ARG PRODUCT_DOWNLOAD_URL=${PRODUCT_DOWNLOAD_URL:-${PRODUCT_MIRROR_SITE_URL}/${PRODUCT_DOWNLOAD_ROUTE}}

WORKDIR /opt
RUN sudo wget -c ${PRODUCT_DOWNLOAD_URL}/${PRODUCT_TAR} && \
    sudo tar xvf ${PRODUCT_TAR} && \
    sudo ln -s ${PRODUCT_NAME}-${PRODUCT_VERSION} ${PRODUCT_PROVIDER} && \
    sudo rm ${PRODUCT_TAR} 

#################################
#### Install Libs or Plugins ####
#################################
# ... add Product plugin if any 

##################################
#### Set up user environments ####
##################################
VOLUME ${PRODUCT_WORKSPACE}
VOLUME ${HOME}/.${PRODUCT_NAME}-${PRODUCT_VERSION} 

RUN mkdir -p ${PRODUCT_WORKSPACE} ${HOME}/.${PRODUCT_NAME}-${PRODUCT_VERSION} && \
    sudo chown -R ${USER_NAME}:${USER_NAME} ${PRODUCT_WORKSPACE}

RUN \
    echo "PRODUCT_TAR=${PRODUCT_TAR}" && \
    echo "PRODUCT_HOME=${PRODUCT_HOME}" && \
    echo "PRODUCT_VERSION=${PRODUCT_VERSION}" 

##################################
#### ---- Expose Ports ----   ####
##################################
## -- ActiveMQ Admin Web UI --
EXPOSE 8161
## -- mqtt --
EXPOSE 1883/tcp
## -- amqp --
EXPOSE 5672/tcp
## -- stomp --
EXPOSE 61613/tcp
## -- ws --
EXPOSE 61614/tcp
## -- openwire --
EXPOSE 61616/tcp

##################################
#### ---   Starting up   ---- ####
##################################
WORKDIR ${HOME}
USER ${USER_NAME}

#### --- Copy Entrypoint script in the container ---- ####
COPY ./docker-entrypoint.sh /

#### --- Enterpoint for container ---- ####
ENV JAVA_HOME="/usr/java"
ENV EXE_COMMAND="/opt/${PRODUCT_PROVIDER}/bin/${PRODUCT_EXE} start"

ENTRYPOINT ["/docker-entrypoint.sh"]

#### --- For debug only ---- ####
#CMD ["/usr/bin/firefox"]

