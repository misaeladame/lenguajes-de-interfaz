;Prog24.asm
;Programa en ensamblador el cual lee un caracter y termina en ejecucion cuando el 
;caracter ingresado es un digito
;Es similar al prog23.asm, con la diferencia de que ahora cuenta el total de 
;intentos para ingresar el digito

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee un caracter y termina su ejecucion al leer un '
	         	DB 'digito (valida que un caracter sea un digito)...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cIngresar 	DB 0Ah, 0Dh, 'Ingrese un digito: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	vCont		DB 00h
	cSalida		DB 0Ah, 0Dh, 'El total de caracteres ingresados fue de $'
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		eLeer:
			inc vCont
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
		
		eSalida:
			mov ah, 09h
			mov dx, offset cSalida 
			int 21h
			
			mov ah, 02h
			mov dl, vCont
			add dl, 30h
			int 21h
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h

			mov ah, 08h					;Lee un caracter
			int 21h						;simula un Console.ReadKey				

		mov ax, 4c00h				;Regresar el control al DOS
		int 21h
			
	END inicio