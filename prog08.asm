;Prog08.asm
;Programa en ensamblador el cual lee un caracter desde teclado y
;al final indica si el caracter ingresado es o no es una 'a'...
;A diferencia del prog07, este funciona correctamente al momento de detectar
;si el caracter no es una a

.MODEL SMALL
.STACK 20h
.DATA
	cDesc 		DB 'Programa que lee un caracter y al final indica si el caracter '
				DB 'ingresado es o no es una letra a'
				DB	0Ah,0Dh,0Ah,'$'
	cIngresar 	DB 'Ingrese un caracter: $'
	cSiEsA 		DB 0Ah,'El caracter ingresado ES una a $'
	cNoEsA 		DB 0Ah,'El caracter ingresado NO ES una a $'
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos
		mov ds, ax					;al segmento de datos
		
		mov dx, offset cDesc		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDesc
		int 21h
		
		mov dx, offset cIngresar	;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cIngresar
		int 21h
		
		mov ah, 01h					;Se lee el caracter ingresado
		int 21h
		
		cmp al, 'a'					;if(al  61h)
		je eSiEsA					;Si es igual, entonces salta a eSiEsA
		
		mov dx, offset cNoEsA		;Cuando no se cumple la parte verdadera
		mov ah, 09h					;Se ejecuta la linea de codigo siguiente
		int 21h
		jmp eFinProg
		
		eSiEsA:
			mov dx, offset cSiEsA
			mov ah, 09h
			int 21h
			
		eFinProg:
		mov ah, 08h					;Lee un caracter		
		int 21h						;Simula un Console.ReadKey

		mov ax, 4c00h				;Regresar el control al DOS
		int 21h
	END inicio