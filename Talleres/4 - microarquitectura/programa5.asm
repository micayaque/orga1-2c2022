SET R0, 0x05
SET R2, 0x00

subrut: CMP R0, R2 
        JZ halt
        ADD R1, R0
        DEC R0 
        JMP subrut

halt:     JMP halt
