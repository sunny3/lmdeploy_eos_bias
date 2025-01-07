FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Copy LMDeploy source code
COPY . /opt/lmdeploy
WORKDIR /opt/lmdeploy

# Install in development mode
RUN pip install -e .


# Run LMDeploy API server
#CMD ["lmdeploy", "serve", "api_server", "/data/L3-TheSpice-8b-v0.8.3", \
#     "--server-port", "23333", \
#     "--tp", "1", \
#     "--cache-max-entry-count", "0.9", \
#     "--session-len", "2500", \
#     "--max-prefill-token-num", "8192"]