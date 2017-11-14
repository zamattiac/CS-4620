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
    # NewExp
    ldi    r24, lo8(0)
    ldi    r25, hi8(0)
    # allocating object of size 0 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Diagonal_Move
    # End of block
    .text
.global Diagonal_Move
    .type  Diagonal_Move, @function
Diagonal_Move:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push r30
    push r30
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
/* done with function Diagonal_Move prologue */
    
    
    #### if statement
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
    /* Push constant onto stack */
    push r25
    push r24
    
    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
    # push one byte expression onto stack
    push   r24
    
    # Color expression
    ldi    r22, 0
    # push one byte expression onto stack
    push   r22
    
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
    jmp      MJ_L5
    
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
    
    # Push Meggy.Tone.F3 onto the stack.
    ldi    r25, hi8(45816)
    ldi    r24, lo8(45816)
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(100)
    ldi r25, hi8(100)
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
    /* Load constant */
    ldi r24, lo8(1000)
    ldi r25, hi8(1000)
    /* Push constant onto stack */
    push r25
    push r24
    
    ### Meggy.delay() call
    # load delay parameter
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z8delay_msj
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L5
    ldi    r19, 0
    jmp    MJ_L6
MJ_L5:
    ldi    r19, hi8(-1)
MJ_L6:
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L7
    ldi    r19, 0
    jmp    MJ_L8
MJ_L7:
    ldi    r19, hi8(-1)
MJ_L8:
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Diagonal_Move
    # End of block
    jmp MJ_L9
    
    # else label for if
MJ_L3:
    # done label for if
MJ_L9:
/* epilogue start for Diagonal_Move */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Diagonal_Move, .-Diagonal_Move
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

