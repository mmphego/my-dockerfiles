# Jupyter Notebook

A Jupyter Notebook Docker image. It includes the following kernels:

- [fast.ai](https://www.fast.ai/)
- Python 3

## Build & Launch

To build:

```
$ make build
```

The default login credentials are `jupyter` for both Username and Password.
To run:

```
$ make run
```

When you are done you can stop the container.
```bash
$ make stop
```
else you can stop and delete the volume.

```
$ make clean
```

## Usage

To follow...