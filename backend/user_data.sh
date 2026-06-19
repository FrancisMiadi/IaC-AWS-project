#!/bin/bash
set -e

# ---------------------------
# SYSTEM UPDATE
# ---------------------------
apt-get update -y
apt-get install -y python3-pip python3-venv build-essential git

# ---------------------------
# CREATE APP DIRECTORY
# ---------------------------
mkdir -p /home/ubuntu/app
cd /home/ubuntu/app

# ---------------------------
# CLONE YOUR PROJECT
# ---------------------------
git clone https://github.com/FrancisMiadi/aws_session.git .

# ---------------------------
# CREATE VIRTUAL ENV
# ---------------------------
python3 -m venv venv

# Activate venv and install dependencies
/home/ubuntu/app/venv/bin/pip install --upgrade pip setuptools wheel

# ---------------------------
# INSTALL PYTHON PACKAGES
# (NO VERSION PINNING → avoids EC2 issues)
# ---------------------------
/home/ubuntu/app/venv/bin/pip install \
  flask \
  flask-cors \
  joblib \
  numpy \
  pandas \
  scikit-learn \
  nltk

# ---------------------------
# DOWNLOAD NLTK DATA 
# ---------------------------
/home/ubuntu/app/venv/bin/python -c "import nltk; nltk.download('stopwords')"

# ---------------------------
# FIX PERMISSIONS
# ---------------------------
chown -R ubuntu:ubuntu /home/ubuntu/app

# ---------------------------
# START FLASK APP
# ---------------------------
cd /home/ubuntu/app

nohup /home/ubuntu/app/venv/bin/python app.py > app.log 2>&1 &