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
    
    # load a one byte expression off stack
    pop    r18
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
    
    # load a one byte expression off stack
    pop    r20
    # Color expression
    ldi    r22, 5
    # push one byte expression onto stack
    push   r22
    
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    C_setP
    # End of block
    .text
.global C_setP
    .type  C_setP, @function
C_setP:
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
    std    Y + 2, r22
    std    Y + 3, r20
    std    Y + 4, r18
/* done with function C_setP prologue */
    
    
    # NewExp
    ldi    r24, lo8(1)
    ldi    r25, hi8(1)
    # allocating object of size 1 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var ox
    std    Y + 6, r25
    std    Y + 5, r24
    
    
    # IdExp
    # load value for variable ox
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ind_put
    # NewExp
    ldi    r24, lo8(1)
    ldi    r25, hi8(1)
    # allocating object of size 1 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 1, r25
    std    Z + 0, r24
    
    
    # IdExp
    # load value for variable oy
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable y
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ind_put
    # IdExp
    # load value for variable ox
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ind_get
    # handle return value
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable oy
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ind_get
    # handle return value
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable c
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 4
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
    
/* epilogue start for C_setP */
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
    .size C_setP, .-C_setP
    
    .text
.global Ind_put
    .type  Ind_put, @function
Ind_put:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push r30
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 2, r22
/* done with function Ind_put prologue */
    
    
    # IdExp
    # load value for variable i
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 0, r24
    
    
/* epilogue start for Ind_put */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ind_put, .-Ind_put
    
    .text
.global Ind_get
    .type  Ind_get, @function
Ind_get:
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
/* done with function Ind_get prologue */
    
    
    # IdExp
    # load value for variable _i
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 0
    # push one byte expression onto stack
    push   r24
    
/* epilogue start for Ind_get */
    # load expression off stack
    # handle return value
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L0
    ldi    r25, 0
    jmp    MJ_L1
MJ_L0:
    ldi    r25, hi8(-1)
MJ_L1:
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ind_get, .-Ind_get
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

