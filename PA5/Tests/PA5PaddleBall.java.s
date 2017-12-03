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
    
    call    PaddleBallBoard_run
    # End of block
    .text
.global PaddleBallBoard_run
    .type  PaddleBallBoard_run, @function
PaddleBallBoard_run:
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
/* done with function PaddleBallBoard_run prologue */
    
    
    # NewExp
    ldi    r24, lo8(5)
    ldi    r25, hi8(5)
    # allocating object of size 5 on heap
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
    # store rhs into var b
    std    Y + 3, r25
    std    Y + 2, r24
    
    
    # IdExp
    # load value for variable b
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 3
    ldd    r24, Y + 2
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_init
    # NewExp
    ldi    r24, lo8(2)
    ldi    r25, hi8(2)
    # allocating object of size 2 on heap
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
    # store rhs into var p
    std    Y + 5, r25
    std    Y + 4, r24
    
    
    # IdExp
    # load value for variable p
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 5
    ldd    r24, Y + 4
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_init
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
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Left
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L3
MJ_L5:
    ldi   r24, 1
    jmp   MJ_L4
MJ_L3:
MJ_L4:
    # push one byte expression onto stack
    push   r24
    
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
    # IdExp
    # load value for variable p
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 5
    ldd    r24, Y + 4
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_moveLeft
    # End of block
    jmp MJ_L8
    
    # else label for if
MJ_L6:
    # Block body
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Right
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L9
MJ_L11:
    ldi   r24, 1
    jmp   MJ_L10
MJ_L9:
MJ_L10:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L12
    brne   MJ_L13
    jmp    MJ_L12
    
    # then label for if
MJ_L13:
    
    # Block body
    # IdExp
    # load value for variable p
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 5
    ldd    r24, Y + 4
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_moveRight
    # End of block
    jmp MJ_L14
    
    # else label for if
MJ_L12:
    # Block body
    # End of block
    # done label for if
MJ_L14:
    # End of block
    # done label for if
MJ_L8:
    # IdExp
    # load value for variable b
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 3
    ldd    r24, Y + 2
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_move
    /* Load constant */
    ldi r24, lo8(256)
    ldi r25, hi8(256)
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
    
/* epilogue start for PaddleBallBoard_run */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size PaddleBallBoard_run, .-PaddleBallBoard_run
    
    .text
.global Paddle_init
    .type  Paddle_init, @function
Paddle_init:
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
/* done with function Paddle_init prologue */
    
    
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
    
    
    # Color expression
    ldi    r22, 5
    # push one byte expression onto stack
    push   r22
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 1, r24
    
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable centerX
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
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_drawPaddle
/* epilogue start for Paddle_init */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_init, .-Paddle_init
    
    .text
.global Paddle_drawPaddle
    .type  Paddle_drawPaddle, @function
Paddle_drawPaddle:
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
/* done with function Paddle_drawPaddle prologue */
    
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L15
    ldi    r19, 0
    jmp    MJ_L16
MJ_L15:
    ldi    r19, hi8(-1)
MJ_L16:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L17
    ldi    r25, 0
    jmp    MJ_L18
MJ_L17:
    ldi    r25, hi8(-1)
MJ_L18:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable color
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
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
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
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
    
    # IdExp
    # load value for variable color
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
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
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
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
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L19
    ldi    r19, 0
    jmp    MJ_L20
MJ_L19:
    ldi    r19, hi8(-1)
MJ_L20:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L21
    ldi    r25, 0
    jmp    MJ_L22
MJ_L21:
    ldi    r25, hi8(-1)
MJ_L22:
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable color
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
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
    
/* epilogue start for Paddle_drawPaddle */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_drawPaddle, .-Paddle_drawPaddle
    
    .text
.global Paddle_moveLeft
    .type  Paddle_moveLeft, @function
Paddle_moveLeft:
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
/* done with function Paddle_moveLeft prologue */
    
    
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
    # IdExp
    # load value for variable centerX
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L23
    ldi    r19, 0
    jmp    MJ_L24
MJ_L23:
    ldi    r19, hi8(-1)
MJ_L24:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L25
    ldi    r25, 0
    jmp    MJ_L26
MJ_L25:
    ldi    r25, hi8(-1)
MJ_L26:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # load a one byte expression off stack
    pop    r20
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
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_inBounds
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
    #WANT breq MJ_L27
    brne   MJ_L28
    jmp    MJ_L27
    
    # then label for if
MJ_L28:
    
    # Block body
    # IdExp
    # load value for variable centerX
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
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L29
    ldi    r19, 0
    jmp    MJ_L30
MJ_L29:
    ldi    r19, hi8(-1)
MJ_L30:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L31
    ldi    r25, 0
    jmp    MJ_L32
MJ_L31:
    ldi    r25, hi8(-1)
MJ_L32:
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
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
    
    # IdExp
    # load value for variable centerX
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L33
    ldi    r19, 0
    jmp    MJ_L34
MJ_L33:
    ldi    r19, hi8(-1)
MJ_L34:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L35
    ldi    r25, 0
    jmp    MJ_L36
MJ_L35:
    ldi    r25, hi8(-1)
MJ_L36:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
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
    
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable centerX
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
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_drawPaddle
    # End of block
    jmp MJ_L37
    
    # else label for if
MJ_L27:
    # Block body
    # End of block
    # done label for if
MJ_L37:
/* epilogue start for Paddle_moveLeft */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_moveLeft, .-Paddle_moveLeft
    
    .text
.global Paddle_moveRight
    .type  Paddle_moveRight, @function
Paddle_moveRight:
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
/* done with function Paddle_moveRight prologue */
    
    
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
    # IdExp
    # load value for variable centerX
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
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L38
    ldi    r19, 0
    jmp    MJ_L39
MJ_L38:
    ldi    r19, hi8(-1)
MJ_L39:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L40
    ldi    r25, 0
    jmp    MJ_L41
MJ_L40:
    ldi    r25, hi8(-1)
MJ_L41:
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
    
    # load a one byte expression off stack
    pop    r20
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
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_inBounds
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
    #WANT breq MJ_L42
    brne   MJ_L43
    jmp    MJ_L42
    
    # then label for if
MJ_L43:
    
    # Block body
    # IdExp
    # load value for variable centerX
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L44
    ldi    r19, 0
    jmp    MJ_L45
MJ_L44:
    ldi    r19, hi8(-1)
MJ_L45:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L46
    ldi    r25, 0
    jmp    MJ_L47
MJ_L46:
    ldi    r25, hi8(-1)
MJ_L47:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
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
    
    # IdExp
    # load value for variable centerX
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
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L48
    ldi    r19, 0
    jmp    MJ_L49
MJ_L48:
    ldi    r19, hi8(-1)
MJ_L49:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L50
    ldi    r25, 0
    jmp    MJ_L51
MJ_L50:
    ldi    r25, hi8(-1)
MJ_L51:
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
    
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable centerX
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
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Paddle_drawPaddle
    # End of block
    jmp MJ_L52
    
    # else label for if
MJ_L42:
    # Block body
    # End of block
    # done label for if
MJ_L52:
/* epilogue start for Paddle_moveRight */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Paddle_moveRight, .-Paddle_moveRight
    
    .text
.global Paddle_inBounds
    .type  Paddle_inBounds, @function
Paddle_inBounds:
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
    std    Y + 2, r22
    std    Y + 3, r20
/* done with function Paddle_inBounds prologue */
    
    
    #### short-circuited && operation
    # &&: left operand
    
    #### short-circuited && operation
    # &&: left operand
    
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L60
    
    # load false
MJ_L59:
    ldi     r24, 0
    jmp      MJ_L61
    
    # load true
MJ_L60:
    ldi    r24, 1
    
    # push result of less than
MJ_L61:
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
    # Want this, breq MJ_L57
    brne  MJ_L58
    jmp   MJ_L57
    
MJ_L58:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    /* Load constant */
    ldi r24, lo8(8)
    ldi r25, hi8(8)
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
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L63
    
    # load false
MJ_L62:
    ldi     r24, 0
    jmp      MJ_L64
    
    # load true
MJ_L63:
    ldi    r24, 1
    
    # push result of less than
MJ_L64:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L57:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L55
    brne  MJ_L56
    jmp   MJ_L55
    
MJ_L56:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable y
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L66
    
    # load false
MJ_L65:
    ldi     r24, 0
    jmp      MJ_L67
    
    # load true
MJ_L66:
    ldi    r24, 1
    
    # push result of less than
MJ_L67:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L55:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L53
    brne  MJ_L54
    jmp   MJ_L53
    
MJ_L54:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # IdExp
    # load value for variable y
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    /* Load constant */
    ldi r24, lo8(8)
    ldi r25, hi8(8)
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
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L69
    
    # load false
MJ_L68:
    ldi     r24, 0
    jmp      MJ_L70
    
    # load true
MJ_L69:
    ldi    r24, 1
    
    # push result of less than
MJ_L70:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L53:
    
/* epilogue start for Paddle_inBounds */
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
    .size Paddle_inBounds, .-Paddle_inBounds
    
    .text
.global Ball_init
    .type  Ball_init, @function
Ball_init:
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
/* done with function Ball_init prologue */
    
    
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 2, r24
    
    
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 3, r24
    
    
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
    
    
    /* Load constant */
    ldi r24, lo8(6)
    ldi r25, hi8(6)
    /* Push constant onto stack */
    push r25
    push r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
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
    std    Z + 1, r24
    
    
    # Color expression
    ldi    r22, 2
    # push one byte expression onto stack
    push   r22
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 4, r24
    
    
    # IdExp
    # load value for variable currentX
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
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable ballColor
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 4
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
    
/* epilogue start for Ball_init */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ball_init, .-Ball_init
    
    .text
.global Ball_inBounds
    .type  Ball_inBounds, @function
Ball_inBounds:
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
    std    Y + 2, r22
    std    Y + 3, r20
/* done with function Ball_inBounds prologue */
    
    
    #### short-circuited && operation
    # &&: left operand
    
    #### short-circuited && operation
    # &&: left operand
    
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L80
    
    # load false
MJ_L79:
    ldi     r24, 0
    jmp      MJ_L81
    
    # load true
MJ_L80:
    ldi    r24, 1
    
    # push result of less than
MJ_L81:
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
    # Want this, breq MJ_L77
    brne  MJ_L78
    jmp   MJ_L77
    
MJ_L78:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    /* Load constant */
    ldi r24, lo8(8)
    ldi r25, hi8(8)
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
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L83
    
    # load false
MJ_L82:
    ldi     r24, 0
    jmp      MJ_L84
    
    # load true
MJ_L83:
    ldi    r24, 1
    
    # push result of less than
MJ_L84:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L77:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L75
    brne  MJ_L76
    jmp   MJ_L75
    
MJ_L76:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
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
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable y
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L86
    
    # load false
MJ_L85:
    ldi     r24, 0
    jmp      MJ_L87
    
    # load true
MJ_L86:
    ldi    r24, 1
    
    # push result of less than
MJ_L87:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L75:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L73
    brne  MJ_L74
    jmp   MJ_L73
    
MJ_L74:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # IdExp
    # load value for variable y
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    /* Load constant */
    ldi r24, lo8(8)
    ldi r25, hi8(8)
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
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L89
    
    # load false
MJ_L88:
    ldi     r24, 0
    jmp      MJ_L90
    
    # load true
MJ_L89:
    ldi    r24, 1
    
    # push result of less than
MJ_L90:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L73:
    
/* epilogue start for Ball_inBounds */
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
    .size Ball_inBounds, .-Ball_inBounds
    
    .text
.global Ball_collision
    .type  Ball_collision, @function
Ball_collision:
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
    std    Y + 2, r22
    std    Y + 3, r20
/* done with function Ball_collision prologue */
    
    
    # Color expression
    ldi    r22, 0
    # push one byte expression onto stack
    push   r22
    
    # IdExp
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable y
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
    # push one byte expression onto stack
    push   r24
    
    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L94
    
    # result is false
MJ_L93:
    ldi     r24, 0
    jmp      MJ_L5
    
    # result is true
MJ_L94:
    ldi     r24, 1
    
    # store result of equal expression
MJ_L95:
    # push one byte expression onto stack
    push   r24
    
    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    
/* epilogue start for Ball_collision */
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
    .size Ball_collision, .-Ball_collision
    
    .text
.global Ball_move
    .type  Ball_move, @function
Ball_move:
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
/* done with function Ball_move prologue */
    
    
    # IdExp
    # load value for variable currentX
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
    
    # IdExp
    # load value for variable prevX
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 2
    # push one byte expression onto stack
    push   r24
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L98
    ldi    r19, 0
    jmp    MJ_L99
MJ_L98:
    ldi    r19, hi8(-1)
MJ_L99:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L100
    ldi    r25, 0
    jmp    MJ_L101
MJ_L100:
    ldi    r25, hi8(-1)
MJ_L101:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable currentX
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
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L102
    ldi    r19, 0
    jmp    MJ_L103
MJ_L102:
    ldi    r19, hi8(-1)
MJ_L103:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L104
    ldi    r25, 0
    jmp    MJ_L105
MJ_L104:
    ldi    r25, hi8(-1)
MJ_L105:
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 2, r24
    
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable prevY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 3
    # push one byte expression onto stack
    push   r24
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L106
    ldi    r19, 0
    jmp    MJ_L107
MJ_L106:
    ldi    r19, hi8(-1)
MJ_L107:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L108
    ldi    r25, 0
    jmp    MJ_L109
MJ_L108:
    ldi    r25, hi8(-1)
MJ_L109:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L110
    ldi    r19, 0
    jmp    MJ_L111
MJ_L110:
    ldi    r19, hi8(-1)
MJ_L111:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L112
    ldi    r25, 0
    jmp    MJ_L113
MJ_L112:
    ldi    r25, hi8(-1)
MJ_L113:
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 3, r24
    
    
    #### if statement
    
    #### short-circuited && operation
    # &&: left operand
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_inBounds
    # handle return value
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
    # Want this, breq MJ_L114
    brne  MJ_L115
    jmp   MJ_L114
    
MJ_L115:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_collision
    # handle return value
    # push one byte expression onto stack
    push   r24
    
    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L114:
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L116
    brne   MJ_L117
    jmp    MJ_L116
    
    # then label for if
MJ_L117:
    
    # Block body
    # End of block
    jmp MJ_L118
    
    # else label for if
MJ_L116:
    # Block body
    # IdExp
    # load value for variable currentX
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
    
    # IdExp
    # load value for variable prevX
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 2
    # push one byte expression onto stack
    push   r24
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L119
    ldi    r19, 0
    jmp    MJ_L120
MJ_L119:
    ldi    r19, hi8(-1)
MJ_L120:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L121
    ldi    r25, 0
    jmp    MJ_L122
MJ_L121:
    ldi    r25, hi8(-1)
MJ_L122:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var deltaX
    std    Y + 4, r24
    
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable prevY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 3
    # push one byte expression onto stack
    push   r24
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L123
    ldi    r19, 0
    jmp    MJ_L124
MJ_L123:
    ldi    r19, hi8(-1)
MJ_L124:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L125
    ldi    r25, 0
    jmp    MJ_L126
MJ_L125:
    ldi    r25, hi8(-1)
MJ_L126:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var deltaY
    std    Y + 5, r24
    
    
    # IdExp
    # load value for variable currentX
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
    
    # IdExp
    # load value for variable deltaX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L127
    ldi    r19, 0
    jmp    MJ_L128
MJ_L127:
    ldi    r19, hi8(-1)
MJ_L128:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L129
    ldi    r25, 0
    jmp    MJ_L130
MJ_L129:
    ldi    r25, hi8(-1)
MJ_L130:
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 2, r24
    
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable deltaY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L131
    ldi    r19, 0
    jmp    MJ_L132
MJ_L131:
    ldi    r19, hi8(-1)
MJ_L132:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L133
    ldi    r25, 0
    jmp    MJ_L134
MJ_L133:
    ldi    r25, hi8(-1)
MJ_L134:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 3, r24
    
    
    #### if statement
    
    #### short-circuited && operation
    # &&: left operand
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_inBounds
    # handle return value
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
    # Want this, breq MJ_L135
    brne  MJ_L136
    jmp   MJ_L135
    
MJ_L136:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_collision
    # handle return value
    # push one byte expression onto stack
    push   r24
    
    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L135:
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L137
    brne   MJ_L138
    jmp    MJ_L137
    
    # then label for if
MJ_L138:
    
    # Block body
    # End of block
    jmp MJ_L139
    
    # else label for if
MJ_L137:
    # Block body
    # IdExp
    # load value for variable currentX
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
    
    # IdExp
    # load value for variable deltaX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 4
    # push one byte expression onto stack
    push   r24
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L140
    ldi    r19, 0
    jmp    MJ_L141
MJ_L140:
    ldi    r19, hi8(-1)
MJ_L141:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L142
    ldi    r25, 0
    jmp    MJ_L143
MJ_L142:
    ldi    r25, hi8(-1)
MJ_L143:
    # Do INT sub operation
    sub    r24, r18
    sbc    r25, r19
    # push hi order byte first
    # push two byte expression onto stack
    push   r25
    push   r24
    
    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 2, r24
    
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable deltaY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 5
    # push one byte expression onto stack
    push   r24
    
    # ADD
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L144
    ldi    r19, 0
    jmp    MJ_L145
MJ_L144:
    ldi    r19, hi8(-1)
MJ_L145:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L146
    ldi    r25, 0
    jmp    MJ_L147
MJ_L146:
    ldi    r25, hi8(-1)
MJ_L147:
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 3, r24
    
    
    #### if statement
    
    #### short-circuited && operation
    # &&: left operand
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_inBounds
    # handle return value
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
    # Want this, breq MJ_L148
    brne  MJ_L149
    jmp   MJ_L148
    
MJ_L149:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Ball_collision
    # handle return value
    # push one byte expression onto stack
    push   r24
    
    # not operation
    # load a one byte expression off stack
    pop    r24
    ldi     r22, 1
    eor     r24,r22
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L148:
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L150
    brne   MJ_L151
    jmp    MJ_L150
    
    # then label for if
MJ_L151:
    
    # Block body
    # End of block
    jmp MJ_L152
    
    # else label for if
MJ_L150:
    # Block body
    # IdExp
    # load value for variable prevX
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 2
    # push one byte expression onto stack
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextX
    std    Y + 2, r24
    
    
    # IdExp
    # load value for variable prevY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 3
    # push one byte expression onto stack
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    # store rhs into var nextY
    std    Y + 3, r24
    
    
    # End of block
    # done label for if
MJ_L152:
    # End of block
    # done label for if
MJ_L139:
    # End of block
    # done label for if
MJ_L118:
    # IdExp
    # load value for variable currentX
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
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
    # push one byte expression onto stack
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
    
    # IdExp
    # load value for variable nextX
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
    # push one byte expression onto stack
    push   r24
    
    # IdExp
    # load value for variable ballColor
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 4
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
    
    # IdExp
    # load value for variable currentX
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
    
    
    ### AssignStatement
    # load rhs exp
    # load a one byte expression off stack
    pop    r24
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var a
    std    Z + 2, r24
    
    
    # IdExp
    # load value for variable currentY
    # variable is a local or param variable
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable
    
    # load a one byte variable from base+offset
    ldd    r24, Z + 1
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
    std    Z + 3, r24
    
    
    # IdExp
    # load value for variable nextX
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
    
    
    # IdExp
    # load value for variable nextY
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 3
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
    std    Z + 1, r24
    
    
/* epilogue start for Ball_move */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Ball_move, .-Ball_move
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

