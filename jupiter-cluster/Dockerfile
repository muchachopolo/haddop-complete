# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ARG openjdk_version="8"

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
    "openjdk-${openjdk_version}-jre-headless" \
    ca-certificates-java && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Install pyarrow
RUN conda install --quiet --yes --satisfied-skip-solve \
    'pyarrow=2.0.*' && \
    conda install libhdfs3 && \
    conda install hdfs3 && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN whoami
WORKDIR $HOME