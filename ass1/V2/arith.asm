prog   START   0
        LDA     x       
        ADD     y       
        STA     sum

        LDA     x
        SUB     y
        STA     diff

        LDA     x
        MUL     y    
        STA     mult

        LDA     x
        DIV     y
        STA     divi

        LDA     divi       
        MUL     y              
        STA     sub2
        LDA     x
        SUB     sub2
        STA     mod     
             
        

x       WORD    12      
y       WORD    8       
sum     WORD    0       
diff    WORD    0       
mult    WORD    0       
divi    WORD    0       
mod     WORD    0   
sub2    WORD    0
        END     prog