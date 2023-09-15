FROM kasmweb/core-ubuntu-focal:1.14.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

COPY custom_startup.sh $STARTUPDIR/custom_startup.sh
ENV SLACK_VERSION 4.33.90

RUN apt-get update \
    && apt-get install -y xdg-utils \
    && wget https://downloads.slack-edge.com/releases/linux/${SLACK_VERSION}/prod/x64/slack-desktop-${SLACK_VERSION}-amd64.deb \
    && apt install ./slack-desktop-${SLACK_VERSION}-amd64.deb \
    && rm -f ./slack-desktop-${SLACK_VERSION}-amd64.deb \
    && cp /usr/share/applications/slack.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/slack.desktop \
    && chown 1000:1000 $HOME/Desktop/slack.desktop \
    && chmod +x $STARTUPDIR/custom_startup.sh

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

#USER 1000