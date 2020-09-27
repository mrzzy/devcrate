#
# devcrate-cloud
# Dockerfile
#

ARG REGISTRY=docker.io
ARG VERSION=latest
FROM $REGISTRY/mrzzy/devcrate:$VERSION

# install package dependencies
# gcloud, kubectl & linux networking tools
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -  \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN sudo apt-get update && sudo apt-get install -y  \
    unzip  kubectl google-cloud-sdk \
    tcpdump traceroute nmap dnsutils \
    && sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# aws cli
RUN pip3 install --no-cache-dir --user wheel awscli 

# terraform
RUN TF_VERSION=$(curl --silent "https://api.github.com/repos/hashicorp/terraform/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -c 2-) \
    && wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
    && sudo unzip -d /usr/local/bin/ terraform_${TF_VERSION}_linux_amd64.zip \ 
    && rm terraform_${TF_VERSION}_linux_amd64.zip

# terraform - language server for commpletion.
# .[1:] - remove prefix 'v' from version tag.
RUN TF_LS_VERSION=$(curl --silent "https://api.github.com/repos/hashicorp/terraform-ls/releases/latest" | jq -r ".tag_name | .[1:]")
    && wget http://releases.hashicorp.com/terraform-ls/${TF_LS_VERSION}/terraform-ls_${TF_LS_VERSION}_linux_amd64.zip \
    && sudo unzip -d /usr/local/bin/ terraform-ls_${TF_LS_VERSION}_linux_amd64.zip \
    && rm terraform-ls_${TF_LS_VERSION}_linux_amd64.zip

# helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# kops
USER root
RUN curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 && chmod +x ./kops && mv ./kops /usr/local/bin/
USER $USERNAME
