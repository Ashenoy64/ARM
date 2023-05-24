.data

A:.word 1,2,3,4,5
B:.word 0

.text

LDR r0,=A
B LOOP
LDMIA r0!,{r3,r4,r5}
Label:
    MOV r0,r0
    MOV r1,r1

MOv r1,#10

LOOP:
str r1,[r0]