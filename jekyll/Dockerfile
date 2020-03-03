# Usage:
# docker run --rm --name=jekyll -v "$PWD:/site" -p 4000:4000 mmphego/jekyll

FROM ruby:2.5-alpine
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
# hadolint ignore=DL3018
RUN apk add --no-cache build-base gcc bash cmake
# hadolint ignore=DL3028
RUN gem install bundler rails jekyll
WORKDIR /site
COPY entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
