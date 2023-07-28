.data

A:.word 1,2,3,4,5,6,7,8,9
B:.word 1,2,3,4,5,6,7,8,9
C:.word 0,0,0,0,0,0,0,0,0


.text

MOV R1,#3 ;ROW NUMBER
MOV R2,#3 ;COLUMN NUMBER

LDR R3,=A ;SOURCE MATRIX ONE
LDR R4,=B ;SOURCE MATRIX TWO


LDR R5,=C

MOV R0,#0 ;ROW
MOV R11,#0 ;COLUMN

LOOP1:
    MOV R11,#0
    LOOP2:
        MOV LR,#0
        MOV R7,#0
        LOOP3:
        MUL R8,R0,R1
        ADD R8,R8,R7
        LDR R9,[R3,R8,LSL #2]

        MUL R8,R7,R2
        ADD R8,R8,R11
        LDR R10,[R3,R8,LSL #2]

        MLA LR,R10,R9,LR
        ADD R7,R7,#1
        CMP R7,R2
        BNE LOOP3
    MUL R8,R0,R1    
    ADD R8,R8,R11
    STR LR,[R5,R8,LSL #2]
    ADD R11,R11,#1
    CMP R11,R2
    BNE LOOP2
    ADD R0,R0,#1
    CMP R0,R1
    BNE LOOP1
    