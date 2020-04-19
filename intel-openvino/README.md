# Intel OpenVINO Toolkit

An Intel® OpenVINO™ Toolkit environment Docker image.

## Build & Launch

To build:

```shell
docker build --no-cache -t "$USER/$(basename $PWD)" .
```

To run:

```shell
docker run -ti "$USER/$(basename $PWD)"
# or from root:
# make shell_intel-openvino
```
