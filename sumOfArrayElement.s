.data
array:.word 10,20,30,40,-1;

;r10 Preindexing Without Writeback
;r9 PostIndexing
;r8 Preindexing With Writeback

.text
LDR r0,=array
MOV r1,#0
MOV r10,#0
MOV r9,#0
MOV r8,#0
MOV r5,#0
BL SIZE

LDR r0,=array

MOV r3,#0
BL LOOPpre
MOV r3,#0
BL LOOPpost
LDR r0,=array
MOV r3,#1
BL LOOPpreWB
LDR r0,=array
LDR r3,[r0]
ADD r8,r8,r3

B EXIT


LOOPpre:
    LDR r2,[r0,r3,LSL #2]
	ADD r10,r10,r2;
	ADD r3,r3,#1
	CMP r3,r5
	Bne LOOPpre
	MOV PC,LR

LOOPpreWB:
	LDR r2,[r0,#4]!
	ADD r8,r8,r2;
	ADD r3,r3,#1
	CMP r3,r5
	Bne LOOPpreWB
	MOV PC,LR

LOOPpost:
	LDR r2,[r0],#4
	ADD r9,r9,r2;
	ADD r3,r3,#1
	CMP r3,r5
	Bne LOOPpost
	MOV PC,LR

EXIT:
	SWI 0x11

SIZE:
    LDMia r0!,{r2}
	CMP r2,#-1
	ADDne r5,r5,#1
	Bne SIZE
    MOV PC,LR
    