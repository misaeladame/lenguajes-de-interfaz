;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

;prog01.asm
;Tarea 2.01
;Primer programa en ensamblador, el cual muestra una cadena
;de caracteres en pantalla...
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo DB 'Hola chavos!$'
.CODE
	inicio: 
		mov ax, @Data				;Se mandan los datos al
		mov ds, ax					;segmento de datos
		
		mov dx, offset cSaludo		;Se manda a pantalla la
		mov ah, 09h					;cadena de texto cDescrip
		int 21h

		mov ah, 08h					;Lee un caracter
		int 21h						;simula un Console.ReadKey

		mov ax, 4c00h 				;Regresar el control al DOS
		int 21h
	END inicio