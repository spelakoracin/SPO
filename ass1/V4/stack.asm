stk    START   0
        EXTDEF  sinit,spop,spush,sp

sinit   STA     stackA      .shranimo vrednost registra A
        LDA     #stack      .naložimo naslov, kjer se stack začne v reg A      
        STA     sp          .shranimo naslov v reg A v sp
        LDA     stackA      .obnovimo vrednost registra A     
        RSUB                       


spush   STA     stackA
        LDA     sp           .v A naložimo vrednost sp                
        ADD     #3           .sp povečamo za 3 (kaže na naslednji naslov) 
        STA     sp           .shranimo novo vrednost sp  
        LDA     stackA               
        RSUB                      

spop    STA     stackA
        LDA     sp            .v A naložimo vrednost sp                 
        SUB     #3            .sp zmanjšamo za 3 
        STA     sp            .shranimo novo vrednost sp 
        LDA     stackA              
        RSUB                       

sp           WORD    0 
stackA       WORD    0
stack        RESW    1000    

        END     stk