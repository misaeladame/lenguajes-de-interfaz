;prog42.asm
;Programa en ensamblador el cual limpia la pantalla y pinta 8 barras
;horizontales de diferente color..
;A diferencia del prog41, solo que ahora en lugar de "columnas", pintamos
;"renglones"

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
	cSaludo    DB 'Hola chavos!$'
	cDespedida DB 0Ah, 0Dh, 'Adios$'
.CODE
	inicio: 
		Datos

		Pinta 	07h, 0000h, 024Fh
		Pinta   17h, 0300h, 054Fh
		Pinta   27h, 0600h, 084Fh
		Pinta	37h, 0900h, 0B4Fh
		Pinta	47h, 0C00h, 0E4Fh
		Pinta	57h, 0F00h, 114Fh
		Pinta	67h, 1200h, 144Fh
		Pinta	77h, 1500h, 174Fh
		
		ReadKey
		Control
			
	END inicio