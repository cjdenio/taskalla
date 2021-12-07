FROM ruby:3.0.3

ARG RAILS_MASTER_KEY=${RAILS_MASTER_KEY}
ENV RAILS_ENV production

WORKDIR /usr/src/app

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN bin/rails assets:precompile && yarn cache clean

CMD ["bin/rails", "server"]
