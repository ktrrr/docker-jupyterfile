FROM jupyter/datascience-notebook

# https://dev.classmethod.jp/articles/customize-jupyter-docker-stacks-image/
# 追加モジュールのインストール
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --quiet --no-cache-dir --requirement /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

WORKDIR "${HOME}"