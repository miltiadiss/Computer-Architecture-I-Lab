.arm
.text
.global main
main:
STMDB R13!, {R0-R12, R14}
MOV R0, #0 
LDR R1, =Array_A
LDR R2, =Array_B
LDR R3, =Array_C 
Startpoint:
LDRΗ R5, [R1], #2 @το επόμενο στοιχείο του πίνακα απέχει 2 bytes από 
το προηγούμενο μέσα στη μνήμη
LDRΗ R6, [R2], #2 @το επόμενο στοιχείο του πίνακα απέχει 2 bytes από 
το προηγούμενο μέσα στη μνήμη
ADD R6, R6, R5
STRΗ R6, [R3], #2 @το επόμενο στοιχείο του πίνακα απέχει 2 bytes από 
το προηγούμενο μέσα στη μνήμη
ADD R0, R0, #2
CMP R0, #16
BNE Startpoint
LDMIA R13!, {R0-R12, PC}
.data
Array_A:
.hword 32,127,254,57,22,111,48,11,87,45,114,45,66,23,134,168
Array_B:
.hword 19,1,18,89,90,112,89,32,23,98,67,83,146,140,200,67
Array_C:
.hword 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
