.data
A:.word 10,20,30,40,50,60,70,30,100,300,450,-1;

.text
ldr r0,=A
mov r1,#0
mov r10,#0
mov r5,#0

count:ldmia r0!,{r2}
	cmp r2,#-1
	addne r5,r5,#1
	bne count

ldr r0,=A

loop:ldmia r0!,{r2}
	add r10,r10,r2;
	add r1,r1,#1
	cmp r1,r5
	bne loop
	swi 0x011
.end