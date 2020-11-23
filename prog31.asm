;Prog31.asm
;Programa en ensamblador el cual muestra la tabla del numero ingreado por el 
;usuario 
;Se toma como base el prog30.asm

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip 	DB 'Programa que muestra la tabla de multiplicar del numero'
				DB ' ingresado por el usuario...'
				DB 0Ah, 0Dh, 0ah, '$'    	
	cIngresar	DB 'Ingrese el numero del cual desea conocer su tabla: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	cPor		DB ' X $'
	cIgual		DB ' = $'
	vCont		DB 01h
	vDecSuma	DB 00h
	vUniSuma	DB 00h
	vNum		DB 00h
	
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
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vNum, al
		
		
		eTabla:
			mov ah, 02h
			mov dl, 0Ah
			int 21h
		
			mov ah, 02h 
			mov dl, vNum
			add dl, 30h 
			int 21h
		
			mov dx, offset cPor			
			mov ah, 09h					
			int 21h
			
			mov ah, 02h
			mov dl, vCont
			add dl, 30h
			int 21h	
			
			mov ah, 09h
			mov dx, offset cIgual
			int 21h
			
			mov ax, bx
			add al, vNum
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