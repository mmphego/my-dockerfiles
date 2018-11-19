# Jekyll Docker

Simplified [Jekyll](https://jekyllrb.com) static-site generator running on a Docker container, because installing ruby and gems plugins and making everything run smoothly isa pain.

By default this container will build and deploy your site to `localhost:4000`

## Usage
Assuming Docker is installed.

### Build image

```shell
cd <username>.github.io
make build
```

### Run Jekyll

```shell
make run # That's it!!!
```

Or just execute `make help`


## Feedback

Feel free to fork it or send me PR to improve it.