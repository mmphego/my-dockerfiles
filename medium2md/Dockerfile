# Usage:
# Credit goes to https://medium.com/@macropus
# URL="https://medium.com/@macropus/export-your-medium-posts-to-markdown-b5ccc8cb0050"
# docker run --rm -it -v "$(pwd):/app" mmphego/mediumexporter $URL > medium_post.md

# Using alphine version instead of debian base image
# https://github.com/nodejs/docker-node
# hadolint ignore=DL3006
FROM mhart/alpine-node
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
RUN mkdir -p /app/
WORKDIR /app
# hadolint ignore=DL3016
RUN npm install -g mediumexporter@latest
ENTRYPOINT [ "mediumexporter" ]
