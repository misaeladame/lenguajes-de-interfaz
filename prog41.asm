;prog41.asm
;Programa en ensamblador el cual limpia la pantalla y pinta 8 columnas
;de diferente color..
;A diferencia del prog40, ahora utilizamos macros para reducir la cantidad
;de codigo en el programa

Pinta MACRO Color, eIni, eFin
	mov ah, 06h
	mov al, 00h
	mov bh, Color 
	mov cx, eIni
	mov dx, eFin
	int 10h
ENDM

Datos MACRO
	mov ax, @Data 
	mov ds, ax
ENDM

ReadKey MACRO
	mov ah, 08h				
	int 21h
ENDM

Control MACRO
	mov ax, 4c00h 
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	cSaludo    DB 'Hola chavos!$'
	cDespedida DB 0Ah, 0Dh, 'Adios$'
.CODE
	inicio: 
		Datos

		Pinta 	07h, 0000h, 1809h
		Pinta   17h, 000Ah, 1813h
		Pinta   27h, 0014h, 181Dh
		Pinta	37h, 001Eh, 1827h
		Pinta	47h, 0028h, 1831h
		Pinta	57h, 0032h, 183Bh
		Pinta	67h, 003Ch, 1845h
		Pinta	77h, 0046h, 184Fh
		
		ReadKey
		Control
			
	END inicio