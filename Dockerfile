FROM ruby:2.6-alpine3.11
# FROM ruby:2.6-slim
#set bundler version
ENV BUNDLER_VERSION=2.1.4
# update container packages
RUN apk add --update --no-cache \
binutils-gold \
build-base \
curl \
file \
g++ \
gcc \
git \
less \
libstdc++ \
libffi-dev \
libc-dev \ 
linux-headers \
libxml2-dev \
libxslt-dev \
libgcrypt-dev \
make \
netcat-openbsd \
nodejs \
openssl \
pkgconfig \
postgresql-dev \
python \
tzdata \
yarn
# install bundler version used for this project
RUN gem install bundler -v 2.1.4
# Go to app directory
WORKDIR /app
# Copy Gems config files
COPY Gemfile Gemfile.lock ./
# Install dependencies
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
COPY . ./ 
# Set privilege to run script, this script remove 
RUN ["chmod", "+x","./entrypoints/docker-entrypoint.sh"]
# Run script
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
# Start the main process in production.
CMD ["rails", "server", "-b", "0.0.0.0"]
