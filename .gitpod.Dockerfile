# ベースイメージを指定 (Python 3.9 を例に)
FROM python:3.9-slim-buster

# 作業ディレクトリを作成
WORKDIR /app

RUN sudo apt-get update
RUN sudo apt-get install git

# requirements.txtから依存パッケージをインストール
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# JupyterLabをインストール
RUN pip install jupyterlab

# JupyterLabの起動コマンド
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888", "--allow-root"]