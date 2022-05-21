# syntax=docker/dockerfile:1

FROM ruby:slim-buster
WORKDIR /root
# SHELL ["/bin/bash", "-c"]
RUN apt update -y && apt upgrade -y
RUN apt install vim -y && apt install git wget -y && apt install bash-completion -y && apt install gnupg2 -y && apt install libmariadb-dev -y && apt install curl -y
CMD [ "/bin/bash", "gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB" ]
RUN \curl -sSL https://get.rvm.io | bash
# CMD [ "resource", "/etc/profile.d/rvm.sh" ]
# RUN source /etc/profile.d/rvm.sh
RUN /bin/bash -c 'source /etc/profile.d/rvm.sh'

RUN /usr/local/rvm/bin/rvm install ruby-2.4.1
# /usr/local/rvm/bin/rvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
RUN ~/.nvm/install.sh
# RUN nvm install node
# RUN [ "nvm install node" ]
RUN nvm install node
# RUN ["bash", "install node  "]
WORKDIR /myapp
COPY . .
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
