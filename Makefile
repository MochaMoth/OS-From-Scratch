x86_64_asm_source_files := $(shell find Source/Architecture/x86_64 -name *.asm)
x86_64_asm_object_files := $(patsubst Source/Architecture/x86_64/%.asm, Build/x86_64/%.o, $(x86_64_asm_source_files))

$(x86_64_asm_object_files): Build/x86_64/%.o : Source/Architecture/x86_64/%.asm
	mkdir -p $(dir $@) && \
	nasm -f elf64 $(patsubst Build/x86_64/%.o, Source/Architecture/x86_64/%.asm, $@) -o $@

.PHONY: build-x86_64
build-x86_64: $(x86_64_asm_object_files)
	mkdir -p Distribution/x86_64 && .
	x86_64-elf-ld -n -o Distribution/x86_64/kernel.bin -T Targets/x86_64/linker.ld $(x86_64_asm_object_files) && \
	cp Distribution/x86_64/kernel.bin Targets/x86_64/iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o Distribution/x86_64/kernel.iso Targets/x86_64/iso


# To Build:
#    cd to project root
#    docker run --rm -it -v $(pwd):/root/environment os_from_scratch
#    make build-x86_64
#    exit

# To Run:
#    cd to project root
#    qemu-system-x86_64 -cdrom $pwd\Distribution\x86_64\kernel.iso
