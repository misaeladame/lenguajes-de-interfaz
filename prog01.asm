;prog01.asm
;Primer programa en ensamblador, el cual muestra una cadena
;de caracteres en pantalla...
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo DB 'Hola chavos!'
.CODE
	inicio: 
		mov ax, @Data ;para pasar info a un segmento de datos, necesita haber un ax de intermediario
		mov ds, ax
		
		mov dx, offset cSaludo
		mov ah, 09h
		int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h ;termina programa, pasa control al dos para que aparezca el prompt de nuevo
		int 21h
	END inicio