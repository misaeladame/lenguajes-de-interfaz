;Prog34.asm
;Programa en ensamblador el cual lee una cadena de caracteres y al final indica la 
;cantidad de palabras que componen dicha cadena

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip	DB 'Programa que lee una cadena de caracteres y al final indica '
			    DB 'cuantas palabras hay en la cadena ingresada'
				DB 0Ah, 0Dh, 0ah, '$'    	
	cIngresar	DB 0Ah, 'Ingrese una cadena de texto: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	cPalabras	DB 0Ah, 'La cantidad de palabras en la cadena es de $'
	vBlancos	DB 00h
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		mov ah, 09h 
		mov dx, offset cIngresar
		int 21h
		
		eIngresar:	
			mov ah, 01
			int 21h
			
			cmp al, ' '
			je  eIncrementarBlancos
			
			cmp al, 0Dh
			jmp eIngresar
			jmp eSalida
			
		eIncrementarBlancos:
			inc vBlancos
			jmp eIngresar
			
		eSalida:
			mov ah, 09h
			mov dx, offset cPalabras
			int 21h 
			
			mov ah, 02h
			mov dl, vBlancos 
			add dl, 30h
			add dl, 01h
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