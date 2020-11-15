;Prog16.asm
;Programa en ensamblador el cual lee dos digitos de dos cifras cada uno y al final
;muestra el resultado de la suma de los mismos, utilizando registros.
;Sòlo funciona para cuando las sumas no exceden de 9.

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee dos digitos de dos cifras y al final muestra'
	         	DB ' la suma de ellos...'
				DB 0Ah, 0dh, 0ah,'$'    					
	cIngresar 	DB 0Ah, 0dh, 'Ingrese un digito de dos cifras: $'
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
		
;---- Se lee el primer nùmero de dos cifras y se almacena en el registro bx

		mov ah, 01h					;Se lee el primer nùmero y se guarda en al		
		int 21h 					
		sub al, 30h		
		mov bh, al
									
		mov ah, 01h
		int 21h
		sub al, 30h
		mov bl, al
		
		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
;---- Se lee el segundo nùmero de dos cifras y se almacena en el registro cx

		mov ah, 01h					;Se lee el primer nùmero y se guarda en al		
		int 21h 					
		sub al, 30h		
		mov ch, al
									
		mov ah, 01h
		int 21h
		sub al, 30h
		mov cl, al

;---- En los registros bx y cx se encuentran los dos digitos de dos cifras

		add bl, cl					;se suman las unidades de los nùmeros 
		add bh, ch					;se suman las decenas de los nùmeros
		
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