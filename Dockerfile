FROM docker.io/ubuntu:jammy-20221130

# Install tools needed to install deno
RUN apt update && apt install curl unzip -y

ARG USERNAME=deno
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Set the default user
USER $USERNAME

# Install deno
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

ENV PATH="/home/deno/.deno/bin:$PATH"

ENTRYPOINT [ "deno" ]
