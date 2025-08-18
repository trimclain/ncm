FROM ubuntu:latest

# software-properties-common: for apt-add-repository; build-essential: for gcc, make
RUN apt-get update && apt-get install -y software-properties-common build-essential curl git fzf
RUN apt-add-repository -y ppa:neovim-ppa/unstable && apt-get update && apt-get install -y neovim

RUN useradd -m tester && echo "tester:pass" | chpasswd && usermod -aG sudo tester && chown -R tester:tester /home/tester
USER tester

RUN echo 'export PATH=$HOME/.local/bin:$PATH' > /home/tester/.bash_aliases
RUN mkdir -p /home/tester/.config
RUN mkdir -p /home/tester/.local/share/ncm
COPY --chown=tester:tester ./ncm /home/tester/.local/bin/ncm

WORKDIR /home/tester
CMD ["/bin/bash"]
