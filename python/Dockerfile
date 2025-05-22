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

# Optional: Pre-warm uv cache or install default packages
# RUN uv --version


# FROM linuxserver/code-server

# # Install Python if not already present
# RUN apt update && \
#     apt install -y python3 python3-pip curl git && \
#     ln -s /usr/bin/python3 /usr/bin/python

# # Install uv (recommended via curl)
# RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# # Ensure uv is in PATH (if needed)
# ENV PATH="/root/.cargo/bin:${PATH}"
