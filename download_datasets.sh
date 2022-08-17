#!/usr/bin/env bash

mkdir -p datasets/

echo "Downloading images ..."
kaggle competitions download -c osic-pulmonary-fibrosis-progression -p datasets

echo "Downloading masks"
kaggle datasets download -d miklgr500/osic-pulmonary-fibrosis-progression-lungs-mask -p datasets/

unzip datasets/osic-pulmonary-fibrosis-progression.zip -d datasets
unzip datasets/osic-pulmonary-fibrosis-progression-lungs-mask.zip -d datasets
