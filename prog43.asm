;prog43.asm
;Programa en ensamblador el cual limpia la pantalla y pinta 8 rectangulos
;"interiores" (uno màs pequeño que otro)...

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
		
		mov bh, 00h
		mov ch, 00h
		mov cl, 00h
		mov dh, 18
		mov dl, 4Fh

		eCiclo:
			Pinta bh, cx, dx
			add bh, 10h
			add ch, 01h
			add cl, 05h
			sub dh, 01h
			sub dl, 05h
			cmp bh, 80h
			jb  eCiclo
		
		ReadKey
		Control
			
	END inicio