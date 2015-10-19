; Chapter 5 Exercise 1: Performance Timing
; Erik Vanlandingham
; CIS-361
; Last Modified 10-17-15

include Irvine32.inc

Comment !
Performance timing

I got 4149ms for my elapsed time
in powersaver mode I got 4431ms
!

.data
OUTER_LOOP_COUNT = 3
StartTime dword ?
msg1 byte "Please Wait...", 0dh,0ah,0
msg2 byte "Ellapsed Milliseconds: ",0

.code
main proc
    mov edx,OFFSET msg1
    call WriteString
    ;Save Starting Time
    call GetMSeconds
    mov StartTime,eax
    ;start outer loop
    mov ecx,OUTER_LOOP_COUNT
    
    L1: call innerLoop
        loop L1
        
    ;Calc Elapsed Time
    call GetMSeconds
    sub eax,StartTime
    
    ;Display Ellapsed Time
    mov edx, OFFSET msg2
    call WriteString
    call WriteDec
    call Crlf
    
    exit
main endp

innerLoop PROC
    push ecx
    mov ecx,0FFFFFFFh
L1: mul eax
    mul eax
    mul eax
    loop L1
    
    pop ecx
    ret
innerLoop endp

end main