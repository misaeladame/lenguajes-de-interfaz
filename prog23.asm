;Prog23.asm
;Programa en ensamblador el cual lee un caracter y termina en ejecucion cuando el 
;caracter ingresado es un digito

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee un caracter y termina su ejecucion al leer un '
	         	DB 'digito (valida que un caracter sea un digito)...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cIngresar 	DB 0Ah, 0Dh, 'Ingrese un digito: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		eLeer:
			mov dx, offset cIngresar	;Se manda a pantalla la
			mov ah, 09h					;cadena de texto cIngresar
			int 21h
			
			mov ah, 01h 				;Se lee el primer numero y se guarda en al
			int 21h	
		
;-----------------------------------------------------
		cmp al, '0'
		jb  eLeer
		
		cmp al, '9'
		ja  eLeer
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h

			mov ah, 08h				
			int 21h				

			mov ax, 4c00h
			int 21h
			
	END inicio