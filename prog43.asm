;prog43.asm
;Programa en ensamblador el cual limpia la pantalla y pinta 8 barras
;"interiores" (uno màs pequeño que otro)...
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

		Pinta 	07h, 0000h, 184Fh
		Pinta   17h, 0105h, 174Ah
		Pinta   27h, 020Ah, 1645h
		Pinta	37h, 030Fh, 1540h
		Pinta	47h, 0414h, 143Bh
		Pinta	57h, 0519h, 1336h
		Pinta	67h, 061Eh, 1231h
		Pinta	77h, 0723h, 112Ch
		
		ReadKey
		Control
			
	END inicio