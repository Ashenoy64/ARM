.data

exist:.ASCIZ "String is Present."
notExist:.ASCIZ "String not Present."

string:.ASCIZ "MISSISSIPI"
substr:.ASCIZ "POPPO"

.text

LDR r1,=exist
LDR r2,=notExist
LDR r3,=string
LDR r4,=substr
LDRb r6,[r4],#1

LOOP:
    LDRb r5,[r3],#1
    CMP r5,r6
    STMFD R13!, {r3,r4}
    BLeq CHECK
    CMP r5,#00
    Beq NOTFOUND
    Bne LOOP
B EXIT

CHECK:
    LDMFD R13!, {r7,r8}
    WHILE:
        LDRb r9,[r7],#1
        LDRb r10,[r8],#1
        CMP r10,#00
        Beq FOUND
        CMP r10,r9
        MOVne PC,LR
        B WHILE

FOUND:
    MOV r0,r1
    B OUTPUT

NOTFOUND:
    MOV r0,r2
    B OUTPUT

OUTPUT:
    SWI 0x02
    B EXIT

EXIT:
    SWI 0X11














