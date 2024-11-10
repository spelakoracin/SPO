print   START   0

        LDA #83         .znak S
        WD  #0xAA
        LDA #73         .znak I
        WD  #0xAA
        LDA #67         .znak C
        WD  #0xAA
        LDA #47         .znak /
        WD  #0xAA
        LDA #88         .znak X
        WD  #0xAA
        LDA #69         .znak E
        WD  #0xAA
        LDA #13         .znak CR
        WD  #0xAA
        LDA #10         .znak LF
        WD  #0xAA

halt    J   halt

        END     print