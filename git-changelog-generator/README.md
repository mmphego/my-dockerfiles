# Docker based [git-chglog](https://github.com/git-chglog/git-chglog)

![Docker Pulls](https://img.shields.io/docker/pulls/mmphego/git-chglog.svg)
![Docker Automated build](https://img.shields.io/docker/automated/mmphego/git-chglog.svg)

CHANGELOG generator implemented in Go (Golang) running in a Docker image/container.
Thanks to the people that brought us [git-chglog](https://github.com/git-chglog/git-chglog)

## Usage
Copy code below to your `~/.bashrc`

```shell
alias git-changelog='docker run -it --rm -v "$PWD:/data" mmphego/git-chglog'
```

## Run Example

```shell
docker run -it --rm -v "$PWD:/data" mmphego/golang --init
# Then
docker run -it --rm -v "$PWD:/data" mmphego/golang -o CHANGELOG.md
```

See git-chglog documentation: [here](https://github.com/git-chglog/git-chglog/blob/master/README.md)

## Feedback

Feel free to fork it or send me PR to improve it.
