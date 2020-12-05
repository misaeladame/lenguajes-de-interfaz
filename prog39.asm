;prog39.asm
;Programa en ensamblador el cual limpia la pantalla y pinta 2 rectangulos
;de diferente color..

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
		
		mov ah, 06h
		mov al, 00h
		mov bh, 17h 
		mov cx, 0000h
		mov dx, 1828h
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 21h 
		mov cx, 0029h
		mov dx, 184fh
		int 10h
		
		ReadKey
		Control
			
	END inicio