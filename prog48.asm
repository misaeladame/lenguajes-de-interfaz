;prog48.asm
;Programa en ensamblador el cual dibuja una barra horizontal creciente

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

Control MACRO
	mov ax, 4c00h 
	int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA

.CODE
	inicio: 
		Datos
		Pinta 07h, 0000h, 184Fh ;limpiamos la pantalla
		Pinta 17h, 0000h, 1800h ;azul
		
		eCrece:
			ReadKey
			add cl, 01h
			add dl, 01h
			Pinta bh, cx, dx
			cmp dl, 4Fh
			jb  eCrece

		ReadKey
		Control
			
	END inicio