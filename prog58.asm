;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

;prog58.asm
;Tarea 2.14
;Programa en lenguaje ensamblador el cual lee 2 números de 1 cifra cada uno y que le solicite 
;al usuario si desea sumarlos o restarlos.
;Incluye el código correspondiente para que el programa se pueda ejecutar con un doble click 
;(simulación de ReadKey al finalizar el programa).

Datos MACRO							;MACRO de Datos
	mov ax, @Data 					;Se mandan los datos al
	mov ds, ax						;segmento de datos
ENDM

Mensaje MACRO cadena				;MACRO para mostrar un mensaje
	mov ah, 09h						;Se manda a pantalla la
	mov dx, offset cadena			;cadena de texto recibida
	int 21h
ENDM

SumaDigitosValidar MACRO			;MACRO para validar los digitos de la suma
	sub al, 30h						;Resta 30h para mantener el digito
	
	cmp al, 00h						;if(al < 0)
	jb eErrorDigitosSuma			;Salta a un ciclo en donde muestra un error
	
	cmp al, 09h						;if(al > 0)
	ja eErrorDigitosSuma			;Salta a un ciclo en donde muestra un error
ENDM

RestaDigitosValidar MACRO			;MACRO para validar los digitos de la suma
	sub al,30h						;Resta 30h para mantener el digito
	
	cmp al, 00h						;if(al < 0)
	jb eErrorDigitosResta			;Salta a un ciclo en donde muestra un error
	
	cmp al, 09h						;if(al > 0)
	ja eErrorDigitosResta			;Salta a un ciclo en donde muestra un error
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
	cNombreAlumno      DB 'Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL'
					   DB 0Ah, 0Ah, 0Dh, '$'
	cDescripcion       DB 'Programa que lee dos numeros de una cifra (un digito) cada uno y solicita'
			           DB ' al usuario si desea sumarlos o restarlos.'
			           DB 0Ah, 0Dh, 0Ah,'$'
	cIngresarResta     DB 'Tecla R: Resta'
				       DB 0Ah, 0Dh, '$'
	cIngresarSuma	   DB 'Tecla S: Suma'
					   DB 0Ah, 0Dh, '$'
	cIngresarDigito    DB 0Ah, 0Dh, 'Ingrese un digito: $'
	cSalidaSuma        DB 0Ah, 0Dh, 'La suma de los digitos ingresados es de: $'
	cSalidaResta       DB 0Ah, 0Dh, 'La resta de los digitos ingresados es de: $'
	cErrorOperador     DB 0Ah, 0Dh, 'La tecla ingresada es invalida, ingresa nuevamente'
			           DB 0Ah, 0Dh, 0Ah,'$'
	cErrorDigito       DB 0Ah, 0Dh, 'El caracter ingresado no es un digito, ingrese solamente digitos'
			           DB 0Ah, 0Dh, 0Ah,'$'
	cFinProg  	       DB 0Ah, 0Ah, 0Dh, '--------- FIN DEL PROGRAMA ---------$'
	vSuma              DB 00h
	vResta             DB 00h
	
.CODE
	inicio:
		Datos								;Llama a la Macro Datos
		
		Mensaje cNombreAlumno 				;Muestra la cadena de texto cNombreAlumno
		Mensaje cDescripcion				;Muestra la cadena de texto cDescripcion
	
		eLeer:
			Mensaje cIngresarResta			;Muestra la cadena de texto cIngresarResta
			Mensaje cIngresarSuma			;Muestra la cadena de texto cIngresarSuma
			
			ReadKey							;Llama a la MACRO ReadKey
			
			cmp al, 'R'						;if(al == 'R') Compara si es una R
			je eResta						;Salta al ciclo eResta
			
			cmp al, 'S'						;if(al == 'S')
			je eSuma						;Salta al ciclo eSuma
			jne eErrorOperador				;if(al != 'S') 
											;Salta al ciclo eErrorOperador
			
		eSuma:
			Mensaje cIngresarDigito			;Muestra la cadena de texto cIngresarDigito
			LeerDigito						;Lee el primer Digito
			SumaDigitosValidar				;Llama a la macro SumaDigitosValidar
			
			add vSuma, al					;Suma en vSuma lo de al
			
			Mensaje cIngresarDigito			;Muestra la cadena de texto cIngresarDigito
			LeerDigito						;Lee el segundo Digito
			SumaDigitosValidar				;Llama a la macro SumaDigitosValidar
			
			add vSuma, al					;Suma en vSuma lo de al
			
			jmp eSalidaSuma					;Salta al ciclo eSalidaSuma
		
		eResta:
			Mensaje cIngresarDigito			;Muestra la cadena de texto cIngresarDigito
			LeerDigito						;Lee el primer Digito
			RestaDigitosValidar				;Llama a la macro RestaDigitosValidar
			
			add vResta, al					;Suma en vResta lo de al
			
			Mensaje cIngresarDigito			;Muestra la cadena de texto cIngresarDigito
			LeerDigito						;Lee el segundo Digito
			RestaDigitosValidar				;Llama a la macro RestaDigitosValidar
			
			sub vResta, al					;Resta en vResta lo de al
			
			jmp eSalidaResta				;Salta al ciclo eSalidaResta
		
		eErrorOperador:
			Mensaje cErrorOperador			;Muestra la cadena de texto cErrorOperador
			
			jmp eLeer						;Se regresa al ciclo eLeer
		
		eErrorDigitosSuma:
			Mensaje cErrorDigito			;Muestra la cadena de texto cErrorDigito
			
			mov vSuma, 00h					;Asigna el valor de vSuma en 00h
			jmp eSuma  						;Salta al ciclo eSuma
		
		eErrorDigitosResta:
			Mensaje cErrorDigito			;Muestra la cadena de texto cErrorDigito
			
			mov vResta, 00h					;Asigna el valor de vResta en 00h
			jmp eResta  					;Salta al ciclo eResta
		
		eSalidaResta:
			Mensaje cSalidaResta			;Muestra la cadena de texto cSalidaREsta
			
			mov ah, 02h						;Muestra el resultado de la resta
			mov dl, vResta
			add dl, 30h
			int 21h
			
			jmp eFinProg					;Salta al ciclo eFinProg
		
		eSalidaSuma:
			mov ax, vSuma					;Se asigna ax lo de vSuma
			aaa								;Funcion que permite el carreo de 
											;cuando la suma es mayor de 9
			mov bx, ax						;Se asigna bx lo de ax
		
			Mensaje cSalidaSuma				;Muestra la cadena de texto cSalidaSuma
			
			mov ah, 02h
			mov dl, bh						;Mostrar la decena de la suma
			add dl, 30h
			int 21h
			
			mov ah, 02
			mov dl, bl						;Mostrar la unidad de la suma
			add dl, 30h
			int 21h
    
		eFinProg:
			Mensaje cFinProg				;Muestra la cadena de texto cFinProg
			ReadKey							;Lee un caracter, simula un Console.ReadKey
			Control							;Llama a la MACRO Control
		
	END inicio