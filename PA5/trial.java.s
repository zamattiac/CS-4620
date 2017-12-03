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
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # neg int
    # load a two byte expression off stack
    pop    r24
    pop    r25
    ldi     r22, 0
    ldi     r23, 0
    sub     r22, r24
    sbc     r23, r25
    # push two byte expression onto stack
    push   r23
    push   r22
    
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
    
    # less than expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    brlt MJ_L1
    
    # load false
MJ_L0:
    ldi     r24, 0
    jmp      MJ_L2
    
    # load true
MJ_L1:
    ldi    r24, 1
    
    # push result of less than
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
    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    c2_five
    # handle return value
    # push one byte expression onto stack
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
    
    # End of block
    jmp MJ_L5
    
    # else label for if
MJ_L3:
    # Block body
    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    c2_five
    # handle return value
    # push one byte expression onto stack
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
    
    # End of block
    # done label for if
MJ_L5:
    # End of block
    .text
.global c2_five
    .type  c2_five, @function
c2_five:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
/* done with function c2_five prologue */
    
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
/* epilogue start for c2_five */
    # load expression off stack
    # handle return value
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L6
    ldi    r25, 0
    jmp    MJ_L7
MJ_L6:
    ldi    r25, hi8(-1)
MJ_L7:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size c2_five, .-c2_five
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

