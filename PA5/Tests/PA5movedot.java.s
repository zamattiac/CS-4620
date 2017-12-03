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
    ldi    r24, lo8(3)
    ldi    r25, hi8(3)
    # allocating object of size 3 on heap
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
    
    call    Dot_run
    # End of block
    .text
.global Dot_run
    .type  Dot_run, @function
Dot_run:
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
/* done with function Dot_run prologue */
    
    
    # Push Meggy.Tone.C3 onto the stack.
    ldi    r25, hi8(61157)
    ldi    r24, lo8(61157)
    # push two byte expression onto stack
    push   r25
    push   r24
    
    
    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var localvar
    std    Y + 3, r25
    std    Y + 2, r24
    
    
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
    std    Z + 2, r24
    
    
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
    lds   r24,     Button_Up
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
    # load value for variable curr_x
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
    pop    r20
    # IdExp
    # load value for variable curr_y
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
    brlt     MJ_L8
    ldi    r19, 0
    jmp    MJ_L9
MJ_L8:
    ldi    r19, hi8(-1)
MJ_L9:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L10
    ldi    r25, 0
    jmp    MJ_L11
MJ_L10:
    ldi    r25, hi8(-1)
MJ_L11:
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
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Dot_movedot
    # IdExp
    # load value for variable localvar
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 3
    ldd    r24, Y + 2
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(50)
    ldi r25, hi8(50)
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
    # End of block
    jmp MJ_L12
    
    # else label for if
MJ_L6:
    # Block body
    # End of block
    # done label for if
MJ_L12:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Down
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L13
MJ_L15:
    ldi   r24, 1
    jmp   MJ_L14
MJ_L13:
MJ_L14:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L16
    brne   MJ_L17
    jmp    MJ_L16
    
    # then label for if
MJ_L17:
    
    # Block body
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
    # load value for variable curr_x
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
    pop    r20
    # IdExp
    # load value for variable curr_y
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
    brlt     MJ_L18
    ldi    r19, 0
    jmp    MJ_L19
MJ_L18:
    ldi    r19, hi8(-1)
MJ_L19:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L20
    ldi    r25, 0
    jmp    MJ_L21
MJ_L20:
    ldi    r25, hi8(-1)
MJ_L21:
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
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Dot_movedot
    # IdExp
    # load value for variable localvar
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 3
    ldd    r24, Y + 2
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(50)
    ldi r25, hi8(50)
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
    # End of block
    jmp MJ_L22
    
    # else label for if
MJ_L16:
    # Block body
    # End of block
    # done label for if
MJ_L22:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Left
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L23
MJ_L25:
    ldi   r24, 1
    jmp   MJ_L24
MJ_L23:
MJ_L24:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L26
    brne   MJ_L27
    jmp    MJ_L26
    
    # then label for if
MJ_L27:
    
    # Block body
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
    # load value for variable curr_x
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
    brlt     MJ_L28
    ldi    r19, 0
    jmp    MJ_L29
MJ_L28:
    ldi    r19, hi8(-1)
MJ_L29:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L30
    ldi    r25, 0
    jmp    MJ_L31
MJ_L30:
    ldi    r25, hi8(-1)
MJ_L31:
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
    # IdExp
    # load value for variable curr_y
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
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Dot_movedot
    # IdExp
    # load value for variable localvar
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 3
    ldd    r24, Y + 2
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(50)
    ldi r25, hi8(50)
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
    # End of block
    jmp MJ_L32
    
    # else label for if
MJ_L26:
    # Block body
    # End of block
    # done label for if
MJ_L32:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Right
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L33
MJ_L35:
    ldi   r24, 1
    jmp   MJ_L34
MJ_L33:
MJ_L34:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L36
    brne   MJ_L37
    jmp    MJ_L36
    
    # then label for if
MJ_L37:
    
    # Block body
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
    # load value for variable curr_x
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
    # IdExp
    # load value for variable curr_y
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
    
    # load a one byte expression off stack
    pop    r22
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Dot_movedot
    # IdExp
    # load value for variable localvar
    # variable is a local or param variable
    
    # load a two byte variable from base+offset
    ldd    r25, Y + 3
    ldd    r24, Y + 2
    # push two byte expression onto stack
    push   r25
    push   r24
    
    /* Load constant */
    ldi r24, lo8(50)
    ldi r25, hi8(50)
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
    # End of block
    jmp MJ_L42
    
    # else label for if
MJ_L36:
    # Block body
    # End of block
    # done label for if
MJ_L42:
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
    
/* epilogue start for Dot_run */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Dot_run, .-Dot_run
    
    .text
.global Dot_movedot
    .type  Dot_movedot, @function
Dot_movedot:
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
/* done with function Dot_movedot prologue */
    
    
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
    # load value for variable x
    # variable is a local or param variable
    
    # load a one byte variable from base+offset
    ldd    r24, Y + 2
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r20
    # IdExp
    # load value for variable y
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
    
    call    Dot_inBounds
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
    #WANT breq MJ_L43
    brne   MJ_L44
    jmp    MJ_L43
    
    # then label for if
MJ_L44:
    
    # Block body
    # IdExp
    # load value for variable curr_x
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
    # load value for variable curr_y
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
    
    # IdExp
    # load value for variable dotcolor
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
    # load value for variable y
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
    
    
    # End of block
    jmp MJ_L45
    
    # else label for if
MJ_L43:
    # Block body
    # End of block
    # done label for if
MJ_L45:
/* epilogue start for Dot_movedot */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Dot_movedot, .-Dot_movedot
    
    .text
.global Dot_inBounds
    .type  Dot_inBounds, @function
Dot_inBounds:
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
/* done with function Dot_inBounds prologue */
    
    
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
    brlt MJ_L53
    
    # load false
MJ_L52:
    ldi     r24, 0
    jmp      MJ_L54
    
    # load true
MJ_L53:
    ldi    r24, 1
    
    # push result of less than
MJ_L54:
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
    # Want this, breq MJ_L50
    brne  MJ_L51
    jmp   MJ_L50
    
MJ_L51:
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
    brlt MJ_L56
    
    # load false
MJ_L55:
    ldi     r24, 0
    jmp      MJ_L57
    
    # load true
MJ_L56:
    ldi    r24, 1
    
    # push result of less than
MJ_L57:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L50:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L48
    brne  MJ_L49
    jmp   MJ_L48
    
MJ_L49:
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
    brlt MJ_L59
    
    # load false
MJ_L58:
    ldi     r24, 0
    jmp      MJ_L60
    
    # load true
MJ_L59:
    ldi    r24, 1
    
    # push result of less than
MJ_L60:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L48:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L46
    brne  MJ_L47
    jmp   MJ_L46
    
MJ_L47:
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
    brlt MJ_L62
    
    # load false
MJ_L61:
    ldi     r24, 0
    jmp      MJ_L63
    
    # load true
MJ_L62:
    ldi    r24, 1
    
    # push result of less than
MJ_L63:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L46:
    
/* epilogue start for Dot_inBounds */
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
    .size Dot_inBounds, .-Dot_inBounds
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

