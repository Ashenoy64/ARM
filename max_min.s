.data
array:.word 10,30,26,27,66,19,88,-1
max:.ASCIZ "MAX ELEMENT OF THE GIVEN ARRAY "
nextLine:.ASCIZ "\n"
min:.ASCIZ "MIN ELEMENT OF THE GIVEN ARRAY "

.text
ldr r0,=array
mov r1,#0 ;min
mov r2,#0 ;max
mov r10,#0
mov r5,#0


count:
    LDMia r0!,{r2}
	CMP r2,#-1
	ADDne r5,r5,#1
	Bne count

LDR r0,=array
LDMia r0,{r1}
LDMia r0!,{r2}
SUB r5,r5,#1

LOOP:
    CMP r5,#0
    Beq EXIT
    LDMia r0!,{r4}
    CMP r1,r4
    MOVgt r1,r4
    CMP r2,r4
    MOVlt r2,r4
    SUB r5,r5,#1
    B LOOP

EXIT:
    LDR r0,=min
    swi 0x02
    MOV r0,#1
    swi 0x6b

    LDR r0,=nextLine
    swi 0x02
    LDR r0,=max
    swi 0x02

    MOV r0,#1
    MOV r1,r2
    SWI 0x6b


