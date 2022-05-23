# syntax=docker/dockerfile:1

FROM ruby:slim-buster
WORKDIR /root
# SHELL ["/bin/bash", "-c"]
RUN apt update -y && apt upgrade -y
RUN apt install -y vim git wget bash-completion \
        gnupg2 libmariadb-dev curl

RUN /bin/bash -l -c "curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -"
RUN /bin/bash -l -c "curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -"

# install RVM, Ruby, and Bundler
RUN /bin/bash -l -c "curl -L https://get.rvm.io | bash -s stable"
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.4.1"

RUN /usr/local/rvm/bin/rvm install ruby-2.4.1
# /usr/local/rvm/bin/rvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
RUN /bin/bash -l -c "~/.nvm/install.sh"
# RUN nvm install node
# RUN [ "nvm install node" ]
# RUN /bin/bash -l c "rvm install node"
# RUN ["bash", "install node  "]
WORKDIR /myapp
COPY . .
RUN /bin/bash -l "bundle install"

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
