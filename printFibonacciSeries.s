.data
n:.word 20
space:.ASCIZ " "

.text
LDR r4,=n
LDR r4,[r4]
MOV r2,#0
MOV r3,#1
MOV r6,#1
LDR r5,=space
LOOP:
CMP r4,#0
Beq EXIT
BL PRINT
ADD r6,r2,r3
MOV r2,r3
MOV r3,r6
SUB r4,r4,#1
B LOOP

PRINT:
MOV r0,#1
MOV r1,r2
SWI 0x6b
MOV r0,r5
swi 0x02
MOV PC,LR


EXIT:
swi 0x11
