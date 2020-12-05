;prog40.asm
;Programa en ensamblador el cual limpia la pantalla y pinta 8 columnas
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
		mov bh, 07h 
		mov cx, 0000h
		mov dx, 1809h
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 17h 
		mov cx, 000Ah
		mov dx, 1813h
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 27h 
		mov cx, 0014h
		mov dx, 181Dh
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 37h 
		mov cx, 001Eh
		mov dx, 1827h
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 47h 
		mov cx, 0028h
		mov dx, 1831h
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 57h 
		mov cx, 0032h
		mov dx, 183Bh
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 67h 
		mov cx, 003Ch
		mov dx, 1845h
		int 10h
		
		mov ah, 06h
		mov al, 00h
		mov bh, 77h 
		mov cx, 0046h
		mov dx, 184Fh
		int 10h
		
		ReadKey
		Control
			
	END inicio