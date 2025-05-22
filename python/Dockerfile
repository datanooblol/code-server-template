FROM linuxserver/code-server

# Install system dependencies
RUN apt update && \
    apt install -y python3 python3-pip curl git && \
    ln -s /usr/bin/python3 /usr/bin/python

# Set environment so uv installs into a persistent, user-level path
ENV UV_HOME=/config/.local
ENV PATH="${UV_HOME}/bin:${PATH}"

# Install uv using official installer
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
