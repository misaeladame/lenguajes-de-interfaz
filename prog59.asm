;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

;Prog59.asm
;Tarea 2.17
;Programa en ensamblador el cual lee una serie de numeros y termina cuando la suma
;de estos es maayor o igual a 50...
;Al final, el programa muestra la suma de los numeros ingresados y la cantidad de 
;estos
;Si el caracter ingresado no es numero, este no es tomado en cuenta ni para la suma
;ni para la cantidad de numeros ingresados.

Datos MACRO							;MACRO de Datos
	mov ax, @Data 					;Se mandan los datos al
	mov ds, ax						;segmento de datos
ENDM

Mensaje MACRO cadena				;MACRO para mostrar un mensaje
	mov ah, 09h						;Se manda a pantalla la
	mov dx, offset cadena			;cadena de texto recibida
	int 21h
ENDM

ReadKey MACRO						;MACRO para leer un caracter
	mov ah, 08h						;Se lee el caracter y se guarda en al
	int 21h							;pero no aparece lo que ingresas
ENDM

LeerDigito MACRO 					;MACRO para leer un caracter (digito)
	mov ah, 01h						;Se lee el caracter y se guarda en al
	int 21h							;pero si aparece lo que ingresas
ENDM

Control MACRO						;MACRO de Control al DOS
	mov ax, 4c00h 					;Regresa el control al DOS
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	cNombreAlumno DB 'Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL'
			      DB 0Ah, 0Ah, 0Dh, '$'
	cDescripcion  DB 'Programa que lee una serie de numeros y termina cuando la suma '
			      DB 'de estos es mayor o igual a 50'
				  DB 0Ah, 0Dh, '$'    	
	cIngresar	  DB 0Ah, 'Ingrese un numero: $'
	cFinProg  	  DB 0Ah, 0Ah, 0Dh, '--------- FIN DEL PROGRAMA ---------$'
	vCont		  DB 00h
	vSuma		  DB 00h
	cNoValido	  DB 0Ah, 'El caracter ingresado no es un numero $'
	cSuma		  DB 0Ah, 0Ah, 'La suma de los numeros ingresados es de $'
	cCont		  DB 0Ah, 'El total de numeros ingresados es de $'
	
.CODE
	inicio: 
		Datos								;Llama a la Macro Datos
		
		Mensaje cNombreAlumno 				;Muestra la cadena de texto cNombreAlumno
		Mensaje cDescripcion				;Muestra la cadena de texto cDescripcion
		
		eIngresar:
			Mensaje cIngresar				;Muestra la cadena de texto cIngresar
		
			LeerDigito						;Lee el numero
			
			cmp al, 30h						;if(al < 30h) Compara si es menor que 0 en ASCII
			jb  eNoValido 					;salta al ciclo eNoValido
			
			cmp al, 39h 					;if(al > 39h) Compara si es mayor que 9 en ASCII
			ja	eNoValido					;salta al ciclo eNoValido
			
			jmp eContinuar					;Salta al ciclo eContinuar
			
		eNoValido:
			Mensaje cNoValido				;Muestra la cadena de texto cNoValido
			
			jmp eIngresar					;Salta al ciclo eIngresar
			
		eContinuar:
			inc vCont						;vCont++ (incrementa en uno el valor de vCont)
			sub al, 30h						;Resta 30h a al, para mantener el valor del dìgito
			add vSuma, al 					;Suma a vSuma lo de al
			
			cmp vSuma, 50					;if(vSuma < 50) Compara si es mayor a 50
			jb  eIngresar					;Salta al ciclo eIngresar
			
		eSalida:
			Mensaje cSuma					;Muestra la cadena de texto cSuma
			
			mov ax, 00h
			mov al, vSuma
			
			aam								;Ajusta el carreo de la Suma total (cuando es mayor a 9)
											
			mov bx, ax						
			
			mov ah, 02h
			mov dl, bh						;Mostrar la decena de la suma
			add dl, 30h
			int 21h
			
			mov ah, 02h
			mov dl, bl						;Mostrar la unidad de la suma
			add dl, 30h
			int 21h
			
			Mensaje cCont					;Muestra la cadena de texto cCont

			mov ax, 00h
			mov al, vCont
			
			aam								;Ajusta el carreo del contador (cuando es mayor a 9)
											
			mov bx, ax				
			
			mov ah, 02h
			mov dl, bh						;Mostrar la decena del contador
			add dl, 30h
			int 21h
			
			mov ah, 02h
			mov dl, bl						;Mostrar la unidad del contador
			add dl, 30h
			int 21h
				
		eFinProg:
			Mensaje cFinProg				;Muestra la cadena de texto cFinProg
			ReadKey							;Lee un caracter, simula un Console.ReadKey
			Control							;Llama a la MACRO Control
			
	END inicio