;Prog13.asm
;Programa en ensamblador el cual lee tres digitos y al final, muestra el resultado
;de la suma de los mismos, utilizando registros.

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee tres digitos y al final muestra la suma '
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
		
		mov ah, 01h					;Se lee el primer nùmero
		int 21h
		sub al, 30h
		
		mov bl, al					;y se pasa a bl
		
		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
		mov ah, 01h					;Se lee el segundo nùmero
		int 21h						;y queda en al
		sub al, 30h
		
		add bl, al       			;bl += al         ;bl = bl + al
		
		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
		mov ah, 01h					;Se lee el tercer nùmero
		int 21h						;y queda en al
		sub al, 30h
	
		add bl, al       			;bl += al         ;bl = bl + al
		
		mov ah, 09h
		mov dx, offset cSuma 
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