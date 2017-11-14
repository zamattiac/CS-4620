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
    
    call    Solver_run
    # End of block
    .text
.global Solver_initMaze1
    .type  Solver_initMaze1, @function
Solver_initMaze1:
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
/* done with function Solver_initMaze1 prologue */
    
    
/* epilogue start for Solver_initMaze1 */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Solver_initMaze1, .-Solver_initMaze1
    
    .text
.global Solver_initMaze2
    .type  Solver_initMaze2, @function
Solver_initMaze2:
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
/* done with function Solver_initMaze2 prologue */
    
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
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
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
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
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
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
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeCol
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
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
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeCol
/* epilogue start for Solver_initMaze2 */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Solver_initMaze2, .-Solver_initMaze2
    
    .text
.global Solver_initMazeCool
    .type  Solver_initMazeCool, @function
Solver_initMazeCool:
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
/* done with function Solver_initMazeCool prologue */
    
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
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
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
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
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(0)
    ldi r25, hi8(0)
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
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeCol
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
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
    
    /* Load constant */
    ldi r24, lo8(7)
    ldi r25, hi8(7)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeCol
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeCol
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    /* Load constant */
    ldi r24, lo8(2)
    ldi r25, hi8(2)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
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
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    /* Load constant */
    ldi r24, lo8(5)
    ldi r25, hi8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(1)
    ldi r25, hi8(1)
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
    
/* epilogue start for Solver_initMazeCool */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Solver_initMazeCool, .-Solver_initMazeCool
    
    .text
.global Solver_run
    .type  Solver_run, @function
Solver_run:
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
/* done with function Solver_run prologue */
    
    
    # loading the implicit "this"
    
    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30
    
    #### function call
    # put parameter values into appropriate registers
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_initMazeCool
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
    
    /* Load constant */
    ldi r24, lo8(6)
    ldi r25, hi8(6)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(6)
    ldi r25, hi8(6)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Load constant */
    ldi r24, lo8(1)
    ldi r25, hi8(1)
    /* Push constant onto stack */
    push r25
    push r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_move
/* epilogue start for Solver_run */
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Solver_run, .-Solver_run
    
    .text
.global Solver_inBounds
    .type  Solver_inBounds, @function
Solver_inBounds:
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
/* done with function Solver_inBounds prologue */
    
    
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
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L7
    
    # load false
MJ_L6:
    ldi     r24, 0
    jmp      MJ_L8
    
    # load true
MJ_L7:
    ldi    r24, 1
    
    # push result of less than
MJ_L8:
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
    # Want this, breq MJ_L4
    brne  MJ_L5
    jmp   MJ_L4
    
MJ_L5:
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
    brlt MJ_L10
    
    # load false
MJ_L9:
    ldi     r24, 0
    jmp      MJ_L11
    
    # load true
MJ_L10:
    ldi    r24, 1
    
    # push result of less than
MJ_L11:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L4:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L2
    brne  MJ_L3
    jmp   MJ_L2
    
MJ_L3:
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
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L13
    
    # load false
MJ_L12:
    ldi     r24, 0
    jmp      MJ_L14
    
    # load true
MJ_L13:
    ldi    r24, 1
    
    # push result of less than
MJ_L14:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L2:
    
    # &&: if left operand is false do not eval right
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    # compare left exp with zero
    ldi r25, 0
    cp    r24, r25
    # Want this, breq MJ_L0
    brne  MJ_L1
    jmp   MJ_L0
    
MJ_L1:
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
    brlt MJ_L16
    
    # load false
MJ_L15:
    ldi     r24, 0
    jmp      MJ_L17
    
    # load true
MJ_L16:
    ldi    r24, 1
    
    # push result of less than
MJ_L17:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L0:
    
/* epilogue start for Solver_inBounds */
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
    .size Solver_inBounds, .-Solver_inBounds
    
    .text
.global Solver_isDark
    .type  Solver_isDark, @function
Solver_isDark:
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
/* done with function Solver_isDark prologue */
    
    
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
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_inBounds
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
    # Want this, breq MJ_L20
    brne  MJ_L21
    jmp   MJ_L20
    
MJ_L21:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
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
    breq MJ_L23
    
    # result is false
MJ_L22:
    ldi     r24, 0
    jmp      MJ_L5
    
    # result is true
MJ_L23:
    ldi     r24, 1
    
    # store result of equal expression
MJ_L24:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L20:
    
/* epilogue start for Solver_isDark */
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
    .size Solver_isDark, .-Solver_isDark
    
    .text
.global Solver_isBLUE
    .type  Solver_isBLUE, @function
Solver_isBLUE:
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
/* done with function Solver_isBLUE prologue */
    
    
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
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r21
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_inBounds
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
    # Want this, breq MJ_L27
    brne  MJ_L28
    jmp   MJ_L27
    
MJ_L28:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    ### Meggy.getPixel(x,y) call
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6ReadPxhh
    # push one byte expression onto stack
    push   r24
    
    # Color expression
    ldi    r22, 5
    # push one byte expression onto stack
    push   r22
    
    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L30
    
    # result is false
MJ_L29:
    ldi     r24, 0
    jmp      MJ_L5
    
    # result is true
MJ_L30:
    ldi     r24, 1
    
    # store result of equal expression
MJ_L31:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L27:
    
/* epilogue start for Solver_isBLUE */
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
    .size Solver_isBLUE, .-Solver_isBLUE
    
    .text
.global Solver_findTargetOrMove
    .type  Solver_findTargetOrMove, @function
Solver_findTargetOrMove:
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
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
    std    Y + 5, r18
    std    Y + 6, r16
/* done with function Solver_findTargetOrMove prologue */
    
    
    #### if statement
    
    #### short-circuited && operation
    # &&: left operand
    
    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L37
    
    # result is false
MJ_L36:
    ldi     r24, 0
    jmp      MJ_L5
    
    # result is true
MJ_L37:
    ldi     r24, 1
    
    # store result of equal expression
MJ_L38:
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
    # Want this, breq MJ_L34
    brne  MJ_L35
    jmp   MJ_L34
    
MJ_L35:
    # right operand
    # load a one byte expression off stack
    pop    r24
    
    # equality check expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    breq MJ_L40
    
    # result is false
MJ_L39:
    ldi     r24, 0
    jmp      MJ_L5
    
    # result is true
MJ_L40:
    ldi     r24, 1
    
    # store result of equal expression
MJ_L41:
    # push one byte expression onto stack
    push   r24
    
    # load a one byte expression off stack
    pop    r24
    # push one byte expression onto stack
    push   r24
    
MJ_L34:
    
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
    jmp MJ_L44
    
    # else label for if
MJ_L42:
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
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_move
    # End of block
    # done label for if
MJ_L44:
/* epilogue start for Solver_findTargetOrMove */
    # pop space off stack for parameters and locals
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
    .size Solver_findTargetOrMove, .-Solver_findTargetOrMove
    
    .text
.global Solver_move
    .type  Solver_move, @function
Solver_move:
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
    
    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__
    
    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 3, r22
    std    Y + 4, r20
    std    Y + 5, r18
    std    Y + 6, r16
/* done with function Solver_move prologue */
    
    
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L45
    ldi    r19, 0
    jmp    MJ_L46
MJ_L45:
    ldi    r19, hi8(-1)
MJ_L46:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L47
    ldi    r25, 0
    jmp    MJ_L48
MJ_L47:
    ldi    r25, hi8(-1)
MJ_L48:
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
    
    call    Solver_isDark
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
    #WANT breq MJ_L49
    brne   MJ_L50
    jmp    MJ_L49
    
    # then label for if
MJ_L50:
    
    # Block body
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
    brlt     MJ_L51
    ldi    r19, 0
    jmp    MJ_L52
MJ_L51:
    ldi    r19, hi8(-1)
MJ_L52:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L53
    ldi    r25, 0
    jmp    MJ_L54
MJ_L53:
    ldi    r25, hi8(-1)
MJ_L54:
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
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_findTargetOrMove
    # End of block
    jmp MJ_L55
    
    # else label for if
MJ_L49:
    # Block body
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
    brlt     MJ_L56
    ldi    r19, 0
    jmp    MJ_L57
MJ_L56:
    ldi    r19, hi8(-1)
MJ_L57:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L58
    ldi    r25, 0
    jmp    MJ_L59
MJ_L58:
    ldi    r25, hi8(-1)
MJ_L59:
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
    
    call    Solver_isDark
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
    #WANT breq MJ_L60
    brne   MJ_L61
    jmp    MJ_L60
    
    # then label for if
MJ_L61:
    
    # Block body
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
    brlt     MJ_L62
    ldi    r19, 0
    jmp    MJ_L63
MJ_L62:
    ldi    r19, hi8(-1)
MJ_L63:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L64
    ldi    r25, 0
    jmp    MJ_L65
MJ_L64:
    ldi    r25, hi8(-1)
MJ_L65:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_findTargetOrMove
    # End of block
    jmp MJ_L66
    
    # else label for if
MJ_L60:
    # Block body
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
    brlt     MJ_L67
    ldi    r19, 0
    jmp    MJ_L68
MJ_L67:
    ldi    r19, hi8(-1)
MJ_L68:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L69
    ldi    r25, 0
    jmp    MJ_L70
MJ_L69:
    ldi    r25, hi8(-1)
MJ_L70:
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
    
    call    Solver_isDark
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
    #WANT breq MJ_L71
    brne   MJ_L72
    jmp    MJ_L71
    
    # then label for if
MJ_L72:
    
    # Block body
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
    brlt     MJ_L73
    ldi    r19, 0
    jmp    MJ_L74
MJ_L73:
    ldi    r19, hi8(-1)
MJ_L74:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L75
    ldi    r25, 0
    jmp    MJ_L76
MJ_L75:
    ldi    r25, hi8(-1)
MJ_L76:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_findTargetOrMove
    # End of block
    jmp MJ_L77
    
    # else label for if
MJ_L71:
    # Block body
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L78
    ldi    r19, 0
    jmp    MJ_L79
MJ_L78:
    ldi    r19, hi8(-1)
MJ_L79:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L80
    ldi    r25, 0
    jmp    MJ_L81
MJ_L80:
    ldi    r25, hi8(-1)
MJ_L81:
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
    
    call    Solver_isDark
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
    #WANT breq MJ_L82
    brne   MJ_L83
    jmp    MJ_L82
    
    # then label for if
MJ_L83:
    
    # Block body
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
    brlt     MJ_L84
    ldi    r19, 0
    jmp    MJ_L85
MJ_L84:
    ldi    r19, hi8(-1)
MJ_L85:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L86
    ldi    r25, 0
    jmp    MJ_L87
MJ_L86:
    ldi    r25, hi8(-1)
MJ_L87:
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
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_findTargetOrMove
    # End of block
    jmp MJ_L88
    
    # else label for if
MJ_L82:
    # Block body
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L89
    ldi    r19, 0
    jmp    MJ_L90
MJ_L89:
    ldi    r19, hi8(-1)
MJ_L90:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L91
    ldi    r25, 0
    jmp    MJ_L92
MJ_L91:
    ldi    r25, hi8(-1)
MJ_L92:
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
    
    call    Solver_isBLUE
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
    #WANT breq MJ_L93
    brne   MJ_L94
    jmp    MJ_L93
    
    # then label for if
MJ_L94:
    
    # Block body
    # Color expression
    ldi    r22, 3
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
    brlt     MJ_L95
    ldi    r19, 0
    jmp    MJ_L96
MJ_L95:
    ldi    r19, hi8(-1)
MJ_L96:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L97
    ldi    r25, 0
    jmp    MJ_L98
MJ_L97:
    ldi    r25, hi8(-1)
MJ_L98:
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
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_move
    # End of block
    jmp MJ_L99
    
    # else label for if
MJ_L93:
    # Block body
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
    brlt     MJ_L100
    ldi    r19, 0
    jmp    MJ_L101
MJ_L100:
    ldi    r19, hi8(-1)
MJ_L101:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L102
    ldi    r25, 0
    jmp    MJ_L103
MJ_L102:
    ldi    r25, hi8(-1)
MJ_L103:
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
    
    call    Solver_isBLUE
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
    #WANT breq MJ_L104
    brne   MJ_L105
    jmp    MJ_L104
    
    # then label for if
MJ_L105:
    
    # Block body
    # Color expression
    ldi    r22, 3
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
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_move
    # End of block
    jmp MJ_L110
    
    # else label for if
MJ_L104:
    # Block body
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
    brlt     MJ_L111
    ldi    r19, 0
    jmp    MJ_L112
MJ_L111:
    ldi    r19, hi8(-1)
MJ_L112:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L113
    ldi    r25, 0
    jmp    MJ_L114
MJ_L113:
    ldi    r25, hi8(-1)
MJ_L114:
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
    
    call    Solver_isBLUE
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
    #WANT breq MJ_L115
    brne   MJ_L116
    jmp    MJ_L115
    
    # then label for if
MJ_L116:
    
    # Block body
    # Color expression
    ldi    r22, 3
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
    brlt     MJ_L117
    ldi    r19, 0
    jmp    MJ_L118
MJ_L117:
    ldi    r19, hi8(-1)
MJ_L118:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L119
    ldi    r25, 0
    jmp    MJ_L120
MJ_L119:
    ldi    r25, hi8(-1)
MJ_L120:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_move
    # End of block
    jmp MJ_L121
    
    # else label for if
MJ_L115:
    # Block body
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
    
    # SUBTRACT
    pop	r18
    # promoting a byte to an int
    tst     r18
    brlt     MJ_L122
    ldi    r19, 0
    jmp    MJ_L123
MJ_L122:
    ldi    r19, hi8(-1)
MJ_L123:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L124
    ldi    r25, 0
    jmp    MJ_L125
MJ_L124:
    ldi    r25, hi8(-1)
MJ_L125:
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
    
    call    Solver_isBLUE
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
    #WANT breq MJ_L126
    brne   MJ_L127
    jmp    MJ_L126
    
    # then label for if
MJ_L127:
    
    # Block body
    # Color expression
    ldi    r22, 3
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
    brlt     MJ_L128
    ldi    r19, 0
    jmp    MJ_L129
MJ_L128:
    ldi    r19, hi8(-1)
MJ_L129:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L130
    ldi    r25, 0
    jmp    MJ_L131
MJ_L130:
    ldi    r25, hi8(-1)
MJ_L131:
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
    pop    r16
    # load a one byte expression off stack
    pop    r17
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_move
    # End of block
    jmp MJ_L132
    
    # else label for if
MJ_L126:
    # Block body
    # End of block
    # done label for if
MJ_L132:
    # End of block
    # done label for if
MJ_L121:
    # End of block
    # done label for if
MJ_L110:
    # End of block
    # done label for if
MJ_L99:
    # End of block
    # done label for if
MJ_L88:
    # End of block
    # done label for if
MJ_L77:
    # End of block
    # done label for if
MJ_L66:
    # End of block
    # done label for if
MJ_L55:
/* epilogue start for Solver_move */
    # pop space off stack for parameters and locals
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
    .size Solver_move, .-Solver_move
    
    .text
.global Solver_mazeRow
    .type  Solver_mazeRow, @function
Solver_mazeRow:
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
    std    Y + 4, r20
    std    Y + 5, r18
/* done with function Solver_mazeRow prologue */
    
    
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
    
    #### if statement
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L134
    
    # load false
MJ_L133:
    ldi     r24, 0
    jmp      MJ_L135
    
    # load true
MJ_L134:
    ldi    r24, 1
    
    # push result of less than
MJ_L135:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L136
    brne   MJ_L137
    jmp    MJ_L136
    
    # then label for if
MJ_L137:
    
    # Block body
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
    brlt     MJ_L138
    ldi    r19, 0
    jmp    MJ_L139
MJ_L138:
    ldi    r19, hi8(-1)
MJ_L139:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L140
    ldi    r25, 0
    jmp    MJ_L141
MJ_L140:
    ldi    r25, hi8(-1)
MJ_L141:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeRow
    # End of block
    jmp MJ_L142
    
    # else label for if
MJ_L136:
    # Block body
    # End of block
    # done label for if
MJ_L142:
/* epilogue start for Solver_mazeRow */
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
    .size Solver_mazeRow, .-Solver_mazeRow
    
    .text
.global Solver_mazeCol
    .type  Solver_mazeCol, @function
Solver_mazeCol:
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
    std    Y + 4, r20
    std    Y + 5, r18
/* done with function Solver_mazeCol prologue */
    
    
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
    
    #### if statement
    
    # less than expression
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r24
    cp    r24, r18
    brlt MJ_L144
    
    # load false
MJ_L143:
    ldi     r24, 0
    jmp      MJ_L145
    
    # load true
MJ_L144:
    ldi    r24, 1
    
    # push result of less than
MJ_L145:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L146
    brne   MJ_L147
    jmp    MJ_L146
    
    # then label for if
MJ_L147:
    
    # Block body
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
    brlt     MJ_L148
    ldi    r19, 0
    jmp    MJ_L149
MJ_L148:
    ldi    r19, hi8(-1)
MJ_L149:
    pop	r24
    # promoting a byte to an int
    tst     r24
    brlt     MJ_L150
    ldi    r25, 0
    jmp    MJ_L151
MJ_L150:
    ldi    r25, hi8(-1)
MJ_L151:
    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24
    
    #### function call
    # put parameter values into appropriate registers
    # load a one byte expression off stack
    pop    r18
    # load a one byte expression off stack
    pop    r19
    # load a one byte expression off stack
    pop    r20
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25
    
    call    Solver_mazeCol
    # End of block
    jmp MJ_L152
    
    # else label for if
MJ_L146:
    # Block body
    # End of block
    # done label for if
MJ_L152:
/* epilogue start for Solver_mazeCol */
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
    .size Solver_mazeCol, .-Solver_mazeCol
    


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

