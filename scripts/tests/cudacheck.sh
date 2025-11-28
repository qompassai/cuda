#!/bin/bash
# /qompassai/cuda/scripts/cudacheck.sh
# ---------------------------------------
# Copyright (C) 2025 Qompass AI, All rights reserved

echo "🔍 Verifying System CUDA 12.8.1 Integration"
echo "============================================"

echo "📦 System CUDA Installation:"
/opt/cuda/bin/nvcc --version 2>/dev/null || echo "❌ System CUDA not found"

echo ""
echo "🖥️  NVIDIA Driver:"
nvidia-smi --query-gpu=driver_version --format=csv,noheader 2>/dev/null || echo "❌ NVIDIA driver not accessible"

echo ""
echo "🐍 Conda Environment:"
echo "CUDA_HOME: $CUDA_HOME"
echo "PATH includes CUDA: $(echo $PATH | grep -o '/opt/cuda/bin' || echo 'No')"
echo "LD_LIBRARY_PATH includes CUDA: $(echo $LD_LIBRARY_PATH | grep -o '/opt/cuda' || echo 'No')"

echo ""
echo "🔥 PyTorch CUDA Test:"
python -c "
import torch
print(f'PyTorch version: {torch.__version__}')
print(f'CUDA available: {torch.cuda.is_available()}')
if torch.cuda.is_available():
    print(f'CUDA version: {torch.version.cuda}')
    print(f'GPU device: {torch.cuda.get_device_name(0)}')
else:
    print('❌ CUDA not available in PyTorch')
" 2>/dev/null || echo "❌ PyTorch not installed or CUDA test failed"
