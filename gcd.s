.data
numberOne:.word 100
numberTwo:.word 120

.text
LDR r0,=numberOne
LDR r1,=numberTwo

LDR r0,[r0]
LDR r1,[r1]
CMP r0,#0
MOVeq r5,r1
BL GCD

GCD:
    CMP r0,r1
    SUBgt r0,r0,r1
    SUBle r1,r1,r0
    CMP r1,#0
    Bne GCD
    MOV r5,r0