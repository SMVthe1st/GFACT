SECTION .data               
msg     db      "Hello, world!", 0Ah
size    equ      $ -msg
 
SECTION .text               
global  _start
 
_start:                     
    mov     eax, 5          ; start loop at 5
 
loop:
    push    eax             ; push eax val to stack to not overwrite (sys_write needs eax)
    mov     edx, size       ; size
    mov     ecx, msg        ; msg
    mov     ebx, 1          ; stdout
    mov     eax, 4          ; sys_write
    int     80h             ; sys_write(size, msg, stdout);

    pop     eax             ; pop out of stack
    sub     eax, 1          ; what we're doing each loop: subracting once
    jnz     loop            ; if subtracting != 0, jump back to the loop
 
    mov     ebx, 0          ; return 0
    mov     eax, 1          ; sys_exit
    int     80h             ; sys_exit(0);
