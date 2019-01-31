# Docker based Markdown Linter

[markdownlint](https://github.com/DavidAnson/markdownlint) running in a Docker container.

## Usage
Copy code below to your `~/.bashrc`

```shell
alias markdownlint='docker run --rm -it -v "$(pwd):/app" mmphego/markdownlint'
```

## Run Example

```shell
markdownlint markdown-file-with-errors.md
# or
docker run --rm -it -v "$(pwd):/app" mmphego/markdownlint markdown-file-with-errors.md
```
See [this project on the Docker Hub](https://hub.docker.com/r/mmphego/markdownlint).

## Feedback

Feel free to fork it or send me PR to improve it.
