;Prog33.asm
;Programa en ensamblador el cual lee una serie de numeros y termina cuando la suma
;de estos es maayor o igual a 20...
;Al final, el programa muestra la suma de los numeros ingresados y la cantidad de 
;estos
;Si el caracter ingresado no es numero, este no es tomado en cuenta ni para la suma
;ni para la cantidad de numeros ingresados.

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip	DB 'Programa que lee una serie de numeros y termina cuandi la suma '
			    DB 'de estos es mayor o igual a 20'
				DB 0Ah, 0Dh, 0ah, '$'    	
	cIngresar	DB 0Ah, 'Ingrese un numero: $'
	cFinprog	DB 0Ah, 0Ah, '---- FIN DEL PROGRAMA ----$'
	vCont		DB 00h
	vSuma		DB 00h
	vDecSuma	DB 00h
	vUniSuma	DB 00h
	cNoValido	DB 0Ah, 'El caracter ingresado no es un numero $'
	cSuma		DB 0Ah, 'La suma de los numeros ingresados es de $'
	cCont		DB 0Ah, 'El total de numeros ingresados es de $'
	
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al 
		mov ds, ax					;segmento de datos
		
		mov dx, offset cDescrip		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h
		
		eIngresar:
			mov ah, 09h 
			mov dx, offset cIngresar
			int 21h
		
			mov ah, 01
			int 21h
			
			cmp al, 30h
			jb  cNoValido 
			
			cmp al, 39h 
			ja	eNoValido
			
			jmp eContinuar
			
		eNoValido:
			mov ah, 09h
			mov dx, offset cNoValido
			int 21h
			jmp cIngresar
			
		eContinuar:
			inc vCont
			sub al, 30h
			add vSuma, al 
			
			cmp vSuma, 20
			jb  eIngresar
			
		eSalida:
			mov ah, 09h
			mov dx, offset cSuma
			int 21h 
			
			mov ah, 02h
			mov dl, vSuma 
			add dl, 30h
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