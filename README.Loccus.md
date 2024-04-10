# Compile Triton server with custom backend

## Build Pytorch Backend

First select desired branch (in the example: 24.03):

```
$ git checkout r24.03
$ apt-get install patchelf rapidjson-dev python3-dev
$ mkdir build
$ cd build
$ cmake -D-DTRITON_BACKEND_REPO_TAG='r24.03' -DTRITON_CORE_REPO_TAG='r24.03' -DTRITON_COMMON_REPO_TAG='r24.03' -DCMAKE_INSTALL_PREFIX:PATH=`pwd`/install -DTRITON_PYTORCH_DOCKER_IMAGE="nvcr.io/nvidia/pytorch:24.03-py3" ..
$ make install
$ cd ...
```

## Create Docker image

```
docker build . -t tritonserver-loccus:24.03-py3
```

## Publish image to register

```
gcloud auth login
gcloud auth configure-docker europe-docker.pkg.dev
docker tag <image tag, for example: 4f00c79d1c09> europe-docker.pkg.dev/loccus-platform/third-party-images/tritonserver:24.03-custom
docker push europe-docker.pkg.dev/loccus-platform/third-party-images/tritonserver:24.03-custom


