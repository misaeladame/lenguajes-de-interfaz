;Prog10.asm
;Programa ensamblador el cual lee un caracter desde teclado y
;al final indica si el caracter ingresado es o no es una letra...
.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee un caracter y al final indica '
	         	DB 'si el caracter ingresado es o no es una letra'
				DB 0Ah,0dh,0ah,'$'    					
	cIngresar 	DB 'Ingrese un caracter: $'
	cSiEsLetra	DB 0Ah, 'El caracter ingresado ES una letra $'
	cNoEsLetra 	DB 0ah, 'El caracter ingresado NO es una letra $'
	
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov dx, offset cDescrip
		mov ah, 09h
		int 21h
		
		mov dx, offset cIngresar
		mov ah, 09h
		int 21h
		
		mov ah,01h 	;Se lee el caracter desde el teclado
		int 21h	
		
		cmp al, 'A'     
		jb eNoEsLetra	;Salta si es igual

		cmp al,'Z'
		jbe eSiEsLetra

		cmp al, 'a'     
		jb eNoEsLetra	;Salta si es igual

		cmp al,'z'
		jbe eSiEsLetra

		jmp eNoEsLetra
		
		
		eNoEsLetra:
			mov ah,09h
			mov dx, offset cNoEsLetra
			int 21h
			jmp eFinProg
		
		eSiEsLetra: 
			mov ah,09h
			mov dx, offset cSiEsLetra
			int 21h
			jmp eFinProg
		
		eFinProg:
			mov ah, 08h				
			int 21h		

		mov ax, 4c00h
		int 21h
		
	END inicio