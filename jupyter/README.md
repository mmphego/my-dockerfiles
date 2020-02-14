# Jupyter Notebook

A Jupyter Notebook Docker image. It includes the following kernels:

- [fast.ai](https://www.fast.ai/)
- [Pytorch](https://pytorch.org)
- [Tensorflow](https://www.tensorflow.org)
- [Skikit-learn](http://scikit-learn.org/)
- Python 3

## Build & Launch

To build:

```shell
make build_jupyter
```

The default login credentials are `jupyter` for both Username and Password.
To run:

```shell
make start_jupyter ARG="--restart=on-failure:10 -d -p 8000:8000"
```

When you are done you can stop the container.

```shell
make stop
```

else you can stop and delete the volume.

```shell
make clean
```
