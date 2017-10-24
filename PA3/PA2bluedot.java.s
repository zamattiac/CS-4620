    .file  "main.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type   main, @function
main:
    push r29
    push r28
    in r28,__SP_L__
    in r29,__SP_H__
/* prologue: function */
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */
    /* Int literal */
    ldi r17, hi8(1)
    ldi r16, lo8(1)
    push r17
    push r16
    /* Byte cast */
    pop r16
    pop r17
    ldi r17, lo8(0)
    push r17
    push r16
    /* Int literal */
    ldi r17, hi8(2)
    ldi r16, lo8(2)
    push r17
    push r16
    /* Byte cast */
    pop r16
    pop r17
    ldi r17, lo8(0)
    push r17
    push r16
    /* Color literal */
    ldi r17, hi8(5)
    ldi r16, lo8(5)
    push r17
    push r16
    /* Meggy Set Pixel */
    pop r20
    pop r17
    pop r22
    pop r17
    pop r24
    pop r17
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    /* Int literal */
    ldi r17, hi8(1)
    ldi r16, lo8(1)
    push r17
    push r16
    /* Byte cast */
    pop r16
    pop r17
    ldi r17, lo8(0)
    push r17
    push r16
    /* Int literal */
    ldi r17, hi8(3)
    ldi r16, lo8(3)
    push r17
    push r16
    /* Byte cast */
    pop r16
    pop r17
    ldi r17, lo8(0)
    push r17
    push r16
    /* Color literal */
    ldi r17, hi8(5)
    ldi r16, lo8(5)
    push r17
    push r16
    /* Meggy Set Pixel */
    pop r20
    pop r17
    pop r22
    pop r17
    pop r24
    pop r17
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

