# Dockerized Github Changelog Generator

This is a non-official containerization of [Github Changelog Generator](https://github.com/skywinder/github-changelog-generator).

For each Github Changelog Generator release, you will find the corresponding docker image tag.
# Building
```bash
make build
```

# Usage

```bash
alias git-changlog='docker run -it --rm -v "$(pwd)":/usr/local/src/your-app mmphego/git-changelog-generator' >> ~/.bashrc
```
