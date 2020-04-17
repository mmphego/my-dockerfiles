# Jupyter Notebook

A Jupyter Notebook Docker image. It includes the following kernels:

- [fast.ai](https://www.fast.ai/)
- [Pytorch](https://pytorch.org)
- [Tensorflow](https://www.tensorflow.org)
- [Skikit-learn](http://scikit-learn.org/)
- Python 3

## Build & Launch

TODO: Update the readme...

To build:

```shell
docker build --no-cache -t "$USER/$(basename $PWD)" . --build-arg DL_TOOLS=true
```

The default login credentials are `jupyter` for both Username and Password.
To run:

```shell
make start_jupyter ARG="--restart=on-failure:10 -d -p 8000:8000"
```

When you are done you can stop the container.

```shell

```

else you can stop and delete the volume.

```shell

```
