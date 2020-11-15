;Prog03.asm
;Programa en ensamblador, el cual muestra varias cadenas
;de caracteres en pantalla...

.MODEL SMALL
.STACK 20h
.DATA
	cSaludo DB 'Hola chavos!$' ;si no le ponemos un $, la impresión sale con otros caracteres
	cDespedida DB 0ah, 'Hasta luegoo$' ;0ah permite hacer un salto de lìnea
	cOtro	DB 0ah, 'Otro mensaje$'
.CODE
	inicio:
		;se mandan los datos al segmento de datos
		mov ax, @Data ;para pasar info a un segmento de datos, necesita haber un ax de intermediario
		mov ds, ax
		;se manda a la pantalla la cadena de texto cSaludo
		mov dx, offset cSaludo
		mov ah, 09h
		int 21h
		
		mov dx, offset cDespedida
		
		mov ah, 09h
		int 21h
		
		mov dx, offset cOtro
		
		mov ah, 09h
		int 21h
		;lee un caracter, simula un Console.ReadKey
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h ;termina programa, pasa control al dos para que aparezca el prompt de nuevo
		int 21h
	END inicio