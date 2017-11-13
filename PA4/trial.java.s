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
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    c2_c2f2
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
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(3)
    ldi r25, hi8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r20
    pop    r21
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    c3_c3f1
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
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    pop    r20
    pop    r21
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    c3_c3f2
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
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
/* done with function c2_c2f1 prologue */
    
    
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
    # IdExp
    # load value for variable i
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable n
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L0
    ldi    r19, 0
    jmp    MJ_L1
MJ_L0:
    ldi    r19, hi8(-1)
MJ_L1:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L2
    ldi    r25, 0
    jmp    MJ_L3
MJ_L2:
    ldi    r25, hi8(-1)
MJ_L3:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
/* epilogue start for c2_c2f1 */
    # load expression off stack
    # handle return value
    pop    r25
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
    .size c2_c2f1, .-c2_c2f1
    
    .text
.global c2_c2f2
    .type  c2_c2f2, @function
c2_c2f2:
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
/* done with function c2_c2f2 prologue */
    
    
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
/* epilogue start for c2_c2f2 */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size c2_c2f2, .-c2_c2f2
    
    .text
.global c3_c3f1
    .type  c3_c3f1, @function
c3_c3f1:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
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
/* done with function c3_c3f1 prologue */
    
    
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
    # IdExp
    # load value for variable i
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
/* epilogue start for c3_c3f1 */
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
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size c3_c3f1, .-c3_c3f1
    
    .text
.global c3_c3f2
    .type  c3_c3f2, @function
c3_c3f2:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push r30
    push r30
    push r30
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 4, r23
    std    Y + 3, r22
    std    Y + 5, r20
/* done with function c3_c3f2 prologue */
    
    
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
    # IdExp
    # load value for variable p
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24
    
/* epilogue start for c3_c3f2 */
    # load expression off stack
    # handle return value
    pop r24
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size c3_c3f2, .-c3_c3f2
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

