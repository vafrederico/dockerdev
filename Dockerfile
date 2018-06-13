FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&  apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN apt-get update &&  apt-get install -qy build-essential git gdb nodejs npm python2.7 python 2.7-dev python3.6 python3.6-dev \
                                         curl wget xvfb zip \
                                         ruby ruby-dev \
										 libxml2-dev \
										 libxslt1-dev \
										 zlib1g-dev \
										 libsqlite3-dev \
										 zsh \
										 tmux \
										 screen \
										 vim \
										 nano \
										 valgrind \
										 imagemagick
RUN curl https://bootstrap.pypa.io/get-pip.py | python2.7
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6

COPY home/prezto_install.sh /root/prezto_install.sh
RUN chmod +x /root/prezto_install.sh && /root/prezto_install.sh
RUN rm /root/prezto_install.sh
COPY home/zpreztorc /root/.zprezto/runcoms/zpreztorc
COPY home/.tmux.conf /root/.tmux.conf 

RUN pip3 install virtualenv virtualenvwrapper
RUN pip3 install ipython requests
ENTRYPOINT ["/bin/zsh"]
