# copied from https://github.com/Starefossen/docker-ruby-node/blob/master/2-5/onbuild/Dockerfile
FROM ruby:2

# gpg keys listed at https://github.com/nodejs/node
RUN set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_MAJOR_VERSION 6

RUN NODE_VERSION=$(curl -SL "https://nodejs.org/dist/index.tab" \
                 | grep "v${NODE_MAJOR_VERSION}" \
                 | head -n 1 | awk '{ print $1 }') \
  && curl -SLO "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz" \
  && curl -SLO "https://nodejs.org/dist/${NODE_VERSION}/SHASUMS256.txt.asc" \
  && gpg --verify SHASUMS256.txt.asc \
  && grep " node-${NODE_VERSION}-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
  && tar -xzf "node-${NODE_VERSION}-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-${NODE_VERSION}-linux-x64.tar.gz" SHASUMS256.txt.asc

WORKDIR /src

# install ruby dependencies (to /usr/local/bundle/)
COPY Gemfile /src/
COPY Gemfile.lock /src/
RUN bundle install

# install npm dependencies (locally, which means /src/node_modules must be a Volume!)
COPY package.json /src/
RUN npm install \
  && npm cache clean --force

EXPOSE 4000
ENTRYPOINT ["jekyll"]
