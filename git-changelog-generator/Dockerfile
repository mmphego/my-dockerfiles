FROM ruby:2.6.3-alpine3.9

LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
# hadolint ignore=DL3018
RUN apk add --no-cache build-base gcc bash cmake git
# hadolint ignore=DL3028
RUN gem install github_changelog_generator

ENV SRC_PATH /usr/local/src/your-app
RUN mkdir -p "${SRC_PATH}"
VOLUME [ "${SRC_PATH}" ]
# hadolint ignore=DL3000
WORKDIR "${SRC_PATH}"
ENTRYPOINT [ "github_changelog_generator" ]
