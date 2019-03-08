# Docker based Medium post exported to Markdown

Export [Medium](medium.com) posts to Markdown for reading offline

## Usage
Copy code below to your `~/.bashrc`

```shell
alias mediumexporter='docker run --rm -it -v "$(pwd):/app" mmphego/medium $1 > medium_post.md'
```

## Run Example

```shell
mediumexporter https://medium.com/@macropus/export-your-medium-posts-to-markdown-b5ccc8cb0050
# or
URL="https://medium.com/@macropus/export-your-medium-posts-to-markdown-b5ccc8cb0050"
docker run --rm -it -v "$(pwd):/app" mmphego/medium $URL > medium_post.md
```
See [this project on the Docker Hub](https://hub.docker.com/r/mmphego/mediumexporter).

## Credit
[Export your Medium posts to Markdown](https://medium.com/@macropus/export-your-medium-posts-to-markdown-b5ccc8cb0050)

## Feedback

Feel free to fork it or send me PR to improve it.