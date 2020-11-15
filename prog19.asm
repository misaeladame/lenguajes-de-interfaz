;Prog19.asm
;Programa ensamblador el cual lee dos digitos y al final muestra el resultado
;de la suma de los mismos, UTILIZANDO REGISTROS.
;Es similar al prog15, solo que ahora, utilizando la instruccion AAA

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee dos digitos y al final muestra '
	         	DB 'la suma de ellos...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cIngresar 	DB 0Ah, 0Dh, 'Ingrese un digito: $'
	cSuma		DB 0Ah, 0dh, 'El resultado de la suma de los digitos es: $'
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
		
		mov ah, 01h 				;Se lee el primer digito y se guarda en al
		int 21h	
		sub al, 30h					;a al se le restan 30h para que quede el 
									;valor del nùmero

		mov bl,al					;y se pasa a bl

		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
		mov ah, 01h 				;Se lee el segundo digito desde el teclado
		int 21h						
		sub al,30h
		
;----------------------------------------------------
		
		mov ah, 00h
		add al, bl
		aaa
	   	mov bx, ax

;------ despuès de esto queda en ah la decena de la suma y en la unidad de la suma ------

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