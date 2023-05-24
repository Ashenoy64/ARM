.data
factorialNumber:.word 5

.text
LDR r1,=factorialNumber
LDR r1,[r1]
BL FACTORIAL
B EXIT

FACTORIAL:
    MOV r7,#1
    LOOP:
        MUL r7,r1,r7
        SUB r1,r1,#1
        cmp r1,#1
        MOVeq PC,LR
        B LOOP


EXIT:
    SWI 0x11


