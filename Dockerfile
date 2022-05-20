# syntax=docker/dockerfile:1

FROM ruby:2.4.1
WORKDIR /service
RUN wget https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.xz
RUN tar -xvf node-v16.15.0-linux-x64.tar.xz
RUN echo "export PATH=$PATH:/service/node-v16.15.0-linux-x64/bin/" >> ~/.bashrc 
RUN . ~/.bashrc
# RUN npm install --global yarn


WORKDIR /myapp
COPY . .
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]