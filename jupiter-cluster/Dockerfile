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

RUN pip install paramiko
RUN pip install sparkmagic
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter labextension install "@jupyter-widgets/jupyterlab-manager"
RUN pip show sparkmagic

USER root
RUN jupyter-kernelspec install /opt/conda/lib/python3.8/site-packages/sparkmagic/kernels/sparkkernel
RUN jupyter-kernelspec install /opt/conda/lib/python3.8/site-packages/sparkmagic/kernels/pysparkkernel
RUN jupyter-kernelspec install /opt/conda/lib/python3.8/site-packages/sparkmagic/kernels/sparkrkernel
USER $NB_UID

RUN jupyter serverextension enable --py sparkmagic
RUN whoami

RUN pip install dash==0.21.1
RUN pip install dash-renderer==0.13.0
RUN pip install dash-html-components==0.11.0
RUN pip install dash-core-components==0.23.0
RUN pip install dash-auth==1.0.0
RUN pip install plotly --upgrade

RUN pip install jupyter-dash

RUN conda install plotly &&\
    conda install jupyter-dash &&\
    conda install wordcloud

RUN jupyter lab build

WORKDIR $HOME