;prog38.asm
;Programa en ensamblador el cual limpia la pantalla..

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
		mov bh, 15h ;El 2 es el color de fondo, el 5 es el color de texto
		
		;mov ch, 00h
		;mov cl, 00h
		mov cx, 0000h
		
		;mov dh, 18h
		;mov dl, 4fh
		mov dx, 184fh
		
		int 10h
		
		ReadKey
		Control
			
	END inicio