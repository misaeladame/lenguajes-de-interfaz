;Prog21.asm
;Programa en ensamblador el cual lee dos digitos y al final, muestra cual de ellos
;es mayor
;Es similar al prog20.asm, solo que ahora indica el valor del numero mayor

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee dos digitos y al final indica cual de ellos  '
	         	DB 'es mayor...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cIngresar 	DB 0Ah, 0Dh, 'Ingrese un digito: $'
	cMayor		DB 0Ah, 0dh, 'El mayor de los numeros es el $'
	cIguales	DB 0Ah, 0dh, 'Los numeros son iguales $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
		mov ah, 01h 				;Se lee el primer digito desde el teclado
		int 21h	
		sub al, 30h

		
		mov bl, al					;se pasa a bl

		mov dx, offset cIngresar
		mov ah, 09h
		int 21h
		
		mov ah, 01h 				;Se lee el segundo digito desde el teclado
		int 21h						
		sub al, 30h					;a al se le restan 30h para que quede el
									;valor del numero
									
		mov cl, al
;----------------------------------------------------
; cl = num2, bl = num1
		
		
		cmp bl, al 
		ja  eMayor1
		jb  eMayor2
		jmp eIguales

		eMayor1:
			mov ah, 09h
			mov dx, offset cMayor 
			int 21h
			
			mov ah, 02h
			mov dl, bl 
			add dl, 30h
			int 21h
			jmp eFinProg 
			
		eMayor2:
			mov ah, 09h
			mov dx, offset cMayor 
			int 21h
			
			mov ah, 02h
			mov dl, cl 
			add dl, 30h
			int 21h	
			jmp eFinProg 
			
		eIguales:
			mov ah, 09h
			mov dx, offset cIguales
			int 21h
			
			mov ah, 02h
			mov dl, bl 
			add dl, 30h
			int 21h
			jmp eFinProg 
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h

			mov ah, 08h				
			int 21h				

			mov ax, 4c00h
			int 21h
			
	END inicio