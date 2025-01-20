FROM ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common && apt-add-repository -y ppa:neovim-ppa/unstable && apt-get update && apt-get install -y build-essential curl git neovim fzf

RUN useradd -m tester && echo "tester:pass" | chpasswd && usermod -aG sudo tester && chown -R tester:tester /home/tester
USER tester

RUN echo 'export PATH=$HOME/.local/bin:$PATH' > /home/tester/.bash_aliases
RUN mkdir -p /home/tester/.config
RUN mkdir -p /home/tester/.local/share/ncm
COPY --chown=tester:tester ./ncm /home/tester/.local/bin/ncm

RUN git clone --depth 1 https://github.com/AstroNvim/template /home/tester/AstroNvim
RUN git clone --depth 1 https://github.com/LazyVim/starter /home/tester/.config/LazyVim
# RUN git clone --depth 1 https://github.com/NvChad/starter /home/tester/.config/NvChad

WORKDIR /home/tester
CMD ["/bin/bash"]
