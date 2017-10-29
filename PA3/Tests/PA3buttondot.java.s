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
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    ldi    r22, 2
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
    
    #### while statement
MJ_L0:
    
    /* True/1 expression */
    ldi r22, 1
    push r22
    # if not(condition)
    # load a one byte expression off stack
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L2
    brne   MJ_L1
    jmp    MJ_L2
    
    # while loop body
MJ_L1:
    
    # Block body
    #### if statement
    
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
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
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
    ldi r24, lo8(0)
    ldi r25, hi8(0)
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
    ldi    r22, 6
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
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
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
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Color expression
    ldi    r22, 6
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
    
    # End of block
    jmp MJ_L5
    
    # else label for if
MJ_L3:
    # Block body
    #### if statement
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L6
    brne   MJ_L7
    jmp    MJ_L6
    
    # then label for if
MJ_L7:
    
    # Block body
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    ldi r24, lo8(0)
    ldi r25, hi8(0)
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
    ldi    r22, 4
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
    
    # End of block
    jmp MJ_L8
    
    # else label for if
MJ_L6:
    # Block body
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    ldi    r22, 2
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
    
    # End of block
    # done label for if
MJ_L8:
    # End of block
    # done label for if
MJ_L5:
    /* Load constant */
    ldi r24, lo8(100)
    ldi r25, hi8(100)
    /* Push constant onto stack */
    push r25
    push r24
    
    ### Meggy.delay() call
    # load delay parameter
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z8delay_msj
    
    # End of block
    # jump to while test
    jmp    MJ_L0
    
    # end of while
MJ_L2:
    
    # End of block


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

