ARG MINIFORGE_VERSION=26.1.1-2

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

# Use mamba to install tools into the existing Miniforge base environment
ARG BCFTOOLS_VERSION=1.23
RUN mamba install -qy -n base \
    -c bioconda \
    -c conda-forge \
    bcftools==${BCFTOOLS_VERSION} && \
    mamba clean -afy

# Deploy the target tools into a base image
FROM ubuntu:25.04
COPY --from=builder /opt/conda /opt/conda
ENV PATH=/opt/conda/bin:${PATH}

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="Mohammed Faizal Eeman Mootor <mmootor@mednet.ucla.edu>" \
      org.opencontainers.image.source=https://github.com/uclahs-cds/docker-BCFtools
