;prog36.asm
;Programa en ensamblador el cual utiliza macros y procedimientos...

Datos MACRO
	mov ax, @Data 
	mov ds, ax
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	cSaludo    DB 'Hola chavos!$'
	cDespedida DB 0Ah, 0Dh, 'Adios$'
.CODE
	inicio: 
		Datos
		
		mov dx, offset cSaludo
		call Mensaje
		
		mov dx, offset cDespedida
		call Mensaje 
		
		call ReadKey
		call Control
		
;--------------------------DECLARACION DE PROCEDIMIENTOS--------------------------
	
		Mensaje PROC Near 
			mov ah, 09h
			int 21h
			ret
		Mensaje ENDP
		
		ReadKey PROC Near 
			mov ah, 08h				
			int 21h
			ret 
		ReadKey ENDP
		
		Control PROC Near 
			mov ax, 4c00h 
			int 21h
			ret
		Control ENDP

	END inicio