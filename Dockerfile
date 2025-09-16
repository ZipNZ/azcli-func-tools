
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /install

# ---------------------------
# Install Dependencies
# ---------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lsb-release \
    gnupg \
    wget \
    software-properties-common \
    apt-transport-https \
    libicu-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ---------------------------
# Install Azure CLI
# ---------------------------
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    AZ_REPO=$(lsb_release -cs) && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && \
    apt-get install -y azure-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# ---------------------------
# Install Node.js 22.x
# ---------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
apt-get install -y nodejs && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# ---------------------------
# Install Azure Functions Core Tools v4
# ---------------------------
RUN npm install -g azure-functions-core-tools@4 --unsafe-perm true

CMD ["func"]
