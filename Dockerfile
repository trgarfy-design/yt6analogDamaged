FROM runpod/worker-comfyui:5.5.1-base

RUN mkdir -p /comfyui/models/loras /comfyui/models/checkpoints

# AnalogRedmond LoRA (ModelVersionID: 177604)
RUN wget -q -O /comfyui/models/loras/analogredmond.safetensors \
    "https://civitai.com/api/download/models/177604?token=ee980eb2cd14fe6ca47da80ddc5ba0dc" \
    && echo "LoRA: $(ls -lh /comfyui/models/loras/analogredmond.safetensors)"

# Damaged Photo Daguerreotype LoRA (ModelVersionID: 308005)
RUN wget -q -O /comfyui/models/loras/damaged_photo_daguerreotype.safetensors \
    "https://civitai.com/api/download/models/308005?token=ee980eb2cd14fe6ca47da80ddc5ba0dc" \
    && echo "LoRA: $(ls -lh /comfyui/models/loras/damaged_photo_daguerreotype.safetensors)"

# Juggernaut XL v9 Checkpoint (brings its own VAE — no separate VAE needed)
RUN wget -q -O /comfyui/models/checkpoints/juggernaut_xl_v9.safetensors \
    "https://huggingface.co/RunDiffusion/Juggernaut-XL-v9/resolve/main/Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors" \
    && echo "Checkpoint: $(ls -lh /comfyui/models/checkpoints/juggernaut_xl_v9.safetensors)"
