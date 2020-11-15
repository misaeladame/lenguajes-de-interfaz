;Prog15.asm
;Programa en ensamblador el cual lee dos digitos y al final, muestra el resultado
;de la suma de los mismos, utilizando registros.
;Es similar al prog12.asm, solo que ahora, sin mexicanadas. En este programa se 
;restan 30h cada que se lee un digito y se agregan 30h cada que se muestra un 
;digito
;A diferencia del prog14.asm, este si funciona para cuando la suma excede de 9

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee dos digitos y al final muestra la suma '
	         	DB 'de ellos...'
				DB 0Ah, 0dh, 0ah,'$'    					
	cIngresar 	DB 0Ah, 0dh, 'Ingrese un digito: $'
	cSuma  		DB 0Ah, 0dh, 'El resultado de la suma de los digitos es $'
	cFinProg	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	
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
		
		mov ah, 01h					;Se lee el primer nùmero y se guarda en al
		int 21h 					
		sub al, 30h					;a al se le restan 30h para que quede el
									;valor tal cual del numero

		mov bl, al					;y se pasa a bl
		
		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
		mov ah, 01h					;Se lee el segundo nùmero
		int 21h						
		sub al, 30h					;a al se le restan 30h para que quede el
									;valor tal cual del numero
		
		add bl, al       			;bl += al         ;bl = bl + al
		
		cmp bl, 9 					;if(bl > 9)
		ja  eAjuste
		jmp eSalida
		
		eAjuste:
			sub bl, 10 ;0Ah
			mov bh, 01 ;01h
		
		eSalida:		
			mov ah, 09h
			mov dx, offset cSuma 
			int 21h
			
			mov ah, 02h 
			mov dl, bh 
			add dl, 30h
			int 21h
			
			mov ah, 02h 
			mov dl, bl 
			add dl, 30h
			int 21h
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
			
		    mov ah, 08h				
		    int 21h		

		    mov ax, 4c00h
		    int 21h
		
	END inicio