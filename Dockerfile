FROM gcc:12.2.0
RUN apt update
RUN apt install -y gdb vim neovim emacs
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> $HOME/.gdbinit

RUN echo "alias asm2bin=\"f(){ \gcc \\\$1 -O0 -g -o tmp && ./tmp; }; f\"" >> $HOME/.bashrc
RUN echo "alias gcc=\"echo gcc command is disabled. use asm2bin command.\n$ asem2bin <asm file>\"" >> $HOME/.bashrc
WORKDIR /root
