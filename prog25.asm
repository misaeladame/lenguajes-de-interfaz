;Prog25.asm
;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL 
;Programa en ensamblador el cual lee 10 caracteres y al final indica cuantos de estos caracteres fueron dígitos, 
;cuantos fueron letras y cuantos fueron otro tipo de caracteres. y muestra estos datos al finalizar la ejecución.

.MODEL SMALL
.STACK 20h
.DATA
	cNombreAlumno DB 'Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL'
				  DB 0Ah, 0Ah, 0Dh, '$'
	cDescrip 	DB 'Programa que lee 10 caracteres y al final indica cuantos de estos caracteres fueron digitos '
	         	DB 'cuantos fueron letras y cuantos fueron otro tipo de caracteres...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cIngresar 	DB 0Ah, 0Dh, 'Ingrese un caracter: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	cDigitos	DB 0Ah, 0Ah, 0Dh, 'El total de digitos ingresados fue de $'
	cLetras		DB 0Ah, 0Dh, 'El total de letras ingresados fue de $'
	cEspeciales	DB 0Ah, 0Dh, 'El total de caracteres especiales ingresados fue de $'
	vCont		DB 00h
	
.CODE
	inicio: 
		mov ax, @Data					;Se mandan los datos al 
		mov ds, ax						;segmento de datos
		
		mov dx, offset cNombreAlumno	;Se manda a pantalla la
		mov ah, 09h						;cadena de texto cNombreAlumno
		int 21h

		mov dx, offset cDescrip			;Se manda a pantalla la
		mov ah, 09h						;cadena de texto cDescrip
		int 21h
		
		eLeer:
			cmp vCont, 0Ah 				;Hace la comparacion para que se ejecute 10 veces la lectura
										;de los caracteres
			jae eSalida					;if(vCont <= 10)
			
			inc vCont					;Incrementa en uno el contador (vCont++)
			
			mov dx, offset cIngresar	;Se manda a pantalla la
			mov ah, 09h					;cadena de texto cIngresar
			int 21h
			
			mov ah, 01h 				;Se lee el caracter y se guarda en al
			int 21h	

;-----------------------------------------------------	
;Se hace de esta manera para que siempre se puedan comparar todos
		eComparar:
			cmp al, '0'
			jb  eEspeciales				;if(al < 0) Compara en codigo ASCII
		
			cmp al, '9'					
			jbe eDigitos				;if(al <= 9) Compara en codigo ASCII
			
			cmp al, 'A'
			jb  eEspeciales				;if(al < A) Compara en codigo ASCII
			
			cmp al, 'Z'					;if(al < Z) Compara en codigo ASCII
			jbe eLetras
			
			cmp al, 'a'					
			jb  eLetras					;if(al <= 9) Compara en codigo ASCII
			
			cmp al, 'z'
			jbe eLetras					;if(al <= 9) Compara en codigo ASCII
			ja  eEspeciales				;if(al > 9) Compara en codigo ASCII
;-----------------------------------------------------
			
		eDigitos:						;Cuando es un dìgito
			inc bh						;incrementa bh (bh++)
			jmp eLeer				
			
		eLetras:						;Cuando es una letra
			inc bl						;incrementa bl (bl++)
			jmp eLeer
			
		eEspeciales:					;Cuando es un caracter especial 
			inc ch 						;incrementa ch (ch++)
			jmp eLeer
			
		eSalida:
			mov ah, 09h					;Se manda a pantalla la
			mov dx, offset cDigitos		;cadena de texto cDigitos
			int 21h
			
			mov ah, 02h					;Imprime la cantidad de digitos ingresados
			mov dl, bh
			add dl, 30h
			int 21h
			
			mov ah, 09h					;Se manda a pantalla la
			mov dx, offset cLetras		;cadena de texto cLetras
			int 21h
			
			mov ah, 02h					;Imprime la cantidad de letras ingresados
			mov dl, bl
			add dl, 30h
			int 21h
			
			mov ah, 09h					;Se manda a pantalla la
			mov dx, offset cEspeciales	;cadena de texto cEspeciales
			int 21h
			
			mov ah, 02h					;Imprime la cantidad de caracteres especiales ingresados
			mov dl, ch
			add dl, 30h
			int 21h
		
		eFinProg:
			mov ah, 09h					;Se manda a pantalla la
			mov dx, offset cFinProg		;cadena de texto cFinProg
			int 21h

			mov ah, 08h					;Lee un caracter
			int 21h						;simula un Console.ReadKey				

		mov ax, 4c00h					;Regresar el control al DOS
		int 21h
			
	END inicio