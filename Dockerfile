FROM ruby:3.2.1
RUN apt-get update -qq && apt-get install -y nodejs mariadb-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn
RUN mkdir /wallet-api
WORKDIR /wallet-api
COPY Gemfile /wallet-api/Gemfile
COPY Gemfile.lock /wallet-api/Gemfile.lock
RUN bundle install
COPY . /wallet-api
# RUN apt-get install -y fonts-ipafont

# RUN yarn install

# # Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]