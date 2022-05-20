# syntax=docker/dockerfile:1
# FROM    debian:buster-slim

# WORKDIR /service
# RUN wget https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.xz
# RUN tar -xvf node-v16.15.0-linux-x64.tar.xz

# WORKDIR /opt/vim
# RUN wget ftp://ftp.vim.org/pub/vim/unix/vim-8.1.tar.bz2
# RUN tar xf vim-8.1.tar.bz2

# WORKDIR /opt/vim/vim81
# RUN make
# RUN echo "/opt/vim/vim81/src/vim" >> /etc/ld.so.conf.d/vim.conf

# RUN echo "export PATH=$PATH:/service/node-v16.15.0-linux-x64/bin/:/opt/vim/vim81/src/vim*" >> ~/.bashrc 
# RUN echo "alias vim='/opt/vim/vim81/src/vim'" >> ~/.bashrc
# RUN . ~/.bashrc
# CMD [ "npm","install --global", "yarn" ]
# # RUN npm install --global yarn
# WORKDIR /myapp
# COPY . .
# RUN gem install execjs
# RUN gem install uglifier
# RUN bundle install

# EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]

FROM    debian:buster-slim
WORKDIR /root
RUN apt update -y && apt upgrade -y
RUN apt install vim git wget bash-completion gnupg2 curl -y
# RUN apt install vim bundler wget bash-completion gnupg2 curl -y
# RUN . /etc/bash_completion
# RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# RUN curl -sSL https://get.rvm.io | bash -s stable --rails
# CMD [ "\curl -sSL https://get.rvm.io | bash -s stable --rails" ]
# RUN . ~/.bash


# WORKDIR /opt/ruby
# RUN wget https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.bz2
# RUN tar xvf ruby-2.4.1.tar.bz2
# RUN rm *.bz2
# WORKDIR /opt/ruby/ruby-2.4.1
# RUN ./configure
# RUN make
# RUN cp ruby /usr/bin/

WORKDIR /myapp
COPY . .

