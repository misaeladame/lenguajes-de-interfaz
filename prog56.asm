;Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

;prog56.asm
;Programa en lenguaje ensamblador mediante el cual se dibujen en la consola del 
;DOS 16 barras de colores (8 colores básicos y 8 colores con brillo).

Pinta MACRO Color, eIni, eFin
	mov ah, 06h
	mov al, 00h
	mov bh, Color 
	mov cx, eIni
	mov dx, eFin
	int 10h
ENDM

Datos MACRO
	mov ax, @Data 
	mov ds, ax
ENDM

ReadKey MACRO
	mov ah, 08h				
	int 21h
ENDM

Mensaje MACRO cadena
	mov ah, 09h
	mov dx, offset cadena
	int 21h
ENDM

Control MACRO
	mov ax, 4c00h 
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
	vContador 	  DB 00h
	cNombreAlumno DB 0Ah, 0Dh, 'Autor: 18131209 - ADAME SANDOVAL JOSE MISAEL$'
	cFinProg  	  DB 0Ah, 0Ah, 0Dh, '--------- FIN DEL PROGRAMA ---------$'
.CODE
	inicio: 
		Datos
		Pinta 07h, 0000h, 184Fh ;limpia la pantalla
		
		mov dl, 05h
		
		eDibujar:
			add bh, 10h
			add cl, 05h
			add dl, 05h
			
			Pinta bh, cx, dx
			
			inc vContador
			
			cmp vContador, 0Fh
			jb eDibujar
			
		eFinProg:
			ReadKey
			Mensaje cNombreAlumno
			Mensaje cFinProg
			Control
			
	END inicio