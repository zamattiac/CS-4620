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
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_A
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
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(6)
    ldi r24, lo8(6)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    # End of block
    jmp MJ_L8
    
    # else label for if
MJ_L6:
    # done label for if
MJ_L8:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_B
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
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(5)
    ldi r24, lo8(5)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    # End of block
    jmp MJ_L14
    
    # else label for if
MJ_L12:
    # done label for if
MJ_L14:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Up
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L15
MJ_L17:
    ldi   r24, 1
    jmp   MJ_L16
MJ_L15:
MJ_L16:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L18
    brne   MJ_L19
    jmp    MJ_L18
    
    # then label for if
MJ_L19:
    
    # Block body
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(5)
    ldi r24, lo8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(1)
    ldi r24, lo8(1)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(0)
    ldi r24, lo8(0)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    # End of block
    jmp MJ_L20
    
    # else label for if
MJ_L18:
    # done label for if
MJ_L20:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Down
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L21
MJ_L23:
    ldi   r24, 1
    jmp   MJ_L22
MJ_L21:
MJ_L22:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L24
    brne   MJ_L25
    jmp    MJ_L24
    
    # then label for if
MJ_L25:
    
    # Block body
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(3)
    ldi r24, lo8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(1)
    ldi r24, lo8(1)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    # End of block
    jmp MJ_L26
    
    # else label for if
MJ_L24:
    # done label for if
MJ_L26:
    #### if statement
    
    ### MeggyCheckButton
    call   _Z16CheckButtonsDownv
    lds   r24,     Button_Left
    # if button value is zero, push 0 else push 1
    tst   r24
    breq   MJ_L27
MJ_L29:
    ldi   r24, 1
    jmp   MJ_L28
MJ_L27:
MJ_L28:
    # push one byte expression onto stack
    push   r24
    
    # load condition and branch if false
    # load a one byte expression off stack
    pop    r24
    #load zero into reg
    ldi    r25, 0
    
    #use cp to set SREG
    cp     r24, r25
    #WANT breq MJ_L30
    brne   MJ_L31
    jmp    MJ_L30
    
    # then label for if
MJ_L31:
    
    # Block body
    /* Load constant */
    ldi r25, hi8(3)
    ldi r24, lo8(3)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(1)
    ldi r24, lo8(1)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    # End of block
    jmp MJ_L32
    
    # else label for if
MJ_L30:
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
    /* Load constant */
    ldi r25, hi8(5)
    ldi r24, lo8(5)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Load constant */
    ldi r25, hi8(4)
    ldi r24, lo8(4)
    /* Push constant onto stack */
    push r25
    push r24
    
    /* Byte cast */
    pop r24
    pop r25
    ldi r25, lo8(0)
    push r25
    push r24
    
    /* Color literal */
    ldi r25, hi8(1)
    ldi r24, lo8(1)
    /* Push color literal onto stack */
    push r25
    push r24
    
    /* Meggy Set Pixel */
    pop r20
    pop r25
    pop r22
    pop r25
    pop r24
    pop r25
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev
    # End of block
    jmp MJ_L38
    
    # else label for if
MJ_L36:
    # done label for if
MJ_L38:
    # End of block
    # jump to while test
    jmp    MJ_L0
    
    # end of while
MJ_L2:
    
    # End of block
