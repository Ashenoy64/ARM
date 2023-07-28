.data

elementFound:.ASCIZ "Given Number Exist"
elementNotFound:.ASCIZ "Given Element Does Not Exist"


size:.word 8 ;0 based indexing
list:.word 10,20,30,90,100,200,300,400,900

searchElement:.word 1000

.text

;r1 end
;r2 base address of list
;r3 start
;r4 mid
;r10 search element 

LDR r1,=size
LDR r1,[r1]
LDR r2,=list
MOV r3,#0

LDR r10,=searchElement
LDR r10,[r10]

START:
    CMP r1,r3
    Bge LOOP
    B NOTFOUND

LOOP:
    ADD r4,r1,r3
    MOV r4,r4,lsr #1
    LDR r5,[r2,r4,lsl #2]
    CMP r5,r10
    BLeq FOUND
    BLgt GREATERTHAN
    BLlt LESSTHAN
    B START

LESSTHAN:
    ADD r3,r4,#1
    MOV pc,lr

GREATERTHAN:
    SUB r1,r4,#1
    MOV PC,LR

FOUND:
    LDR r0,=elementFound
    SWI 0x02
    B EXIT

NOTFOUND:
    LDR r0,=elementNotFound
    SWI 0x02
    B EXIT

EXIT:
    SWI 0x11