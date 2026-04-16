ARG MINIFORGE_VERSION=26.1.1-2
ARG BCFTOOLS_ENV=/opt/conda/envs/bcftools

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

# Install BCFtools into an isolated Conda environment instead of mutating base
ARG BCFTOOLS_VERSION=1.23.1
ARG BCFTOOLS_ENV
RUN mamba create -qy -p ${BCFTOOLS_ENV} \
    -c bioconda \
    -c conda-forge \
    bcftools==${BCFTOOLS_VERSION} && \
    mamba clean -afy

# Deploy the target tools into a base image
FROM ubuntu:24.04
ARG BCFTOOLS_ENV
COPY --from=builder ${BCFTOOLS_ENV} ${BCFTOOLS_ENV}
ENV PATH="${BCFTOOLS_ENV}/bin:${PATH}"

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="Rupert Hugh-White <rhughwhite@sbpdiscovery.org>" \
      org.opencontainers.image.source=https://github.com/TheBoutrosLab/docker-BCFtools
