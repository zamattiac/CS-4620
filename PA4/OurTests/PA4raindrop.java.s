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
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    
    call    Cloud_rain
    /* Load constant */
    ldi r24, lo8(500)
    ldi r25, hi8(500)
    /* Push constant onto stack */
    push r25
    push r24
    
    ### Meggy.delay() call
    # load delay parameter
    # load a two byte expression off stack
    pop    r24
    pop    r25
    call   _Z8delay_msj
    
    /* Load constant */
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Color expression
    ldi    r22, 0
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
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(6)
    ldi r25, hi8(6)
    /* Push constant onto stack */
    push r25
    push r24
    
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
    # jump to while test
    jmp    MJ_L0
    
    # end of while
MJ_L2:
    
    # End of block
    .text
.global Cloud_rain
    .type  Cloud_rain, @function
Cloud_rain:
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
/* done with function Cloud_rain prologue */
    
    
    #### if statement
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
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
    
    call    Cloud_inBounds
    # handle return value
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
    
    #### if statement
    
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
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L7
    ldi    r25, 0
    jmp    MJ_L8
MJ_L7:
    ldi    r25, hi8(-1)
MJ_L8:
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
    
    call    Cloud_inBounds
    # handle return value
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L9
    brne   MJ_L10
    jmp    MJ_L9
    
    # then label for if
MJ_L10:
    
    # Block body
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
    brlt     MJ_L11
    ldi    r19, 0
    jmp    MJ_L12
MJ_L11:
    ldi    r19, hi8(-1)
MJ_L12:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L13
    ldi    r25, 0
    jmp    MJ_L14
MJ_L13:
    ldi    r25, hi8(-1)
MJ_L14:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Color expression
    ldi    r22, 0
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
    jmp MJ_L15
    
    # else label for if
MJ_L9:
    # Block body
    # End of block
    # done label for if
MJ_L15:
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L16
    ldi    r19, 0
    jmp    MJ_L17
MJ_L16:
    ldi    r19, hi8(-1)
MJ_L17:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L18
    ldi    r25, 0
    jmp    MJ_L19
MJ_L18:
    ldi    r25, hi8(-1)
MJ_L19:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
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
    
    call    Cloud_rain
    # End of block
    jmp MJ_L20
    
    # else label for if
MJ_L3:
    # Block body
    # End of block
    # done label for if
MJ_L20:
/* epilogue start for Cloud_rain */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Cloud_rain, .-Cloud_rain
    
    .text
.global Cloud_inBounds
    .type  Cloud_inBounds, @function
Cloud_inBounds:
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
/* done with function Cloud_inBounds prologue */
    
    
    #### short-circuited && operation
    # &&: left operand
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    # SUBTRACT
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L24
    
    # load false
MJ_L23:
    ldi     r24, 0
    jmp      MJ_L25
    
    # load true
MJ_L24:
    ldi    r24, 1
    
    # push result of less than
MJ_L25:
    # push one byte expression onto stack
    push   r24
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L21
    brne  MJ_L22
    jmp   MJ_L21
    
MJ_L22:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    /* Load constant */
    ldi r24, lo8(8)
    ldi r25, hi8(8)
    /* Push constant onto stack */
    push r25
    push r24
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L27
    
    # load false
MJ_L26:
    ldi     r24, 0
    jmp      MJ_L28
    
    # load true
MJ_L27:
    ldi    r24, 1
    
    # push result of less than
MJ_L28:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L21:
    
/* epilogue start for Cloud_inBounds */
    # load expression off stack
    # handle return value
    pop r24
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Cloud_inBounds, .-Cloud_inBounds
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

