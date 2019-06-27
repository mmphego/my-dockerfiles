FROM ruby:2.6.3-alpine3.9

LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
RUN apk add --no-cache build-base gcc bash cmake git

RUN gem install github_changelog_generator

ENV SRC_PATH /usr/local/src/your-app
RUN mkdir -p "${SRC_PATH}"

VOLUME [ "${SRC_PATH}" ]
WORKDIR "${SRC_PATH}"

ENTRYPOINT ["github_changelog_generator"]
