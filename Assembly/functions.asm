SECTION .data
msg     db      "Hello, world!", 0Ah
size    equ      $ -msg
 
SECTION .text
global  _start

print:
    push    ebp             ; function setup - current base pointer to the stack
    mov     ebp, esp        ; move esp into ebp to give a new area of stack, but useless rn 'cuz there's no esp value anyways
    sub     esp, 0          ; useless here, but used if room was needed on stack for local vars

    mov     edx, size       ; size
    mov     ecx, msg        ; msg
    mov     ebx, 1          ; stdout
    mov     eax, 4          ; sys_write
    int     80h             ; sys_write(size, msg, stdout);

    mov     esp, ebp        ; function teardown - again no importance rn but for reference, will reset esp to original value
    pop     ebp             ; recover previous ebp value
    ret                     ; return
 
 ; printparam:
    ; push    ebp             ; function setup
    ; mov     ebp, esp
    ; sub     esp, 0

    ; mov     edx, [ebp + (size - AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA)]  ; strlen parameter one - before we initially pushed 5 onto the stack, and ebp is now the old value of esp but idk how to keep it the length of the inputted parameter
    ; mov     ecx, msg        ; str
    ; mov     ebx, 1          ; stdout
    ; mov     eax, 4          ; sys_write
    ; int     80h             ; sys_write(13, message, stdout);

    ; mov     esp, ebp        ; function teardown
    ; pop     ebp
    ; ret
 
_start:
 
    call    print
    ; push    5
    ; call    printparam

 
    mov     ebx, 0          ; return 0
    mov     eax, 1          ; sys_exit
    int     80h             ; sys_exit(0)
  
