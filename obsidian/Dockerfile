FROM kasmweb/core-ubuntu-focal:1.14.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

COPY custom_startup.sh $STARTUPDIR/custom_startup.sh
ENV OBSIDIAN_VERSION 1.4.12

RUN apt-get update \
    && apt-get install -y xdg-utils \
    && wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && apt install ./obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && rm -f obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && cp /usr/share/applications/obsidian.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/obsidian.desktop \
    && chown 1000:1000 $HOME/Desktop/obsidian.desktop \
    && chmod +x $STARTUPDIR/custom_startup.sh

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

#USER 1000