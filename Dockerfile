# This Dockerfile is still under construction and waiting to be tested.

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    build-essential \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
ENV MINICONDA_VERSION=py38_4.12.0
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p $CONDA_DIR && \
    rm ~/miniconda.sh && \
    conda clean -ya

# Create conda environment with Python 3.6
RUN conda create -y -n pyprf python=3.6

# Install packages inside the pyprf env using conda run
RUN conda run -n pyprf pip install \
    numpy==1.15.1 \
    scipy==1.1.0 \
    nibabel==2.2.1 \
    cython==0.27.1 \
    Pillow==5.0.0 \
    tensorflow==1.4.0 \
    h5py==2.8.0

WORKDIR /tmp

RUN git clone https://github.com/ingo-m/pyprf.git

RUN conda run -n pyprf pip install /tmp/pyprf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the entrypoint script, default to bash if no CMD is given
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
