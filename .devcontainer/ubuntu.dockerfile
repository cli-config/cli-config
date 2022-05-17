ARG UBUNTU_VERSION

FROM ubuntu:${UBUNTU_VERSION}

ARG USERNAME=cli-config-user
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y &&  \
    apt install sudo vim zsh git wget curl ca-certificates --no-install-recommends -y

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && touch /home/$USERNAME/.zshrc

USER ${USERNAME}

ENV SHELL /usr/bin/zsh

ENTRYPOINT $SHELL