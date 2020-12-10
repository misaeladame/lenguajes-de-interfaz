;prog49.asm
;Programa en ensamblador el cual dibuja una barra horizontal creciente o 
;decreciente, dependiendo de la tecla pulsada por el usuario

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

;ReadKey MACRO
;	mov ah, 08h				
;	int 21h
;ENDM

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
		
		eTecla:
			mov ah, 00h
			int 16h
			
			cmp ah, 4Bh
			je  eDecrece
			
			cmp ah, 4Dh
			je  eCrece
			
			Control
		
		eCrece:
			cmp cl, 4Fh 
			je  eTecla
			
			add cl, 01h
			add dl, 01h
			
			Pinta 17h, cx, dx
			
			jmp eTecla
			
		eDecrece:
			cmp cl, 00h
			je  eTecla
			
			Pinta 07h, cx, dx 
			
			sub cl, 01h
			sub dl, 01h
			
			jmp eTecla
			
	END inicio