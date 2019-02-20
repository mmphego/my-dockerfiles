# Usage:
# docker run --rm -it -v "$(pwd):/app" mmphego/markdownlint markdown-file-with-errors.md

# Using alphine version instead of debian base image
# https://github.com/nodejs/docker-node
# hadolint ignore=DL3006
FROM mhart/alpine-node
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
RUN mkdir -p /app/
WORKDIR /app
# hadolint ignore=DL3016
RUN npm install -g markdownlint markdownlint-cli
ENTRYPOINT [ "markdownlint" ]
