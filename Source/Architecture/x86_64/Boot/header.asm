section .multiboot_header
header_start:
    dd 0xe85250d6 ; multiboot2
    dd 0 ; protected mode i386
    dd header_end - header_start
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))
    
    dw 0 ;Start End Tag
    dw 0
    dd 8 ; End End Tag

header_end:
    ;
