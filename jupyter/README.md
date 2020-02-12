# Jupyter Notebook

A Jupyter Notebook Docker image. It includes the following kernels:

- [fast.ai](https://www.fast.ai/)
- [Pytorch](https://pytorch.org) # CPU based
- [Tensorflow](https://www.tensorflow.org) # CPU based
- [Skikit-learn](http://scikit-learn.org/)
- Python 3

## Build & Launch

To build:

```shell
make build
```

The default login credentials are `jupyter` for both Username and Password.
To run:

```shell
make run
```

When you are done you can stop the container.

```shell
make stop
```

else you can stop and delete the volume.

```shell
make clean
```

## Usage

To follow...

## Feedback

Feel free to fork it or send me PR to improve it.