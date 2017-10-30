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
    #### if statement
    
    /* Load constant */
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    # ADD
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # MulExp
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r22
    # move low byte src into dest reg
    mov    r24, r18
    # move low byte src into dest reg
    mov    r26, r22
    
    # Do mul operation of two input bytes
    muls   r24, r26
    # push two byte expression onto stack
    push   r1
    push   r0
    # clear r0 and r1, thanks Brendan!
    eor    r0,r0
    eor    r1,r1
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L1
    
    # result is false
MJ_L0:
    ldi     r24, 0
    jmp      MJ_L2
    
    # result is true
MJ_L1:
    ldi     r24, 1
    
    # store result of equal expression
MJ_L2:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L3
    brne   MJ_L4
    jmp    MJ_L3
    
    # then label for if
MJ_L4:
    
    # Block body
    # End of block
    jmp MJ_L5
    
    # else label for if
MJ_L3:
    # done label for if
MJ_L5:
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # Color expression
    ldi    r22, 5
    # push one byte expression onto stack
    push   r22
    
    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    
    /* Load constant */
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(4)
    ldi r25, hi8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
    # push one byte expression onto stack
    push   r24
    
    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    
    # End of block


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

