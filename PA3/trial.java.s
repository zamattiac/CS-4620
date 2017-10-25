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

    here is the in
    
    /* True/1 expression */
    ldi r22, 1
    push r22
    /* Load constant */
    ldi r25, hi8(2)
    ldi r24, lo8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(6)
    ldi r24, lo8(6)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Do INT sub operation
        sub    r24, r18
        sbc    r25, r19
        # push hi order byte first
        # push two byte expression onto stack
        push   r25
        push   r24
    
    ### Meggy Delay function
    # Load parameter - 2 byte expression off stack
    pop    r24
    pop    r25
    call   _Z8delay_msj
  
    here is the out


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main


