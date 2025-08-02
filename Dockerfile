FROM finback9/paraview-base:0.1

ARG Uid=1000
ARG Gid=1000
ARG Pwd="'Developer'"
RUN groupadd --gid $Gid developer && \
    useradd --uid $Uid --gid $Gid --create-home --shell /usr/bin/bash developer && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

USER developer
WORKDIR /home/developer/workspace    
