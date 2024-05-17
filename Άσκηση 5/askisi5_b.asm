.arm
.text
.global main
.equ true, 1
.equ false, 0
main:
STMDB R13!, {R1-R12}
LDR R0, = Table
MOV R1, #20
LDR R6, =flag
BL Subrtn
BL Startpoint3
LDMIA R13! , {R1-R12}
Subrtn:
STMDB R13!, {R2-R7}
MOV R3, #0
Startpoint1:
ADD R5, R3, #1
LDRB R2,[R0,R3]
MOV R4,R3
Startpoint2:
LDRB R6, [R0,R5]
CMP R6,R2
MOVLO R4,R5
MOVLO R2,R6
ADD R5,R5, #1
CMP R5,#20
BLO Startpoint2
LDRB R7, [R0,R3]
STRB R2,[R0,R3]
STRB R7, [R0,R4]
ADD R3,R3, #1
CMP R3,#19
BLO Startpoint1
LDMIA R13!, {R2-R7}
Startpoint3:
STMDB R13!, {R2-R5}
MOV R3,#0
MOV R5, #true
Startpoint4:
LDRB R2,[R0,R4]
ADD R4,R4 , #1
LDRB R3,[R0,R4]
CMP R3,R2
MOVLO R5,#false
ADD R4,R4,#1
CMP R4,#19
BLO Startpoint4
STRB R5,[R6]
LDMIA R13!, {R2-R5}
MOV PC,LR
.data
Table:
.byte 0x31,0x52,0x34,0xFA,0x1F,0xC8,0xB4, 0x98, 0x20, 0x21, 
0x02, 0xAA, 0xA1, 0xBA, 0x60, 0x30, 0xCC,0x77, 0xF7, 0xF8, 
0xF9
flag:
.byte true
