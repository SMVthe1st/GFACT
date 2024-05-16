; Wut the heck is Assembly
; I generally avoid commenting code 'cuz I'm lazy 
; But I'd rather keep what little is left of my sanity

SECTION .data                                ; variables
msg     db      "Hello, world!", 0Ah
size     equ      $ -msg
 
SECTION .text                                ; code
global  _start
 
_start:
    mov     edx, size                        ; msg size
    mov     ecx, msg                         ; msg
    mov     ebx, 1                           ; stdout
    mov     eax, 4                           ; sys_write
    int     80h                              ; puts it together - sys_write(len, msg, stdout)
 
    mov     ebx, 0                           ; return 0
    mov     eax, 1                           ; sys_exit
    int     80h                              ; sys_exit(0)
