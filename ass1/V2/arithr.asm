prog   START   0
        LDA     x       
        LDB     y 

        ADDR A,B
        STB  sum    
        SUBR A,B
        
        SUBR B,A
        STA diff
        ADDR B,A
        
        MULR B,A
        STA prod
        DIVR B,A
        
        RMO  A,X
        DIVR B,A
        STA quot

        MULR B,A
        SUBR A,X 
        STX  mod


x       WORD    13      
y       WORD    3       
sum     WORD    0      
diff    WORD    0       
prod    WORD    0       
quot    WORD    0       
mod     WORD    0     
        END     prog