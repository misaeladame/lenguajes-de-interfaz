;prog37.asm
;Programa en ensamblador el cual utiliza macros...

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

Mensaje MACRO cadena
	mov ah, 09h
	mov dx, offset cadena
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
		
		Mensaje cSaludo
		
		Mensaje cDespedida
		
		ReadKey
		Control
			
	END inicio