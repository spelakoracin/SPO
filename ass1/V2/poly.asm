poly      START 0

          LDA x_val        ; Priprava za izračun x^4
          MULR A, A        ; A = x^2
          MULR A, A        ; A = x^4
          STA koef1        ; Shrani x^4 v koef1

          LDA x_val        ; Priprava za izračun 2x^3
          MUL x_val       ; A = x^2
          MUL x_val        ; A = x^3
          ADDR A,A         ; A = 2 * x^3
          STA koef2        ; Shrani 2x^3 v koef2

          LDA x_val        ; Priprava za izračun 3x^2
          MUL x_val        ; A = x^2
          RMO A,B
          ADDR A,A        ; A = 2x^2
          ADDR B,A        ; A = 3x^2
          STA koef3       ; Shrani 3x^2 v koef3

          LDA x_val      ; Priprava za izračun 4x
          ADD  x_val     ; A = 2x
          ADD  x_val     ; A = 3x
          ADD  x_val     ; A = 4x
          STA koef4        ; Shrani 4x v koef4

          LDA #5           ; Konstantni člen 5
          STA koef5        ; Shrani 5 v koef5

          ; Izračunamo vsoto vseh členov
          LDA koef1        ; A = x^4
          ADD koef2        ; A = x^4 + 2x^3
          ADD koef3        ; A = x^4 + 2x^3 + 3x^2
          ADD koef4        ; A = x^4 + 2x^3 + 3x^2 + 4x
          ADD koef5        ; A = x^4 + 2x^3 + 3x^2 + 4x + 5
          STA result       ; Končni rezultat shrani v result

x_val     WORD 2           ; Spremenljivka za vrednost x
koef1     WORD 0           ; Shranjuje x^4
koef2     WORD 0           ; Shranjuje 2x^3
koef3     WORD 0           ; Shranjuje 3x^2
koef4     WORD 0           ; Shranjuje 4x
koef5     WORD 5           ; Konstantni člen 5
result    WORD 0           ; Rezultat polinoma

          END poly