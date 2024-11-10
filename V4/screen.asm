prog     START   0

        LDCH     #97 
        JSUB    fill
        JSUB    clear

halt    J       halt

clear   STL     regL
        LDCH     #0            
        JSUB    fill
        LDL     regL 
        RSUB                   


fill    LDX     #0            
        LDB     scrlen     
loop    +STCH     screen, X

        TIXR    B             
        JLT     loop
        COMPR   T,X  

        LDX     x       
        RSUB                 

x  RESW    1  
regL  RESW    1                
scrcols WORD    50           
scrrows WORD    50            
scrlen  WORD    2000 

         ORG     0xb800
screen   RESB    2000     

        END     prog
