;Prog09.asm
;Programa ensamblador el cual lee un caracter desde teclado y
;al final lo muestra en pantalla...
;A diferencia de los programas previos, este programa utiliza una variable 
;para guardar el caracter ingresado
;al final indica si el caracter ingresado es o no es un digito
.MODEL SMALL
.STACK 20h
.DATA
	cDescrip  DB 'Programa que lee un caracter y al final indica '
	          DB 'si el caracter ingresado es o no es un digito'
			  DB 0Ah,0dh,0ah,'$'    
	cIngresar DB 'Ingrese un caracter: $'
	cSiEsDig  DB 0Ah, 'El caracter ingresado ES un digito $'
	cNoEsDig  DB 0ah, 'El caracter ingresado NO es un digito $'
	
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
		
		mov ah,01h ;Se lee el caracter desde el teclado
		int 21h	
		
		cmp al,'0'      
		jb eNoEsDig	;Salta si es igual

		cmp al,'9'
		jbe eSiEsDig
		
		
		eNoEsDig:
			mov ah,09h
			mov dx, offset cNoEsDig
			int 21h
			jmp eFinProg
		
		eSiEsDig: 
			mov ah,09h
			mov dx, offset cSiEsDig
			int 21h
			jmp eFinProg
		
		eFinProg:
			mov ah, 08h				
			int 21h		

		mov ax, 4c00h
		int 21h
		
	END inicio