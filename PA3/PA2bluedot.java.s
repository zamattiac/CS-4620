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
    # Block body
1:
    /* Load constant */
    ldi r25, hi8(1)
    ldi r24, lo8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    /* Load constant */
    ldi r25, hi8(2)
    ldi r24, lo8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    /* Color literal */
    ldi r25, hi8(5)
    ldi r24, lo8(5)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    /* Load constant */
    ldi r25, hi8(1)
    ldi r24, lo8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    /* Load constant */
    ldi r25, hi8(3)
    ldi r24, lo8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    /* Color literal */
    ldi r25, hi8(5)
    ldi r24, lo8(5)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
