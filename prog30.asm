;Prog30.asm
;Programa en ensamblador el cual muestra la tabla del numero 9
;Es similar al prog28, solo que con la tabla del 9.

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que muestra la tabla del 9...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	cNuevePor	DB 0Ah, 0Dh, '9 X $'
	cIgual		DB ' = $'
	vCont		DB 01h
	vDecSuma	DB 00h
	vUniSuma	DB 00h
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		eTabla:
			mov dx, offset cNuevePor	;Se manda a pantalla la
			mov ah, 09h					;cadena de texto cOchoPor
			int 21h
			
			mov ah, 02h
			mov dl, vCont
			add dl, 30h
			int 21h	
			
			mov ah, 09h
			mov dx, offset cIgual
			int 21h
			
			mov ax, bx
			add al, 09
			aaa
			mov bx, ax
			
			mov vDecSuma, ah 
			mov vUniSuma, al
			
			mov ah, 02h
			mov dl, vDecSuma
			add dl, 30h
			int 21h
			
			mov ah, 02h
			mov dl, vUniSuma
			add dl, 30h
			int 21h
			
			inc vCont
			
			cmp vCont, 10
			jbe eTabla
		
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h

			mov ah, 08h					;Lee un caracter
			int 21h						;simula un Console.ReadKey				

		mov ax, 4c00h				;Regresar el control al DOS
		int 21h
			
	END inicio