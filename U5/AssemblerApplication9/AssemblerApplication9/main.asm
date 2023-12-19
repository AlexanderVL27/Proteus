;
; AssemblerApplication9.asm
;
; Created: 08/06/2023 12:05:27 a. m.
; Author : villa_xaz9a7o
;


; Replace with your application code
.include "m8535def.inc"
 .org $00
 rjmp inicio
 .org $15
inicio: ldi r16,$5f 
 out spl,r16
 ldi r17,$02
 out sph,r17
ldi r16,$0
 out ddra,r16
 ldi r16,$FF
out ddrc,r16
 out ddrd,r16
ldi r25,0
I_Hora1: ldi r24,$02 ;E0
I_Hora2: ldi r23,$13 ;D0
I_Min1: ldi r22,$35 ;B0
I_Min2: ldi r21,$49 ;70
I_Seg1: ldi r25,$60
I_Seg2: ldi r26,$70
I_Reset: ldi r16,0
Contador: out portc,r21
in r20,pina
ldi r17,2
rcall delay
out portc, r22
ldi r17,2
rcall delay
out portc,r23
ldi r17,2
rcall delay 
out portc,r24
ldi r17,2
rcall delay
out portc,r26
ldi r17,2
rcall delay
out portc,r25
ldi r17,2
rcall delay
inc r16
cp r16,r20
brne Contador
inc r26
cpi r26,$7A ;78 =======
brne Reset
inc r25
cpi r25,$66
brne Seg2
inc r21
cpi r24,$02 
brlt Seg9
cpi r23,$13 
brlt Seg9
cpi r22,$36
brlt Seg9
cpi r21,$4A 
brne Seg1
rjmp continuar1
continuar1: inc r22
cpi r24,$02 
brlt Min9
cpi r23,$15 
brlt Min9
cpi r22,$36 
brne Min2
rjmp continuar2
continuar2: inc r23
cpi r24,$02 
brlt Hora9
cpi r23,$14 
brne Min1
rjmp continuar3
continuar3: inc r24
cpi r24,$02 
brne Hora2
rjmp Hora1
Seg9: cpi r21,$4A 
brne Seg1
rjmp continuar1
Min9: cpi r22,$36
brne Min2
rjmp continuar2
Hora9: cpi r23,$1A
brne Min1
rjmp continuar3
Hora1: ldi r24,$00 ;E0
Hora2: ldi r23,$10 ;D0
Min1: ldi r22,$30 ;B0
Min2: ldi r21,$40 ;70
Seg1: ldi r25,$60
Seg2: ldi r26,$70
Reset: ldi r16,0
rjmp Contador
delay: ;ldi r17,@0
ldi r19,0
out TCCR1A,R19
ldi r18,4
repite: push r18
out TIFR,r18
ldi r18,$FC
out TCNT1H,r18
ldi r18,$17
out TCNT1L,r18
ldi r18,$1
out TCCR1B,r18
leer: in r18,TIFR
andi r18,$4
cpi r18,$4
brne leer
clr r18
out TCCR1B,r18
pop r18
inc r19
cp r19,r17
brlt repite
ret