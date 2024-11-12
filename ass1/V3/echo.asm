puts START 0
        JSUB    string
        LDA     #0x212
        JSUB    dec

halt    J   halt

string  LDCH    txt, X
        WD #1
        TIX #len
        JLT string
        
        STL     regL
        JSUB    nl
        LDL     regL
        RSUB
    

. rutina, ki izpiše znak v registru A
putc    WD #1
        RSUB

nl      STA nlA
        LDCH #10
        WD #1
        LDCH #13
        WD #1
        LDA nlA
        RSUB

dec     STL     regL
        STA     decA
        STA     res         
        LDX     #0    
        LDT     #3         

con     DIV     #10
        STA     div
        MUL     #10              
        STA     sub2
        LDA     res
        SUB     sub2
        
        ADD     #48           
        STA     decBuf, X     
        ADDR    T,X 

        LDA     div
        STA     res
        STX     decLen 
        COMP    #0
        JEQ     print
        J    con               

print   SUBR    T,X
        CLEAR A
        LDA decBuf,X
        WD #1
        RMO     X,A 
        COMP    #0
        JGT     print 
        JSUB nl    
        LDA     decA        
        LDL     regL     
        RSUB                   . Vrnemo se iz rutine  

txt     BYTE   C'hello world'
end     EQU *
len     EQU end - txt
nlA     WORD    0
decA    WORD    0
x       RESW    1 
regL    RESW    1             
decBuf  RESB    10             
decLen  RESW    1  
sub2    RESW    1
div     RESW    1
res     RESW    1

    END puts