cat START   0

read    CLEAR   A
        RD      #0x00
        WD      #0x01
        J       read

    END     cat