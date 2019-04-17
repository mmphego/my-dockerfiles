# Usage:
#   alias git-changelog='docker run -it --rm -v "$PWD:/data" mmphego/git-chglog'
#   or
#   docker run -it --rm -v "$PWD:/data" mmphego/golang

FROM golang:1.11-alpine
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
# hadolint ignore=DL3018
RUN apk add --no-cache build-base gcc bash cmake git
# https://github.com/git-chglog/git-chglog
RUN go get -u github.com/git-chglog/git-chglog/cmd/git-chglog
WORKDIR /data
ENTRYPOINT ["git-chglog"]