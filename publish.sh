#!/bin/bash -x
. ./.env
docker compose run --build --rm custom-rasterizer-build 

docker tag comfyui-hunyuan3dwrapper_custom_rasterizer-custom-rasterizer-build feat/comfyui-hunyuan3dwrapper_custom_rasterizer:${_CUDA_VERSION}--1
docker tag comfyui-hunyuan3dwrapper_custom_rasterizer-custom-rasterizer-build feat/comfyui-hunyuan3dwrapper_custom_rasterizer:${_CUDA_VERSION}--latest

docker push feat/comfyui-hunyuan3dwrapper_custom_rasterizer:${_CUDA_VERSION}--2
docker push feat/comfyui-hunyuan3dwrapper_custom_rasterizer:${_CUDA_VERSION}--latest 