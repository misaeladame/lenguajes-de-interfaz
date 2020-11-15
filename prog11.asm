;Prog11.asm
;Programa en ensamblador el cual lee un caracter desde teclado y
;al final indica si el caracter ingresado es o no es una letra mayùscula
;o minuscula...

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que lee un caracter y al final indica '
	         	DB 'si el caracter ingresado es o no es una letra mayuscula '
				DB 'o minuscula'
				DB 0Ah,0dh,0ah,'$'    					
	cIngresar 	DB 'Ingrese un caracter: $'
	cSiEsMinus	DB 0Ah, 'El caracter ingresado ES una LETRA minuscula$'
	cSiEsMayus  DB 0Ah, 'El caracter ingresado ES una LETRA MAYUSCULA$'
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
		
		mov ah,01h 		;Se lee el caracter desde el teclado
		int 21h	
		
		cmp al, 'A'         ;if('A<=al<='z')                                                      
        jb eNoEsLetra
		
        cmp al, 'Z'                                                               
        jbe eSiEsMayus
		
        cmp al, 'a'                                                               
        jb eNoEsLetra 
		
        cmp al, 'z'                                                               
        jbe eSiEsMinus
        jmp eNoEsLetra		
		
		eNoEsLetra:
		    mov ah,09h
			mov dx, offset cNoEsLetra
			int 21h
			jmp eFinProg
		
		eSiEsMinus: 
		    mov ah,09h
		    mov dx, offset cSiEsMinus
		    int 21h
		    jmp eFinProg
		
		eSiEsMayus: 
		    mov ah,09h
		    mov dx, offset cSiEsMayus
		    int 21h
		    jmp eFinProg
			
		eFinProg:
		    mov ah, 08h				
		    int 21h		

		    mov ax, 4c00h
		    int 21h
		
	END inicio