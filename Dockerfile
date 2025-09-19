# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.4.1-base

# install custom nodes into comfyui
RUN comfy-node-install comfyui-kjnodes@08a22951ed624ca90146e33626b3204d8b8f8ad0

# download models and put them into the correct folders in comfyui (one RUN per model)
RUN comfy model download --url https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-schnell-fp8.safetensors --relative-path diffusion_models/FLUX1 --filename flux1-schnell-fp8.safetensors
RUN comfy model download --url https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth --relative-path models/upscale_models --filename RealESRGAN_x2.pth

# copy all input data (like images or videos) into comfyui
# COPY input/ /comfyui/input/