FROM jupyter/scipy-notebook:17aba6048f44
RUN whoami
USER root

RUN git clone https://github.com/dask/hdfs3.git
RUN cd ./hdfs3 && ls && python ./setup.py install

# Install in the default python3 environment
RUN pip install 'ggplot==0.6.8'
USER jovyan