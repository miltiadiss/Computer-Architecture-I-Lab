.arm
.text
.global main
main:
STMDB R13!, {R0-R12, R14}
MOV R4, #0
BL Subrtn 
BL Subrtn 
BL Subrtn
BL Subrtn 
LDMIA R13!, {R0-R12, R14}
MOV PC,LR
Subrtn:
STMDB R13!, {R1-R12, R14}
MOV R12, #0
LDR R1,=Values @Θέτουμε τον R1 να δείχνει στις διευθύνσεις του 
πίνακα Values που περιέχει τις τιμές του x
LDR R1,[R1,R4] @Μεταφέρουμε στον R1 το byte της διεύθυνσης μνήμης 
όπου δείχνει ο R1
LDR R0,=Const @Θέτουμε τον R0 να δείχνει στις διευθύνσεις του 
πίνακα Const
LDRB R0,[R0,R12] @Μεταφέρουμε στον R0 το byte της διεύθυνσης 
μνήμης όπου δείχνει ο R0
ADD R8,R0,#0 @Στην ουσία αποθηκευούμε στον R8 το a0
ADD R12,R12,#1 @Αυξάνουμε το περιεχόμενο του R12 κατά 1 για να 
μεταβούμε στο byte της επόμενης διεύθυνσης όπου δείχνει ο R0 (2η
τιμή του x)
LDR R0,=Const @Θέτουμε τον R0 να δείχνει στις διευθύνσεις του 
πίνακα Const
LDRB R0,[R0,R12] @Μεταφέρουμε στον R0 το byte της διεύθυνσης 
μνήμης όπου δείχνει ο R0
MUL R9,R1,R0 @Πολλαπλασιάζουμε τα περιεχόμενα των R1, R0 και το 
αποτέλεσμα το αποθηκεύουμε στον R9 (δηλαδή κάνουμε x*a1)
ADD R8,R8,R9 @Προσθέτουμε τα περιεχόμενα των R8, R9 και το 
αποτέλεσμα (a1*x+a0) το αποθηκεύουμε στον R8
ADD R12,R12,#1 @Αυξάνουμε το περιεχόμενο του R12 κατά 1 για να 
μεταβούμε στο byte της επόμενης διεύθυνσης όπου δείχνει ο R0 (3
η
τιμή του x)
LDR R0,=Const @Θέτουμε τον R0 να δείχνει στις διευθύνσεις του 
πίνακα Const
LDRB R0,[R0,R12] @Μεταφέρουμε στον R0 το byte της διεύθυνσης 
μνήμης όπου δείχνει ο R0
MUL R9,R1,R1 @Πολλαπλασιάζουμε τα περιεχόμενα των R1, R1 και το 
αποτέλεσμα το αποθηκεύουμε στον R9 (δηλαδή κάνουμε x*x=x
2)
MUL R0,R9,R0 @Πολλαπλασιάζουμε τα περιεχόμενα των R9, R0 και το 
αποτέλεσμα το αποθηκεύουμε στον R0 (δηλαδή κάνουμε x*x*a2 = x
2*a2)
ADD R8,R8,R0 @Προσθέτουμε τα περιεχόμενα των R8, R0 και το 
αποτέλεσμα (a2*x
2+a1*x+a0) το αποθηκεύουμε στον R8
ADD R12,R12,#1 @Αυξάνουμε το περιεχόμενο του R12 κατά 1 για να 
μεταβούμε στο byte της επόμενης διεύθυνσης όπου δείχνει ο R0 (4
η
τιμή του x)
Startpoint:
LDR R0,=Const @Θέτουμε τον R0 να δείχνει στις διευθύνσεις του 
πίνακα Const
LDRB R0,[R0,R12] @Μεταφέρουμε στον R0 το byte της διεύθυνσης 
μνήμης όπου δείχνει ο R0
MUL R9,R1,R9 @Πολλαπλασιάζουμε τα περιεχόμενα των R9, R1 και το 
αποτέλεσμα το αποθηκεύουμε στον R9 (δηλαδή κάνουμε x*x
2=x
3)
MUL R0,R9,R0 @Πολλαπλασιάζουμε τα περιεχόμενα των R9, R0 και το 
αποτέλεσμα το αποθηκεύουμε στον R0 (δηλαδή κάνουμε x*x
2*a3=x
3*a3)
ADD R8,R8,R0 @Προσθέτουμε τα περιεχόμενα των R8, R0 και το 
αποτέλεσμα (a3*x
3+a2*x
2+a1*x+a0) το αποθηκεύουμε στον R8
ADD R12,R12,#1
CMP R12,#6 @Ο βρόχος επαναλαμβάνβεται άλλες τρεις φορές για να 
υπολογίσουμε τα a4*x
4, a5*x
5, a6*x
6 και να υπολογίσουμε τη τελική 
τιμή του πολυωνύμου
BLE Startpoint
ADD R4,R4,#4
LDR R6,=Results
STR R8,[R6,R4] @Αποθηκεύουμε στον R6 που δείχνει στον πίνακα 
Results το περιεχόμενο του R8, δηλαδή τη τελική τιμή του 
πολυωνύμου
LDMIA R13!,{R0-R10}
MOV PC,LR
.data
Values:
.word 0x10
.word 0x50A
.word 0xCDCA
.word 0x80AB
Const:
.byte 0x04, 0x07, 0x05
.byte 0x20, 0x1A, 0x12, 0x06
Results:
.word 0,0,0,0
