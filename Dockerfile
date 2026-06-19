FROM runpod/worker-comfyui:5.5.1-sdxl
RUN mkdir -p /runpod-volume/models/loras \
             /runpod-volume/models/checkpoints \
             /comfyui/models/loras \
             /comfyui/models/checkpoints
# AnalogRedmond - Analog Style Photography LoRA (ModelVersionID: 177604)
RUN wget -q -O /runpod-volume/models/loras/analogredmond.safetensors \
    "https://civitai.com/api/download/models/177604?token=ee980eb2cd14fe6ca47da80ddc5ba0dc" \
    && cp /runpod-volume/models/loras/analogredmond.safetensors \
          /comfyui/models/loras/analogredmond.safetensors \
    && echo "LoRA: $(ls -lh /runpod-volume/models/loras/analogredmond.safetensors)"
# Damaged Photo Daguerreotype - SDXL (ModelVersionID: 308005) — adds scratches/wear/fingerprints
RUN wget -q -O /runpod-volume/models/loras/damaged_photo_daguerreotype.safetensors \
    "https://civitai.com/api/download/models/308005?token=ee980eb2cd14fe6ca47da80ddc5ba0dc" \
    && cp /runpod-volume/models/loras/damaged_photo_daguerreotype.safetensors \
          /comfyui/models/loras/damaged_photo_daguerreotype.safetensors \
    && echo "LoRA: $(ls -lh /runpod-volume/models/loras/damaged_photo_daguerreotype.safetensors)"
# Juggernaut XL v9 Checkpoint (Optimized for atmospheric/dark realism)
RUN wget -q -O /runpod-volume/models/checkpoints/juggernaut_xl_v9.safetensors \
    "https://huggingface.co/RunDiffusion/Juggernaut-XL-v9/resolve/main/Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors" \
    && cp /runpod-volume/models/checkpoints/juggernaut_xl_v9.safetensors \
          /comfyui/models/checkpoints/juggernaut_xl_v9.safetensors \
    && echo "Checkpoint: $(ls -lh /runpod-volume/models/checkpoints/juggernaut_xl_v9.safetensors)"
