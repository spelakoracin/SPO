fak     START   0
        EXTREF sinit,spush,spop,sp
        

        LDX     #0
        +JSUB    sinit

        LDT     #0
        LDB     #10


read    CLEAR   A
        RD      #0xAA
        COMP    #0x0D   .če je enako, smo prebrali CR
        JEQ     next
        SUB     #48
        COMP    #0
        JEQ     halt
        ADDR    A,T
        MULR     B,T
        J       read

        

next    RD      #0xAA   .preberemo še LF
        RMO     T,A
        CLEAR   T 
        DIV     #10
        COMP    #0
        JEQ     halt
        JSUB    mulN

        CLEAR T 
        STA     res
        JSUB    rev

        LDA 0x0D
        WD  #0x01
        LDA 0x0A
        WD  #0x01
        J       read
halt    J   halt

rev     +STL @sp
        +JSUB    spush

        DIV     #10
        STA     div
        MUL     #10              
        STA     sub2
        LDA     res
        SUB     sub2
        ADD     #48       
        +STA    @sp
        +JSUB   spush
        LDA     div
        STA     res 
        COMP    #0
        JEQ     write
        JSUB    rev

write   +JSUB    spop
        +LDA @sp
        +WD  #0x01
        +JSUB    spop
        +LDL  @sp
        RSUB        


  
mulN    +STL @sp
        +JSUB    spush
        +STA @sp
        +JSUB    spush

        COMP    #1
        JEQ     mulOut
        SUB     #1
        JSUB    mulN

mulOut  +JSUB    spop
        +MUL @sp
        +JSUB    spop
        +LDL  @sp
        RSUB                    

sub2    RESW    1
div     RESW    1
res     RESW    1
        ORG     0xb800
screen  RESB    2000
        END     fak