;Prog25_1.asm
;Programa en ensamblador el cual lee una serie de digitos y termina cuando la suma 
;de estos es mayor a 9

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee una serie de digitos y termina al acumular una '
	         	DB 'suma mayor a 9 (No valida entrada de digitos)...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cIngresar 	DB 0Ah, 0Dh, 'Ingrese un digito: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	vSuma		DB 00h
	
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
			sub al, 30h
		
			add vSuma, al
			
			cmp vSuma, 09h
			jbe eLeer 
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h

			mov ah, 08h					;Lee un caracter
			int 21h						;simula un Console.ReadKey				

		mov ax, 4c00h				;Regresar el control al DOS
		int 21h
			
	END inicio