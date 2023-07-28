.data
A:.word 0x12345678
B:.word 65
C:.word 0

.text

LDR r1,=A
ldr r2,=B
ldr r3,=C

ldr r4,[r1]
ADDS R5,R4,R4,LSL #6
STR r5,[r3]
swi 0x011

.end











# .text
# LDR R0,=a
# LDR R4,[R0]
# LDR R1,=b
# ADD R2,R4,R4,LSL #6
# SWI 0x11
# .data
# a: .word 0x12345678
# b: .word 65