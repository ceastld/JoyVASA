conda deactivate
conda env remove -n joyvasa -y
conda create -n joyvasa python=3.10 -y
conda activate joyvasa
ml cuDNN/8.7.0.84-CUDA-11.8.0
pip install -r requirements.txt
cd src/utils/dependencies/XPose/models/UniPose/ops
python setup.py build install
cd -

mkdir -p pretrained_weights
cd pretrained_weights
huggingface-cli download jdh-algo/JoyVASA --local-dir JoyVASA --exclude "*.git*" "README.md" "docs"
huggingface-cli download TencentGameMate/chinese-hubert-base --local-dir chinese-hubert-base --exclude "*.git*" "README.md" "docs"
huggingface-cli download facebook/wav2vec2-base-960h --local-dir wav2vec2-base-960h --exclude "*.git*" "README.md" "docs"
huggingface-cli download KwaiVGI/LivePortrait --local-dir . --exclude "*.git*" "README.md" "docs"
cd -
