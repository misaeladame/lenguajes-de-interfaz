;Prog05.asm
;Programa en ensamblador el cual lee un caracter desde teclado y
;al final lo muestra en pantalla...

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip DB 'Programa que lee un caracter y lo muestra en pantalla', 0ah, 0dh, '$' ;si no le ponemos un $, la impresión sale con otros caracteres
	cIngresar DB 0ah, 'Ingrese un caracter: $'
	cSalida	DB 0ah, 'El caracter ingresado es $'
.CODE
	inicio:
		mov ax, @Data 
		mov ds, ax
		;se manda a la pantalla la cadena de texto cDescrip
		mov dx, offset cDescrip
		mov ah, 09h
		int 21h
		
		mov dx, offset cIngresar
		mov ah, 09h
		int 21h
		
		;Se lee un caracter
		mov ah, 08h   ;01h que aparezca lo que escribamos, 08h no aparezca lo que escribamos
		int 21h
		mov bl, al
		
		mov dx, offset cSalida  
		mov ah, 09h
		int 21h
		
		mov ah, 02h    
		mov dl, bl
		int 21h
		
		;lee un caracter, simula un Console.ReadKey
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h ;termina programa, pasa control al dos para que aparezca el prompt de nuevo
		int 21h
	END inicio