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
    # Push Meggy.Tone.C3 onto the stack.
    ldi    r25, hi8(61157)
    ldi    r24, lo8(61157)
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    ### Meggy.toneStart(tone, time_ms) call
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z10Tone_Startjj
    # NewExp
    ldi    r24, lo8(2)
    ldi    r25, hi8(2)
    # allocating object of size 2 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    /* Load constant */
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # load a one byte expression off stack
    pop    r18
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
    
    pop    r20
    # promoting a byte to an int
    tst     r20
    brlt     MJ_L0
    ldi    r21, 0
    jmp    MJ_L1
MJ_L0:
    ldi    r21, hi8(-1)
MJ_L1:
    
    /* Load constant */
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    c2_c2f1
    # End of block
    .text
.global c2_c2f1
    .type  c2_c2f1, @function
c2_c2f1:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push r30
    push r30
    push r30
    push r30
    push r30
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 5, r21
    std    Y + 4, r20
    std    Y + 7, r19
    std    Y + 6, r18
/* done with function c2_c2f1 prologue */
    
    
    ### AssignStatement
    # load rhs exp
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
    
    # load a one byte expression off stack
    pop    r24
    # store rhs into var d
    std    Y + 3, r24
    
    
    ### AssignStatement
    # load rhs exp
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 2, r25
    std    Z + 1, r24
    
    
    # IdExp
    # load value for variable d
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
/* epilogue start for c2_c2f1 */
    # load expression off stack
    # handle return value
    pop r24
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size c2_c2f1, .-c2_c2f1
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

