FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="e2ef333f38daab9c24222be891142f2280e856619f83c47cca7c1d0a01240472"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: conda/samtools.yaml
#   prefix: /conda-envs/c874f7a51b6a689ca304a74f6df4ee79
#   channels:
#     - bioconda
#   dependencies:
#     - samtools
RUN mkdir -p /conda-envs/c874f7a51b6a689ca304a74f6df4ee79
COPY conda/samtools.yaml /conda-envs/c874f7a51b6a689ca304a74f6df4ee79/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/c874f7a51b6a689ca304a74f6df4ee79 --file /conda-envs/c874f7a51b6a689ca304a74f6df4ee79/environment.yaml && \
    mamba clean --all -y
