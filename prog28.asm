;Prog28.asm
;Programa en ensamblador el cual muestra la tabla del numero 8

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que muestra la tabla del 8...'
				DB 0Ah, 0Dh, 0ah, '$'    			
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	cOchoPor	DB 0Ah, 0Dh, '8 X $'
	cIgual		DB ' = $'
	vCont		DB 01h
	vDecSuma	DB 00h
	vUniSuma	DB 00h
	
	;				8 X 1 = 8
	;				8 X 2 = 16
	;				8 X 3 = 24
	;				8 X 4 = 32
	;				8 X 5 = 40
	;				8 X 6 = 48
	;				8 X 7 = 56
	;				8 X 8 = 64
	;				8 X 9 = 72
	;				8 X 10 = 80
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		eTabla:
			mov dx, offset cOchoPor		;Se manda a pantalla la
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
			add al, 08
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