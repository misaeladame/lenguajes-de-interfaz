;Prog07.asm
;Programa en ensamblador el cual lee un caracter desde teclado y
;al final indica si el caracter ingresado es o no es una letra 'a'

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip  DB 'Programa que lee un caracter y al final indica '
			  DB 'si el caracter ingresado es o no es una letra a'
			  DB 0Ah, 0Dh, 0Ah, '$' 
	cIngresar DB 'Ingrese un caracter: $'
	cSiEsA    DB 0Ah, 'El caracter ingresado ES una a $'
	cNoEsA    DB 0Ah, 'El caracter ingresado NO ES una a $'
	
.CODE
	inicio:
		mov ax, @Data            ;Se mandan los datos al
		mov ds, ax               ;segmento de datos      
		
		mov dx, offset cDescrip  ;Se manda a pantalla la
		mov ah, 09h		         ;cadena de texto cDescrip
		int 21h
		
		mov dx, offset cIngresar ;Se manda a pantalla la 
		mov ah, 09h              ;cadena de texto cIngresar
		int 21h
				
		mov ah, 01h              ;Se lee el caracter desde teclado
		int 21h
		
		cmp al, 61h              ;if(al     61h)
		je  eSiEsA
		
		mov ah, 09h
		mov dx, offset cNoEsA
		int 21h
		
		eSiEsA:
			mov ah, 09h
			mov dx, offset cSiEsA
			int 21h
			
		mov ah, 08h              ;Lee un caracter
		int 21h					 ;simula un Console.ReadKey
		
		mov ax, 4c00h	   	     ;Regresar el control al DOS
		int 21h		
	END inicio