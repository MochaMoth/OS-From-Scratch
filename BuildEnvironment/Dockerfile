FROM randomdude/gcc-cross-x86_64-elf

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nasm xorriso grub-pc-bin grub-common

VOLUME /root/environment
WORKDIR /root/environment
