;prog35.asm
;Programa en ensamblador usando procedimientos, el cual muestra una cadena
;de caracteres en pantalla...
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo DB 'Hola chavos!$'
	cDespedida DB 'Adios$'
.CODE
	inicio: 
		call Datos 
		
		mov dx, offset cSaludo
		call Mensaje
		
		mov dx, offset cDespedida
		call Mensaje 
		
		call ReadKey
		call Control
		
;--------------------------DECLARACION DE PROCEDIMIENTOS--------------------------
		Datos PROC Near 
			mov ax, @Data ;para pasar info a un segmento de datos, necesita haber un ax de intermediario
			mov ds, ax
			ret
		Datos ENDP
		
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
			mov ax, 4c00h ;termina programa, pasa control al dos para que aparezca el prompt de nuevo
			int 21h
			ret
		Control ENDP

	END inicio