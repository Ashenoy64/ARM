.text
mrs r0,cpsr
mov r1,#0x80
bic r0, r1
msr CPSR_c,r0
swi 0x11