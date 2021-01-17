;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

;prog61.asm
;Tarea 4.09
;Programa en lenguaje ensamblador mediante el cual se dibujen en la consola del DOS 
;una determinada cantidad barras de colores ingresado por el usuario (se sugiere 
;utilizar los 8 colores básicos y 8 colores con brillo).
;La cantidad de barras a mostrar será determinada por el ancho de cada barra.  
;El ancho de cada barra será el mismo entre ellas y deberá ser ingresado por el usuario 
;al momento de la ejecución.

Pinta MACRO Color, eIni, eFin		;MACRO de Pinta
	mov ah, 06h						;en bh se define el color
	mov al, 00h						;y se ingresan las coordenadas de fila y columna
	mov bh, Color 					;de inicio y final para el dibujo que se va a 
	mov cx, eIni					;hacer
	mov dx, eFin
	int 10h
ENDM

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
	vBarras		  DB 00h
	vAncho		  DB 00h
	cNombreAlumno DB 'Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL'
			      DB 0Ah, 0Ah, 0Dh, '$'
	cDescripcion  DB 'Programa mediante el cual se dibujen en la consola del DOS '
			      DB 'una determinada cantidad barras de colores'
				  DB 0Ah, 0Dh, '$'    
	cIngresar	  DB 0Ah, 0Dh, 'Ingrese el ancho de la barra: $'	
	cNoValido	  DB 0Ah, 0Dh, 'El caracter ingresado no es un numero$'	
	cFinProg  	  DB 0Dh, '--------- FIN DEL PROGRAMA ---------$'
.CODE
	inicio: 
		Datos
		Mensaje cNombreAlumno 				;Muestra la cadena de texto cNombreAlumno
		Mensaje cDescripcion				;Muestra la cadena de texto cDescripcion

		eIngresar:
			Mensaje cIngresar				;Muestra la cadena de texto cIngresar
		
			LeerDigito						;Lee el numero
			
			sub al, 30h
			
			cmp al, 01h						;if(al < 01h) Compara si es menor que 0 en ASCII
			jb  eNoValido 					;si es verdadero, salta al ciclo eNoValido sino 
											;continua con la ejecucion normal
			
			cmp al, 09h 					;if(al > 09h) Compara si es mayor que 9 en ASCII
			ja	eNoValido					;si es verdadero, salta al ciclo eNoValido sino 
											;continua con la ejecucion normal
			
			jmp eLimpiarPantalla			;Salta al ciclo eLimpiarPantalla
			
		eNoValido:
			Mensaje cNoValido				;Muestra la cadena de texto cNoValido
			
			jmp eIngresar					;Salta al ciclo eIngresar 
			
		eLimpiarPantalla:
			mov vAncho, al					;Almacena lo de vAncho en al 
			
			Pinta 07h, 0000h, 184Fh 		;Limpia la pantalla
			
			jmp eDibujar					;Salta al ciclo eContinuar
			
		eDibujar:
			add bh, 10h						;Cambia de color
			add cl, vAncho					;Incrementa 
		
			Pinta bh, cx, dx				;Dibuja una columna
			
			mov al, vBarras					;Almacena en al el valor de vBarras
			add al, vAncho					;Se hace una suma al = al + vAncho
			mov vBarras, al					;Almacena en vBarras el valor de al
			
			mov ah, 50h						;Se asigna 50h en ah
			sub ah, vAncho					;Se hace una resta ah = ah - vAncho
											;para que se dibujen de manera exacta
											;las barras
			
			cmp vBarras, ah					;if(vBarras < ah) Compara si es menor que ah
			jb eDibujar						;si es verdadero salta al ciclo eDibujar sino 
											;continua con la ejecucion normal
											
		eFinProg:
			ReadKey							;Lee un caracter, simula un Console.ReadKey
			Pinta 07h, 1800h, 184Fh			;Pinta el ultimo renglon de color negro
			Mensaje cFinProg				;Muestra la cadena de texto cFinProg
			ReadKey							;Lee un caracter, simula un Console.ReadKey
			Control							;Llama a la MACRO Control
			
	END inicio