docker image to distribute ComfyUI with Hunyuan3DWrapper custom rasterizer

## Usage

in your Dockerfile add:

```dockerfile
FROM feat/comfyui-hunyuan3dwrapper_custom_rasterizer:cuda12.8--latest as custom_rasterizer

# then later in your confy Dockerfile section

#....
COPY --from=custom_rasterizer /dist/* /tmp/custom_rasterizer_wheel/
RUN pip install /tmp/custom_rasterizer_wheel/*.whl
```

