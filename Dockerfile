FROM nvcr.io/nvidia/tritonserver:24.01-py3

COPY build/install/backends/pytorch/libtriton_pytorch.so /opt/tritonserver/backends/pytorch/
