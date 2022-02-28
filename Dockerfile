FROM bitnami/minideb

SHELL ["/bin/bash", "-c"]

LABEL version=0.5

LABEL description="Subcell: Bash script to filter cluster-specific reads from scRNA-seq data."

LABEL author="Ricardo F. dos Santos"

LABEL email="ricardo.santos@nms.unl.pt"

COPY . /bin/app

# Preapre app exec
RUN chmod 755 /bin/app/subcell

WORKDIR /bin/app

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install --assume-yes \
    coreutils \
    curl

RUN ["bash", "-c", "/bin/app/install.sh"]

ENV PATH=$PATH:/root/miniconda3/bin:/bin/app/subcell

CMD ["bash", "subcell"]
