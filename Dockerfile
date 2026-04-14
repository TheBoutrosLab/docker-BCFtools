ARG MINIFORGE_VERSION=26.1.1-2

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

# Use mamba to install tools and dependencies into /usr/local
ARG BCFTOOLS_VERSION=1.23
RUN mamba create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    bcftools==${BCFTOOLS_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:25.04
COPY --from=builder /usr/local /usr/local

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="Mohammed Faizal Eeman Mootor <mmootor@mednet.ucla.edu>" \
      org.opencontainers.image.source=https://github.com/uclahs-cds/docker-BCFtools
