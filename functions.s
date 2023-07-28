
;R1=(firstNumber+secondNumber)*thirdNumber

.DATA
A: .WORD 0

firstNumber:.word 13
secondNumber:.word 14
thirdNumber:.word 12

.TEXT
LDR R0,=firstNumber 
LDR R1,=secondNumber
LDR R2,=thirdNumber

LDR R0,[R0]
LDR R1,[R1]
LDR R2,[R2]

STMFD R13!, {R0, R1, R2}
BL MULFUNC
LDR R6, =A
STR R2, [R6]
MOV R1,R7
MOV R0,#1
SWI 0X6B
SWI 0X11

MULFUNC:
    LDMFD R13!, {R3, R4, R5}
    STMFD R13!, {R3, R4, LR}
    BL ADDFUNC
    LDMFD R13!, {LR}
    MUL R7, R8, R5
    MOV PC, LR

ADDFUNC:
    LDMFD R13!, {R6, R7}
    ADD R8, R6, R7
    MOV PC, LR
