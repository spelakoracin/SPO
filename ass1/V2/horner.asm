horner   START 0

          LDA x_val
          MUL koef1 ; 1*x
          ADD koef2 ; (x+2)
          MUL x_val ; (x+2)*x
          ADD koef3 ; ((x+2)*x) + 3
          MUL x_val ; ((x+2)*x + 3)*x
          ADD koef4 ; ((x+2)*x + 3)*x+4
          MUL x_val ; (((x+2)*x + 3)*x+4)x
          ADD koef5 ; (((x+2)*x + 3)*x+4)x+ 5
          STA result

END_LOOP  J END_LOOP      ; Infinite loop to keep the program running

x_val     WORD 2           ; Spremenljivka za vrednost x
koef1     WORD 1           ; Shranjuje x^4
koef2     WORD 2           ; Shranjuje 2x^3
koef3     WORD 3           ; Shranjuje 3x^2
koef4     WORD 4           ; Shranjuje 4x
koef5     WORD 5           ; Konstantni člen 5
result    WORD 0           ; Rezultat polinoma

          END horner
