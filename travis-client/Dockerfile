# Usage:
#   alias travis='docker run -it --rm -v "$PWD:/travisapp" travis-ci/cli travis'
#   or
#   docker run -it --rm -v "$PWD:/travisapp" travis-ci/cli travis

FROM ruby:2.5-alpine
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
# hadolint ignore=DL3018
RUN apk add --no-cache build-base gcc bash cmake git
# hadolint ignore=DL3028
RUN gem install travis ffi
WORKDIR /data
ENTRYPOINT ["travis"]
