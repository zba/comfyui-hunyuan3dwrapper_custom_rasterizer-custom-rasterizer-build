FROM pytorch/pytorch:2.7.0-${_CUDA_VERSION:-"cuda12.8"}-${_CUDNN_VERSION:-"cudnn9"}-devel as build
ENV TORCH_CUDA_ARCH_LIST=${_CUDA_ARCH:-"12.0+PTX"}

RUN --mount=type=cache,target=/var/cache/apt apt-get update && apt-get install -y \
    git \
    python3-pip
    

WORKDIR /build

COPY .VERSION* /
RUN git clone --depth 1 --single-branch  https://github.com/MrForExample/Comfy3D_Pre_Builds.git

WORKDIR /build/Comfy3D_Pre_Builds/_Libs/hunyuan3d_v2_custom_rasterizer

RUN mkdir -p dist && git rev-parse @ > dist/.VERSION

RUN --mount=type=cache,target=/root/.cache python -m pip install build && python setup.py bdist_wheel

FROM busybox:1.36.1-uclibc as python-slim-comfyui-hunyuan3d-custom-rasterizer

WORKDIR /

COPY --from=build /build/Comfy3D_Pre_Builds/_Libs/hunyuan3d_v2_custom_rasterizer/dist /dist
